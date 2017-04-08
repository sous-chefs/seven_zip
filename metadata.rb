name             'seven_zip'
maintainer       'Shawn Neal'
maintainer_email 'sneal@sneal.net'
issues_url       'https://github.com/windowschefcookbooks/seven_zip/issues'
source_url       'https://github.com/windowschefcookbooks/seven_zip'
chef_version     '>= 12.6' if respond_to?(:chef_version)
license          'Apache 2.0'
description      'Installs/Configures the 7-zip file archiver'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.2'
supports         'windows'
depends          'windows', '>= 3.0.4'
