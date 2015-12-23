#
# Cookbook Name:: newrelic-sysmond
# Recipe:: default
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#

## This cookbook installs newrelic server monitoring agent on both Centos & Ubuntu. License key can be passed from environemnt's override attr
license_key=node['newrelic']['licensekey']
case node['platform_family']

	when 'debian', 'ubuntu' 
	bash 'Newrelic server monitoring installation on Ubuntu' do 
	code <<-EOH
	echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | sudo tee /etc/apt/sources.list.d/newrelic.list
	wget -O- https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -
	apt-get update
	apt-get install newrelic-sysmond -y
	nrsysmond-config --set license_key="#{license_key}"
	/etc/init.d/newrelic-sysmond start
	EOH
	not_if { ::File.exists?('/etc/apt/sources.list.d/newrelic.list') }
	end

	when 'rhel', 'centos'
	bash 'Newrelic server monitoring installation on Centos' do
	code <<-EOH
	rpm -Uvh https://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm
	yum install newrelic-sysmond -y
	/usr/sbin/nrsysmond-config --set license_key="#{license_key}"
	/etc/init.d/newrelic-sysmond start
	EOH
	not_if "service newrelic-sysmond status | grep running"
	end

end
# bash 'Newrelic server monitoring installation on Centos' do
# code <<-EOH
# echo 1
# rpm -Uvh https://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm
# echo 2
# yum install newrelic-sysmond -y 2 > /dev/null
# echo 3
# /usr/sbin/nrsysmond-config --set license_key=79e22e25ad7f6430d1aa9252e766c50c6b68d9c0
# echo 4
# /etc/init.d/newrelic-sysmond start
# echo 5
# EOH
# end
