## Installs the nginx like "apt-get -q -y install nginx=1.8.0-1~utopic --force-yes"
package "nginx" do 
	version "1.8.0-1~utopic"
	options "--force-yes"
	action :install
end

## Including the configuration recipe
include_recipe 'nse-nginx::commonconf'