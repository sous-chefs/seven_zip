#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook:: seven_zip
# Attribute:: default
#
# Copyright:: 2011-2017, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['kernel']['machine'] == 'x86_64'
  default['seven_zip']['url']          = 'https://www.7-zip.org/a/7z1805-x64.exe'
  default['seven_zip']['checksum']     = 'c1e42d8b76a86ea1890ad080e69a04c75a5f2c0484bdcd838dc8fa908dd4a84c'
  default['seven_zip']['package_name'] = '7-Zip 18.05 (x64 edition)'
else
  default['seven_zip']['url']          = 'https://www.7-zip.org/a/7z1805.msi'
  default['seven_zip']['checksum']     = '647a9a621162cd7a5008934a08e23ff7c1135d6f1261689fd954aa17d50f9729'
  default['seven_zip']['package_name'] = '7-Zip 18.05'
end

default['seven_zip']['default_extract_timeout'] = 600
