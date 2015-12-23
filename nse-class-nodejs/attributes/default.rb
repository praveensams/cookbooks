#
# Cookbook Name:: nodejs
# Attributes:: nodejs
#
# Copyright 2015, Pearson English
#
## Following attributes are used in the recipe

default['nodejs']['version'] = '0.12.2'
default['nodejs']['prefix_url'] = 'http://nodejs.org/dist/'

## Auto generated
default['nodejs']['source']['url'] = nil 

## Change the checksum value if we change the node version.
## To find the 256 bit checksum of tarball: example: shasum -a 256 node-v0.12.2.tar.gz 
default['nodejs']['source']['checksum'] = 'ac7e78ade93e633e7ed628532bb8e650caba0c9c33af33581957f3382e2a772d'

## We will be using make_threads value as a "make" prefix during compilation.
default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2
default['nodejs']['install_method'] = 'source'

## for pm2 startup script
default['nodejs']['document_root'] = '/AZVOL/deveven-digital_classroom'