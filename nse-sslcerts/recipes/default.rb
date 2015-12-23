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
secrets = Chef::EncryptedDataBagItem.load("certificates", "wsssl")

if secrets["wssslchk"]
  ruby_block "write_key" do
    block do
      f = ::File.open("/etc/ssl/certs/world_wallstreetenglish_com_cert.pem", "w")
      f.print(secrets["wssslchk"])
      f.close
    end
    not_if do ::File.exists?("etc/ssl/certs/world_wallstreetenglish_com_cert.pem"); end
  end
end