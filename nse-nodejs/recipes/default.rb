#
# Cookbook Name:: nodejs
#
# Copyright 2015, Pearson English
#

# apt-get update, 
#execute 'apt' do
#	command 'apt-get update'
#	action :run
#end


## Including the nodejs_from_source recipe
include_recipe "nse-nodejs::nodejs_from_#{node['nodejs']['install_method']}"


## Installing pm2 globally with condition using execute resource
execute "pm2" do 
	command "npm install pm2 -g"
	not_if do ::File.exists?("/usr/local/bin/pm2") end
end

## Gets the document root location from environment attr and pass it to pm2 startup script
document_root ="#{node['nodejs']['document_root']}"

## Pm2 startup script generation after deploying the code
if ::File.exists?("#{document_root}")
bash "Pm2 startup script" do
cwd "#{document_root}"
code <<-EOH
pm2 startup ubuntu
pm2 save
EOH
not_if { ::File.exists?('/etc/init.d/pm2-init.sh') }
end 
end
 

