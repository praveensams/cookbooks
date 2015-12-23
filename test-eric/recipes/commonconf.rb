# Redis configuration 
template "/etc/redis.conf" do 
	source "conf.erb"
	mode '0644'
	owner 'root'
	group 'root'
 	notifies :restart, 'service[redis]', :delayed
 end