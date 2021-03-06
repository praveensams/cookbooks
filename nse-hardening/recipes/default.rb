#
# Cookbook Name:: nse-hardening
# Recipe:: default
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#
#


############### Taking configuration file Backup #####################################################


execute "Backup" do
	command <<-EOH
	cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config`date +%d%m%y`
	cp -rf /etc/ssh/ssh_config /etc/ssh/ssh_config`date +%d%m%y`
	cp -rf /etc/sudoers /etc/sudoers`date +%d%m%y`
	EOH
	not_if '[  -f /etc/ssh/sshd_config`date +%d%m%y` -a  -f /etc/ssh/ssh_config`date +%d%m%y` -a -f  /etc/sudoers`date +%d%m%y` ]'
end


template "/etc/ssh/ssh_config" do
	source "ssh_config.erb"
	action :create
end


template "/etc/ssh/sshd_config" do
	source "sshd_config.erb"
	action :create
end


#################### Yum Remove unwanted package #########################################################


#node['yum']['remove_package'].each do |pack|
#	package pack do
#		action :remove
#	only_if "dpkg -l | grep -w ^#{pack}"
#	end
#end

###################### Yum package update ##################################################


#node['yum']['install_package'].each do |pack|
#	package pack do
#		action :install
#	only_if "yum list all | grep -w ^#{pack}"
#	end
#end


###################  Unwanted services ###############################################################

node['services']['unwanted'].each do |service|
	execute 'services' do
		command "chkconfig #{service} off"
	only_if "chkconfig --list | grep #{service}"
	end
end

#################### Sudoers file ###################################################################

template "/etc/sudoers" do
source "sudoers.erb"
	action :create
	only_if "#{node['server']['sudo_enable']} =~ /[a-z]+/"
end

################## Creating Disk Partition ##############################################################################

if node['server']['type'] =~ /db/

bash "Disk partition" do
	puts "Dba disk creation"
	code <<-EOH
	( echo -e "o\nn\np\n1\n\n\nw" )  | fdisk  #{node['disk']['device']}
	mkfs -j #{node['disk']['partition']} 
	mkdir -p #{node['disk']['label']}
	mount #{node['disk']['partition']} #{node['disk']['label']}
	echo -e "\/#{node['disk']['partition']}\t\t#{node['disk']['label']}\t\t\text4\t\tdefaults,notime  \t0 0" >> /etc/fstab
	EOH
	not_if "fdisk -l | grep #{node['disk']['partition']}"
end

else

bash "Disk partition" do
	code <<-EOH
	( echo -e "o\nn\np\n1\n\n\nw" )  | fdisk  #{node['disk']['device']}
	mkfs -j #{node['disk']['partition']} 
	mkdir -p #{node['disk']['label']}
	mount #{node['disk']['partition']} #{node['disk']['label']}
	echo -e "\/#{node['disk']['partition']}\t\t#{node['disk']['label']}\t\t\text4\t\tdefaults\t0 0" >> /etc/fstab
	EOH
	not_if "fdisk -l | grep #{node['disk']['partition']}"
end

end
################## Banners ###############################################################################	

banners="#{node['ssh']['banners']}"


template '/etc/banners' do
	source "banners.erb"
	action :create
	not_if "cat /etc/banners | grep -i pearson"
end 



###################### Swap Creation ######################################

bash "swap creation" do
	code <<-EOH
	s="`free -mt | perl -ne 'if(/(Mem:)(\s+)([0-9]+)(.*)/) {print $3*1.5}'`"
	dd if=/dev/zero of=/usr/local/swap bs=1M count=$s
	mkswap /usr/local/swap
	swapon  /usr/local/swap
	EOH
	not_if "[ -f /usr/local/swap ]"
end

