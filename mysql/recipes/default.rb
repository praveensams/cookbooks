#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "mkdir #{node[:mysql][:homedir]}" do
	not_if { File.exist?("#{node[:mysql][:homedir]}") }
end

execute "mv /etc/my.cnf /etc/my.cnf_old" do
	only_if { File.exist?("/etc/my.cnf") }
end

remote_file "/tmp/mysql.tar.gz" do
	source 'http//10.72.6.182/tars/mysql-5.6.23-linux-glibc2.5-x86_64.tar.gz'
	path "/tmp/mysql.tar.gz"
	not_if { File.exist?("/tmp/mysql.tar.gz") }
end

execute "Downloading source" do
	command <<-EOH
	tar -zxvf /tmp/mysql.tar.gz -C #{node[:mysql][:homedir]}/ 
	mv -f   #{node[:mysql][:homedir]}/mysql-5.6.23* #{node[:mysql][:homedir]}/mysql
	cp -rf  #{node[:mysql][:homedir]}/mysql  /usr/local/
	EOH
	not_if { ::File.exist?("/usr/local/mysql/bin/mysql")}  
end

var_dir = "#{node['mysql']['homedir']}/mysql/var"
var_log = "#{node['mysql']['homedir']}/mysql/var/log"

directory var_dir do
	owner "mysql"
	group "mysql"
	mode "0755"
	action :create
end

directory var_log do
	owner "mysql"
	group "mysql"
	mode "0755"
	action :create
end

group "mysql" do
	action :create
end

user "mysql" do
	gid "mysql"
	action :create
end

yum_package 'libaio' do
	action :install
end 

execute "Changing permission" do
	command <<-EOH
	chown -R mysql:mysql #{node[:mysql][:homedir]}/mysql
	cp -rf #{node[:mysql][:homedir]}/mysql/support-files/mysql.server /etc/init.d/mysqld
	EOH
end


bash "Copying_file" do
	code <<-EOH
	for i in "#{node['mysql']['homedir']}/mysql/bin/*"
	do	
		bas="`basename $i`"
		cp -rvf $i /usr/local/bin && chmod 755 /usr/local/bin/$bas && chown mysql:mysql /usr/local/bin/$bas
		cp -rvf $i /usr/bin && chmod 755 /usr/bin/$bas && chown mysql:mysql /usr/bin/$bas
		cp -rvf $i  /bin && chmod 755 /bin/$bas && chown mysql:mysql /bin/$bas
	done
	EOH
	
       not_if { ::File.exist?("/usr/local/bin/mysql")}
end

template "/etc/my.cnf" do
	source "my.cnf.erb"
	action :create
end

execute "Installing mysql" do
	command <<-EOH
	cd  #{node[:mysql][:homedir]}/mysql
	scripts/mysql_install_db --user=mysql
	cd /tmp
	EOH
	only_if do File.exists?('/usr/local/bin/mysql') end
end


service "mysqld" do
	action :start
end

execute "#{node[:mysql][:homedir]}/mysql/tmp/mysql.sock" do
	command <<-EOH
	cd  /tmp
	ln -s #{node[:mysql][:homedir]}/mysql/tmp/mysql.sock .
	EOH
	not_if do File.exists?('/tmp/mysql.sock') end
end

service "mysqld" do
	action :restart
end

