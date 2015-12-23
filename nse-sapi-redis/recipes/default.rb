#
# Cookbook Name:: test-eric
# Recipe:: default
#
# Copyright 2015, Pearson English 
# All rights reserved - Do Not Redistribute




# Update repo. This is for CentOS
## Changed the condition location and commented ignore_failure
## NK & Praveen has edited this cookbook 

 bash 'redis-repo' do
 	code <<-EOH
 	wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
 	rpm -ivh epel-release-6-8.noarch.rpm
 	EOH
 	not_if "rpm -qa | grep epel"
##	 ignore_failure true
 end


# Install Redis Cache



package 'redis' do
	action :install
#	not_if do ::File.exists?("/usr/sbin/redis-server") end
end





service "redis" do
	#supports :status => true, 
	action [ :enable, :start ]
end

template '/etc/redis.conf' do
	source 'conf.erb'
	mode '0644'
	user 'root'
	group 'root'
	notifies :restart, 'service[redis]', :immediately
end

## Including the redis configuration recipe
#include_recipe  'nse-class-redis::redisconf'
