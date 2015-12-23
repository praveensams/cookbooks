#
# Cookbook Name:: nse-dbbackuputils
# Recipe:: default
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#

## This cookbook installs the package required for db backups. Azure-cli and sendmail.
package ['nodejs-legacy', 'npm', 'mailutils', 'sendmail']

execute 'azure-cli installation' do
command 'sudo npm install -g azure-cli'
not_if { ::File.exists?('/usr/local/bin/azure') } 
end