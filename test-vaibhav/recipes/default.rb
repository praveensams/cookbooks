#
# Cookbook Name:: test-vaibhav
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install mongodb

package “mongodb” do
    action :install
end

# start the mongodb service and works on reboot

service "mongodb" do
	supports :restart => :true
	action [:enable, :start]
end

# additional tasks to script in chef