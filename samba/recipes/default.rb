#
# Cookbook Name:: samba
# Recipe:: default
# Author : Elliot
# Update : 28-05-2015
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install Samba if it doesn't exist
# Samba already installed by default - Azure(Centos)
# Need to check other hosting service - AWS, myStack

# package 'samba' do 
# 	version ''
# 	action :Install
# 	not_if do
# 		File.exists?("")
# 	end
# end
# Config Samba

template '/etc/samba/smb.conf' do
	source "smb.erb"
	mode "0644"
	owner "root"
	group "root"
end

bash 'ad-join' do
	code <<-EOH
	sudo /usr/bin/net join -w CUST -S AD01S.CUST.GLOBALENGLISH.ORG -U ge_eson%Korea901
	EOH
end

# Config pam 

bash 'pam-config' do
	code <<-EOH
	echo 'require_membership_of = GEG_Administrator' >> /etc/security/pam_winbind.conf
	EOH
	# not_if do
	# 	file.exists?("")
	# end
end


# Config sudoers

bash 'sudo-config' do
	code <<-EOH
	echo '%CUST\\GEG_Administrator	ALL=(ALL)	ALL' >> /etc/sudoers
	EOH
	# not_if do
	# 	file.exists?("")
	# end
end

# Winbind service start


service "Winbind" do
	action [ :enable, :start ]
end

