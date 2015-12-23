#
# Cookbook Name:: nse-keepalived
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'keepalived' do
        action :install
end

execute "conf backup" do
        command "mv /etc/keepalived/keepalived.conf /etc/keepalived/keepalived.conf_old"
end

template "/etc/keepalived/keepalived.conf" do
        source "keepalived.erb"
end

service "keepalived" do
        action :start
end

