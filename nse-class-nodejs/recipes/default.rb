#
# Cookbook Name:: nodejs
#
# Copyright 2015, Pearson English
#

# apt-get update, 
bash 'apt' do
	code <<-EOH
	apt-get update
	echo "ran update" > /root/a.txt
	EOH
	not_if do ::File.exists?("/root/a.txt") end
end



## Including the nodejs_from_source recipe
include_recipe "nse-class-nodejs::nodejs_from_#{node['nodejs']['install_method']}"


## Installing pm2 globally with condition using execute resource
execute "pm2" do 
	command "npm install pm2 -g"
	not_if do ::File.exists?("/usr/local/bin/pm2") end
end
  
## Installing grunt
execute "grunt" do 
	command "npm install grunt-cli -g"
	not_if do ::File.exists?("/usr/local/bin/grunt") end
end

## Installing bower
execute "bower" do 
	command "npm install bower -g"
	not_if do ::File.exists?("/usr/local/bin/bower") end
end
 
## Installing ruby
execute "ruby" do 
	command "apt-get install ruby-full -y"
	not_if do ::File.exists?("/usr/bin/ruby") end
end

## Installing sass
execute "sass" do 
	command "gem install sass"
	not_if do ::File.exists?("/usr/local/bin/sass") end
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