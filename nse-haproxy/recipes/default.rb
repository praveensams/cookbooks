#
# Cookbook Name:: nse-Haproxy
# Recipe:: default
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#

#Install Haproxy
package "haproxy" do 
	action :install
end


#Configuration file 
template '/etc/haproxy/haproxy.cfg' do
	source "haproxy.erb"
	mode "0644"
	owner "root"
	group "root"
	notifies :restart, 'service[haproxy]', :immediately
end



#Service start
service "haproxy" do
	action [ :enable, :start ]
end
