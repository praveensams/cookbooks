template "/opt/dele_useless.sh" do 
	source "dele_useless_users.erb"
	mode '0700'
	owner 'root'
	group 'root'
 end

 execute "iptables" do 
	command "/bin/bash /opt/dele_useless.sh"
end
 