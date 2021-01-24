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
  default['seven_zip']['url']          = 'https://www.7-zip.org/a/7z1900-x64.msi'
  default['seven_zip']['checksum']     = 'a7803233eedb6a4b59b3024ccf9292a6fffb94507dc998aa67c5b745d197a5dc'
  default['seven_zip']['package_name'] = '7-Zip 19.00 (x64 edition)'
else
  default['seven_zip']['url']          = 'https://www.7-zip.org/a/7z1900.msi'
  default['seven_zip']['checksum']     = 'b49d55a52bc0eab14947c8982c413d9be141c337da1368a24aa0484cbb5e89cd'
  default['seven_zip']['package_name'] = '7-Zip 19.00'
end

default['seven_zip']['default_extract_timeout'] = 600
