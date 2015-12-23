## It will run apt-get update command from other resources
execute 'apt' do
	command 'apt-get update'
	action :nothing
end

## Copying our centralized repo details to the server based on conditions
template "/etc/apt/sources.list.d/nginx.list"  do
	source "repo.erb"
	mode '0644'
	owner 'root'
	group 'root'
	not_if do 
		File.exists?('/etc/apt/sources.list.d/nginx.list')
	end
## If the above code got executed then it will run "apt" execute resource
    notifies :run, 'execute[apt]', :immediately
end