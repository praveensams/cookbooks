#
# Cookbook Name:: test-patrick
# Recipe:: default
#
# Copyright 2015, Pearson Business English
#
# All rights reserved - Do Not Redistribute
#
# A sample cookbook to test functionality

# added mongodb recipe

# include_recipe 'mongodb'

# install apache2 (re-factored for httpd)

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

# template which will add mongoDB repo to local node

template '/etc/yum.repos.d/mongodb-org-3.0.repo' do
	source "mongodb-repo-config.erb"
	mode "0644"
	owner "root"
	group "root"
end

# pin mongodb to yum conf file (IMPORTANT: will overwrite default yum.conf)

template '/etc/yum.conf' do
	source "yum.conf.erb"
	mode "0644"
	owner "root"
	group "root"
end

# install MongoDB (re-factored for httpd)

package 'mongodb' do
    action :install
end

# additional tasks to script in chef