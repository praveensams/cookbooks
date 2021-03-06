#
# Cookbook Name:: repo
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


###Centos repo

case node['platform']

	when "centos", "redhat"
	
		bash "centos repo" do
			code <<-EOH
			wget #{node['repo']['server_link']}/pearson.repo -P /etc/yum.repos.d/
			yum clean all
			yum list all
			EOH
			not_if  '[ -f  /etc/yum.repos.d/pearson.repo ]'  
		end

	when "ubuntu", "debien"

		bash "Ubuntu repo" do
			code <<-EOH
			wget  #{node['repo']['server_link']}/myrepo.gpg -P /etc/apt/trusted.gpg.d/
			wget  #{node['repo']['server_link']}/pearson.list -P /etc/apt/sources.list.d/
			apt-get update
			EOH
			not_if  '[ -f  /etc/apt/sources.list.d/pearson.list ]'  
		end

end
