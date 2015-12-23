#
# Cookbook Name:: test-balaji
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# this is a comment for version 0.2.0

# this is a recipe to install apache for poptropica

# httpd (centos)

# install httpd package

package “httpd” do
    version "2.4.12"
    action :install
end

# sets the httpd.conf file to a specific template already on chef server
# defines directory permissions and users

template "/etc/httpd/httpd.conf" do
	source "httpd.conf.cfb.erb"
	mode "0644"
	owner "root"
	group "root"
	notifies :restart, "service[httpd]"
end

# start the apache service and works on reboot

service "httpd" do
	supports :restart => :true
	action [:enable, :start]
end

# additional tasks to script in chef

