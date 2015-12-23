#
# Cookbook Name:: host-entry
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#template '/tmp/hosts' do	
 #source 'hosts.erb'
#end

node['hosts'].each do |ipaddress,hostname|
execute 'hosts append' do
	command  "echo  #{ipaddress} #{hostname} >> /etc/hosts"
	not_if "grep #{ipaddress} /etc/hosts"
	end   
 #   command 'rm -rf /tmp/hosts'
end