#
# Cookbook Name:: nse-sslcerts
# Recipe:: default
#
# Copyright 2015, Pearson English
#
# All rights reserved - Do Not Redistribute
#

## This cookbook is to copy the ssl certificates to HA proxy vm's.
## Copy the .pem to /etc/ssl/certs/

directory '/AZVOL/certs' do
	mode '0755'
	user 'root'
	group 'root'
	recursive true
end

secrets = Chef::EncryptedDataBagItem.load("certificates", "certifs")

if secrets["certificate"]
  ruby_block "write_key" do
    block do
      f = ::File.open(node['nginx']['certificate'], "w")
      f.print(secrets["certificate"])
      f.close
    end
    not_if do ::File.exists?("#{node['nginx']['certificate']}"); end
  end
end


if secrets["certificate_key"]
  ruby_block "write_key" do
    block do
      f = ::File.open(node['nginx']['certificate_key'], "w")
      f.print(secrets["certificate_key"])
      f.close
    end
    not_if do ::File.exists?("#{node['nginx']['certificate_key']}"); end
  end
end

if secrets["certificate_pem"]
  ruby_block "write_key" do
    block do
      f = ::File.open(node['nginx']['certificate_pem'], "w")
      f.print(secrets["certificate_pem"])
      f.close
    end
    not_if do ::File.exists?("#{node['nginx']['certificate_pem']}"); end
  end
end