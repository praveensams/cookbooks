#
# Cookbook Name:: mongodb
# Author : Elliot
# Update : 2015-05-20
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#
bash 'mongo-repo' do
  code <<-EOH
  	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
	echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
	sudo apt-get update
  EOH
end


#install mongodb with apt-get command
bash 'mongo-install' do
	code <<-EOH
	sudo apt-get install -y mongodb-org=2.6.8 mongodb-org-server=2.6.8 mongodb-org-shell=2.6.8 mongodb-org-mongos=2.6.8 mongodb-org-tools=2.6.8
	EOH
end

#Configuration file /templates/default/mongo.erb
template '/etc/mongod.conf' do
	source "mongo.erb"
	mode "0644"
	owner "root"
	group "root"
end


#install mongodb with command dpkg
# bash 'mongo-install' do
# 	code <<-EOH
# 		dpkg -i mongodb-org_2.6.8_amd64.deb
# 		dpkg -i mongodb-org-shell_2.6.8_amd64.deb
# 		dpkg -i mongodb-org-mongos_2.6.8_amd64.deb
# 		dpkg -i mongodb-org-tools_2.6.8_amd64.deb
# 		dpkg -i mongodb-org-server_2.6.8_amd64.deb
# 	EOH
# end



# This code installing mongodb version 2.6.9(it should be 2.6.8)
# so comment this for a while until we get solution for this

# package ["mongodb-org", "mongodb-org-server", "mongodb-org-shell", "mongodb-org-mongos", "mongodb-org-tools"] do
# 	version "2.6.8"
# 	action :install
# end




service "mongod" do
	action [ :enable, :start ]
end
