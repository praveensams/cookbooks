#
# Cookbook Name:: nse-scp-databagkey
# Recipe:: default
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#

## This cookbook is to copy the key file(which is used to encrpt the Data bags) to decrypt the Data Bags.
template '/etc/chef/encrypted_data_bag_secret' do
	source 'secret.erb'
	not_if '[ -f /etc/chef/encrypted_data_bag_secret ]'
	
	end