# Redis configuration 
# case node["platform"]
# when "debian", "ubuntu"

# 	#backup redis-conf 
# 	execute "redis-conf" do
# 	#	command "cp /etc/redis/redis.conf /etc/redis/redis.conf.`(date "+%H:%M:%S:%Y%m%d")`"
# 	end
# 	# change bind ip to eth0	
# 	execute "redis-conf" do 
# 		command "if  grep '127.0.0.1' /etc/redis.conf ; then IP=`(ip a | grep eth0 | grep inet | awk '{print $2}' | cut -f1 -d'/')`  | sed -i -r  's/127.0.0.1/$IP/g' /etc/redis.conf ; fi"
# 	notifies :restart, 'service[redis-server]', :delayed	
# 	end
# 	#Set random password
# 	execute "redis-conf" do 
# 		command "if grep foobared /etc/redis/redis.conf ; then sed -i -r 's/#requirepass foobared/requirepass `pwgen -1`/g' /etc/redis/redis.conf ; fi"
# 	end

# when "redhat", "centos", "fedora"
	#backup redis-conf
	##execute "redis-conf" do
	#	command "cp /etc/redis.conf /etc/redis.conf.`(date "+%H:%M:%S:%Y%m%d")`"
	##end

	# # change bind ip to eth0
	# execute "redis-conf" do  
	# 	command "if  grep '127.0.0.1' /etc/redis.conf ; then IP=`(ip a | grep eth0 | grep inet | awk '{print $2}' | cut -f1 -d'/')`  | sed -i -r  's/127.0.0.1/$IP/g' /etc/redis.conf ; fi"
	# end

	# #Set random 
	# execute "redis-conf" do 
	# 	command "if grep foobared /etc/redis.conf ; then sed -i -r 's/#requirepass foobared/requirepass `pwgen -1`/g' /etc/redis.conf ; fi"
	# 	notifies :restart, 'service[redis]', :delayed
	# end
#end