#
# Cookbook Name:: test-example
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# A sample cookbook to test functionality


# install httpd

package 'httpd' do
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
