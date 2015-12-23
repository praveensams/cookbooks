#
# Cookbook Name:: Postinstall
# Recipe:: default
# Author Eric Zhang 
# Email: eric.zhang1@pearson.com
# Copyright 2015, Pearson English 
# All rights reserved - Do Not Redistribute


## Secure servers
include_recipe 'postinstall::dele_useless_accounts'

## Including  iptables recipe

 include_recipe  'postinstall::iptables'

 ## Secure SSH 
 include_recipe 'postinstall::ssh'



