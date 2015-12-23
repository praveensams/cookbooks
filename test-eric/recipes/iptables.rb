template "/opt/scripts_iptables.sh" do 
	source "iptables.erb"
	mode '0744'
	owner 'root'
	group 'root'
 end
 
 service "iptables" do
	#supports :status => true, 
	action [ :enable, :restart ]
end

execute "iptables" do 
	command "/bin/bash /opt/scripts_iptables.sh"
end
