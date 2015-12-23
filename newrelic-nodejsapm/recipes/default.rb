#
# Cookbook Name:: newrelic-nodejsapm
# Recipe:: default
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#

## Installs the Newrelic module in app's root directory
node['app']['root'].each  do |approot|
execute "Newrelic APM installation" do
	cwd "#{approot}"
	command 'npm install newrelic'
	not_if "[ -d #{approot}/node_modules/newrelic ]"
end

## Loads the newrelic.js file in the app's root directory
template "#{approot}/newrelic.js" do
	source "newrelic-nodejsapm.erb"
	mode 0644
	not_if {File.exists?('#{approot}/newrelic.js')}
end
end
