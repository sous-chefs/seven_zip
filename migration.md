# Migrating to the next major release

`seven_zip_tool` keeps its existing package, source, checksum and installation
path properties. Uninstall now removes the selected installation directory from
the system PATH before removing the package. Specify the same custom `path`
when removing a custom installation. The package installer remains responsible
for its own installed files; the cookbook never recursively deletes an
installation or extraction directory.

`seven_zip_archive` is removed. Use Chef's native `remote_file` and
`archive_file` resources instead. Extraction no longer needs a separately
installed 7-Zip executable or Windows registry lookup:

```ruby
archive = ::File.join(Chef::Config[:file_cache_path], 'source.7z')
remote_file archive do
  source 'https://example.test/source.7z'
  checksum 'the archive SHA256'
end

archive_file archive do
  destination 'C:\\application'
  overwrite :auto
end
```

This API change is deliberate: native `overwrite :auto` uses archive entry
timestamps to decide whether extraction is needed. Native `:never` and
`:always` have their own documented semantics; the former cookbook's boolean
`overwrite` property is not a direct mapping. Review callers that depend on
7-Zip's skip-existing-file behaviour or password and format handling. Native
`archive_file` supports extraction, not arbitrary cleanup. Keep destination
ownership with the caller and retain unrelated files.

See the [Chef archive_file documentation](https://docs.chef.io/resources/archive_file/)
for supported formats and properties. Windows CI checks two convergences,
paths containing spaces, existing destination content, and package/PATH removal.
