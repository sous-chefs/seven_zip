name             'seven_zip'
maintainer       'Shawn Neal'
maintainer_email 'sneal@sneal.net'
source_url       'https://github.com/windowschefcookbooks/seven_zip'
issues_url       'https://github.com/windowschefcookbooks/seven_zip/issues'
chef_version     '>= 12.6' if respond_to?(:chef_version)
license          'Apache-2.0'
description      'Installs/Configures the 7-zip file archiver'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.1.0'
supports         'windows'
depends          'windows'
