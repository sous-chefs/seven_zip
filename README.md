# seven_zip Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/seven_zip.svg)](https://supermarket.chef.io/cookbooks/seven_zip)
[![CI State](https://github.com/sous-chefs/seven_zip/workflows/ci/badge.svg)](https://github.com/sous-chefs/seven_zip/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

[7-Zip](http://www.7-zip.org/) is a file archiver with a high compression ratio. This cookbook installs the full 7-Zip suite of tools (GUI and CLI). This cookbook replaces the older [7-Zip cookbook](https://github.com/sneal/7-zip).

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

# Requirements

## Platforms

- Windows XP
- Windows Vista
- Windows 7
- Windows 8, 8.1
- Windows 10
- Windows Server 2003 R2
- Windows Server 2008 (R1, R2)
- Windows Server 2012 (R1, R2)

## Chef

- Chef >= 13.0

## Cookbooks

- windows

# Attributes

## Optional

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `['seven_zip']['home']` | String | 7-Zip installation directory. | |
| `['seven_zip']['syspath']` | Boolean | If true, adds 7-Zip directory to system PATH environment variable. | |
| `['seven_zip']['default_extract_timeout']` | Integer | The default timeout for an extract operation in seconds. This can be overridden by a resource attribute. | `600` |

# Usage

## default

Add `seven_zip::default` to your run\_list which will download and install 7-Zip for the current Windows platform.

# Resource/Provider

## seven_zip_archive

Extracts a 7-Zip compatible archive (iso, zip, 7z, etc.) to the specified destination directory.

### Actions

- `:extract` - Extract a 7-Zip compatible archive.

### Attribute Parameters

- `path` - Name attribute. The destination to extract to.
- `source` - The file path to the archive to extract.
- `overwrite` - Defaults to false. If true, the destination files will be overwritten.
- `checksum` - The archive file checksum.
- `timeout` - The extract action timeout in seconds, defaults to `node['seven_zip']['default_extract_timeout']`.

### Examples

Extract 7-Zip source files to `C:\seven_zip_source`.

```ruby
seven_zip_archive 'seven_zip_source' do
  path      'C:\seven_zip_source'
  source    'https://www.7-zip.org/a/7z1805-src.7z'
  overwrite true
  checksum  'd9acfcbbdcad078435586e00f73909358ed8d714d106e064dcba52fa73e75d83'
  timeout   30
end
```

## seven_zip_tool

Download and install 7-zip for the current Windows platform.

### Actions

- `:install` - Installs 7-zip
- `:add_to_path` - Add 7-zip to the PATH

### Attribute Parameters

- `package` - The name of the package.
- `path` - The install directory of 7-zip.
- `source` - The source URL of the 7-zip package.
- `checksum` - The 7-zip package checksum.

### Examples

Install 7-zip in `C:\7z` and add it to the path.

```ruby
seven_zip_tool '7z 15.14 install' do
  action    [:install, :add_to_path]
  package   '7-Zip 15.14'
  path      'C:\7z'
  source    'http://www.7-zip.org/a/7z1514.msi'
  checksum  'eaf58e29941d8ca95045946949d75d9b5455fac167df979a7f8e4a6bf2d39680'
end
```

# Recipes

## default

Installs 7-Zip and adds it to your system PATH.

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
