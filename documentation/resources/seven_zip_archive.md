# `seven_zip_archive`

[back to resource list](../../README.md#Resources)

Extracts a 7-Zip compatible archive (iso, zip, 7z, etc.) to the specified destination directory.

## Actions

- `:extract`

## Properties

| Name      | Type          | Default | Description                                 |
| --------- | ------------- | ------- | ------------------------------------------- |
| path      | String        |         | Path to extract the archive.                |
| source    | String        |         | Source archive location.                    |
| overwrite | [true, false] | false   | Whether to overwrite the destination files. |
| checksum  | String        |         | The checksum for the downloaded file.       |
| timeout   | Integer       | 600     | Extra timeout in seconds.                   |

## Example usage

```ruby
seven_zip_archive 'seven_zip_source' do
  path      'C:\seven_zip_source'
  source    'https://www.7-zip.org/a/7z1805-src.7z'
  overwrite true
  checksum  'd9acfcbbdcad078435586e00f73909358ed8d714d106e064dcba52fa73e75d83'
  timeout   30
end
```
