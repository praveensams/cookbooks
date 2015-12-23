#
# Cookbook Name:: nse-useradmin
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user='buildadmin'
#secrets = Chef::EncryptedDataBagItem.load("certificates", "wsssl")
search(:users, '*:*').each do |u|
#Chef::EncryptedDataBagItem.load("users", "*:*"). each do |u|
secret = Chef::EncryptedDataBagItem.load("users", "#{u['id']}")

if secret['group'] =~ /buildteam/

  user secret['id'] do
    comment "#{secret['comment']}"
    home "/home/#{secret['id']}"
    gid  "#{secret['gid']}"
     shell '/bin/bash'
    supports manage_home: true
  end

  directory "/home/#{secret['id']}/.ssh" do
    owner u['id']
  end

#secrets = Chef::EncryptedDataBagItem.load("users", "#{u['id']}")

if secret["ssh_keys"]
  ruby_block "write_key" do
    block do
      f = ::File.open("/home/#{u['id']}/.ssh/authorized_keys", "w")
      f.print(secret["ssh_keys"])
      f.close
    end
    not_if do ::File.exists?("/home/#{u['id']}/.ssh/authorized_keys"); end
  end
end
end
end
#   file "/home/#{u['id']}/.ssh/authorized_keys" do
#     owner u['id']
#     mode '644'
#     content "#{u['ssh_keys']}"
#   end
# end