seven_zip Cookbook
==============
[7-Zip](http://www.7-zip.org/) is a file archiver with a high compression ratio. This cookbook installs the full 7-zip suite of tools (GUI and CLI). This cookbook replaces the older [7-zip cookbook](https://github.com/sneal/7-zip).


Requirements
------------
### Platforms
- Windows XP
- Windows Vista
- Windows Server 2003 R2
- Windows 7
- Windows Server 2008 (R1, R2)
- Windows 8, 8.1
- Windows Server 2012 (R1, R2)

### Chef
- Chef 11+

### Cookbooks
- windows


Attributes
----------
- `node['seven_zip']['home']` - location to install 7-zip files to.  default is `%SYSTEMDRIVE%\7-zip`


Resource/Provider
-----------------
### zeven_zip_archive

Extracts a 7-zip compatible archive (iso, zip, 7z etc) to the specified destination directory.

#### Actions
- `:extract` - Extract a 7-zip compatible archive

#### Attribute Parameters
- `path` - Name attribute. The destination to extract to.
- `source` - The file path to the archive to extract.
- `overwrite` - Defaults to false. If true, the destination files will be overwritten.
- `checksum` - The archive file checksum.

#### Examples
Extract VisualStudio ISO files to c:/vs2015tmp

```ruby
seven_zip_archive 'extract_vs2015_iso' do
  path 'c:/vs2015tmp'
  source 'http://example.com/vs2015.iso'
  overwrite true
  checksum '44db74d1e6243924c187069ad95cee58b687dcb9ba2d302fc6ae889fb4ae7694'
end
```


Usage
-----
### default
Downloads and installs 7-zip to the location specified by `node['seven_zip']['home']`.  Also ensures `node['seven_zip']['home']` is in the system path.


License & Authors
-----------------
- Author:: Seth Chisamore (<schisamo@chef.io>)
- Author:: Shawn Neal (<sneal@sneal.net>)

```text
Copyright:: 2011-2016, Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
