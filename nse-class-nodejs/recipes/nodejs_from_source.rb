#
# Cookbook Name:: nodejs
#
# Copyright 2015, Pearson English
#

## Installs packages required for compiling C software from source from a different cookbook. 
## Following packages are installed for debian: package 'autoconf',package 'binutils-doc',package 'bison',package 'build-essential',package 'flex',package 'gettext',package 'ncurses-dev'
include_recipe 'build-essential'

## SSL development libraries
case node['platform_family']
when 'rhel', 'fedora'
  package 'openssl-devel'
when 'debian'
  package 'libssl-dev'
end

## Nodejs Version
version = "v#{node['nodejs']['version']}/"

## Nodejs tarball file
filename = "node-v#{node['nodejs']['version']}.tar.gz"
archive_name = 'nodejs-source'

## ::URI.join with .to_s => Will assign full URL 
nodejs_src_url = node['nodejs']['source']['url'] || ::URI.join(node['nodejs']['prefix_url'], version, filename).to_s

## Ark a resource for managing software archives from a different cookbook.
## ark: does the extract/build/configure 
## URL attribure: is url for a tarball
## Checksum attribute: is used to check the file integrity
## make_opts: an array of command line options for use with make
## :install_with_make: extracts the archive to a path, runs make, and make install.
ark archive_name do
  url nodejs_src_url
  version node['nodejs']['version']
  checksum node['nodejs']['source']['checksum']
  make_opts ["-j #{node['nodejs']['make_threads']}"]
  action :install_with_make
end
