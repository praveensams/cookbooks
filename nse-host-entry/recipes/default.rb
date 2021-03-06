#
# Cookbook Name:: nse-host-entry
# Recipe:: default
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#
#template '/tmp/hosts' do	
 #source 'hosts.erb'
#end


## Appends the host entry details in /etc/hosts

node['hosts'][ node['server']['env'] ][ node['server']['season'] ].each do |ipaddress,hostname|
execute 'hosts append' do
	command  "echo  #{ipaddress} #{hostname} >> /etc/hosts"
	not_if "grep #{ipaddress} /etc/hosts"
	end   
 #   command 'rm -rf /tmp/hosts'
end
