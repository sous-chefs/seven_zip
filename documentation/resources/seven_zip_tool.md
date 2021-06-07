[back to resource list](https://github.com/sous-chefs/seven_zip#resources)

# seven_zip_tool

Download and install 7-zip for the current Windows platform.

## Actions

- `:install`
- `add_to_path`
- `remove`

## Properties

| Name     | Type   | Default                  | Description                           |
| -------- | ------ | ------------------------ | ------------------------------------- |
| path     | String |                          | Path to extract the archive.          |
|          |        |                          |                                       |
| package  | String | See resource for default | Name of the package to install        |
| source   | String | See resource for default | Source URL of the package to install. |
| checksum | String | See resource for default | Checksum for the downloaded pacakge.  |
| path     | String |                          | Optional: path to install 7zip to     |

## Example usage

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
