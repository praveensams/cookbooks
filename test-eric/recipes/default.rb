#
# Cookbook Name:: test-eric
# Recipe:: default
#
# Copyright 2015, Pearson English 
# All rights reserved - Do Not Redistribute


# Test by Eric 

# Update repo.

bash 'redis-repo' do
	code <<-EOH
	wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
	rpm -ivh epel-release-6-8.noarch.rpm
	EOH
end


# Install Redis Cache

package 'redis' do
	action :install
end

service "redis" do
	#supports :status => true, 
	action [ :enable, :start ]
end
## Including the configuration recipe
include_recipe  'test-eric::commonconf'

# include_recipe  'test-eric::iptables'