## Nginx core configuration
template "/etc/nginx/nginx.conf" do
	source "conf.erb"
	mode '0644'
	owner 'root'
	group 'root'
	notifies :restart, 'service[nginx]', :delayed
end

## Nginx site configuration
template "/etc/nginx/conf.d/default.conf" do
  source 'sites.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :restart, 'service[nginx]', :delayed
end