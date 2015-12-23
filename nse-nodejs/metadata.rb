name 'nse-nodejs'
maintainer 'petech_devops'
maintainer_email 'petech_devops@pearson.com'
description 'Installs/Configures node.js'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

depends 'build-essential'
depends 'ark'

%w(debian ubuntu centos redhat).each do |os|
  supports os
end
