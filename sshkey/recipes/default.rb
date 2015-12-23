#
# Cookbook Name:: sshkey
# Recipe:: default
#
# Author : Elliot
# Update : 22-05-2015
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#

# This cookbook runs only one time when server is created.
# Create user buildadmin, elavarasan

user 'buildadmin' do
	supports :manage_home => true
	home '/home/buildadmin'
	system true
	shell '/bin/bash'
end


user 'elavarasan' do
	supports :manage_home => true
	home '/home/elavarasan'
	system true
	shell '/bin/bash'
end


# grant sudo permission to user
# DO NOT USE THIS 
# template '/etc/sudoers' do
# 	source	'sudoers.erb'
# 	mode	'0440'
# 	owner	'root'
# 	group	'root'
# end

# create .ssh folder

bash 'sudo-config' do
	code <<-EOH
	echo 'buildadmin		ALL=(ALL:ALL)	NOPASSWD: ALL' >> /etc/sudoers
	echo 'elavarasan		ALL=(ALL:ALL)	NOPASSWD: ALL' >> /etc/sudoers
	EOH
	# not_if do
	# 	file.exists?("")
	# end
end

bash 'create_ssh_folder' do
	code <<-EOH
	mkdir /home/buildadmin/.ssh
	mkdir /home/elavarasan/.ssh
	EOH
end

# SSH key configuration for build team

template '/home/buildadmin/.ssh/authorized_keys' do
	source "buildadmin.erb"
	mode "0644"
	owner "root"
	group "root"
	not_if do 
		File.exists?('/home/buildadmin/.ssh/authorized_keys')
	end
end

template '/home/elavarasan/.ssh/authorized_keys' do
	source "elavarasan.erb"
	mode "0644"
	owner "root"
	group "root"
	not_if do 
		File.exists?('/home/elavarasan/.ssh/authorized_keys')
	end
end
