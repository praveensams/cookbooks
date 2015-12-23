##For nginx.conf
default['nginx']['dir']          = '/etc/nginx'
default['nginx']['log_dir']      = '/var/log/nginx'
default['nginx']['pid'] = '/var/run/nginx.pid'
default['nginx']['user']       = 'www-data'
default['nginx']['init_style'] = 'upstart'
default['nginx']['pid'] = '/run/nginx.pid'
default['nginx']['group'] = node['nginx']['group'] || node['nginx']['user']
default['nginx']['gzip']              = 'on'
default['nginx']['gzip_disable']      = 'MSIE [1-6]\.'
default['nginx']['keepalive_timeout']    = 65
default['nginx']['worker_processes']     = node['cpu'] && node['cpu']['total'] ? node['cpu']['total'] : 1
default['nginx']['worker_connections']   = 1_024
default['nginx']['sendfile'] = 'on'
default['nginx']['tcp_nodelay'] = 'on'
default['nginx']['tcp_nopush'] = 'on'
default['nginx']['types_hash_max_size']    = 2_048
default['nginx']['client_max_body_size']    = '25M'
default['nginx']['default_type'] = 'application/octet-stream'


##For sites-availble configuration
default['nginx']['port']         = '80'
default['nginx']['servername']   = 'testsapi.wallstreetenglish.com'

##For Proxy
default['nginx']['proxy']['host']  = '$host'
default['nginx']['proxy']['X-Real-IP']  = '$remote_addr' 
default['nginx']['proxy']['pass']  = 'http://127.0.0.1:4001'

##Default nginx certificate

default['nginx']['certificate']='/AZVOL/certs/world_wallstreetenglish_com_cert.crt'
default['nginx']['certificate_key']='/AZVOL/certs/world_wallstreetenglish_com_key.key'
