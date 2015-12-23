#
# Cookbook Name:: test-jungkoo
# Recipe:: default
#
# Copyright 2015, Pearson Business English
#
# All rights reserved - Do Not Redistribute
#
# A sample cookbook to test functionality


# Version 2 comment

# install apache2 (re-factor for httpd)

package “apache2” do
    action :install
end

# sets the httpd.conf file to a specific template already on chef server
# defines directory permissions and users

template "/etc/apache2/apache2.conf" do
	source "apache2.conf.cfb.erb"
	mode "0644"
	owner "root"
	group "root"
	notifies :restart, "service[apache2]"
end

# start the apache service and works on reboot

service "apache2" do
	supports :restart => :true
	action [:enable, :start]
end

# additional tasks to script in chef