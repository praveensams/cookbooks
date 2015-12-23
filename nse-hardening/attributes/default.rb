default['ssh']['version']='2'
default['ssh']['port']='22'
default['ssh']['permitrootlogin']='without-password'
default['ssh']['clientaliveinterval']='300'
default['ssh']['clientalivecountmax']='0'
# Removing unwanted packages
default['yum']['remove_package']=['inetd','xinetd','ypserv','tftp-server','telnet-server','rsh-serve']
# Adding mandatory package
default['yum']['install_package']=['gcc','cc']
# Disable unwanted service
default['services']['unwanted']=['xinetd','slapd','ip6tables']
# Cretaing Sudo file , adding below user to suroers list
default['sudo']['group']=['build','buildadmin','dbaadmin']

# Adding limited privilage for the users
default['sudo']['command_alias']='/bin/, /usr/local/bin/, /sbin, /usr/sbin/, /bin/bash, /bin/sh, /bin/su, /sbin/ifconfig'

# Creating disk partition
default['disk']['device']='/dev/sdc'
default['disk']['partition']='dev/sdc1'
default['disk']['label']='/AZVOL'
# Creating banners for ssh
default['ssh']['banners']='/etc/banners'
