# `seven_zip_tool`

[back to resource list](../README.md#resources)

Download and install 7-zip for the current Windows platform.

## Actions

- `:install`
- `:add_to_path`
- `:remove`: remove the selected PATH entry, then uninstall the MSI package.

## Properties

| Name     | Type   | Default                  | Description                           |
| -------- | ------ | ------------------------ | ------------------------------------- |
| package  | String | See resource for default | Name of the package to install        |
| source   | String | See resource for default | Source URL of the package to install. |
| checksum | String | See resource for default | Checksum for the downloaded package.  |
| path     | String |                          | Optional: path to install 7zip to     |

## Example usage

Install the default 7-Zip package in `C:\7z` and add it to the path.

```ruby
seven_zip_tool 'install' do
  action    [:install, :add_to_path]
  path      'C:\7z'
end
```

When removing a custom installation, pass the same `path`. Without a path,
the installed application's registry entry supplies its installation directory.
If that entry is already absent, package removal remains safe to repeat. Files
in extraction destinations are retained.
