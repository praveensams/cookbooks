template "/etc/ssh/sshd_config"  do 
	source "sshd_config.erb"
	mode '0600'
	owner 'root'
	group 'root'
 end

# add sshers group and users
execute "sshers" do 
	command "useradd sshers1 ;usermod -G sshers1,peadmin peadmin"
end


service "sshd" do
	action [ :enable, :restart ]
end
