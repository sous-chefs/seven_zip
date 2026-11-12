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
  overwrite false
end
```

This API change is deliberate. Native `overwrite false` skips extraction if
the destination already exists, rather than skipping individual existing files.
Use a new destination when initially extracting with that setting.

Native `overwrite :auto` uses archive entry
timestamps to decide whether extraction is needed. Native `overwrite false`
and `overwrite true` have their own documented semantics; the former
cookbook's boolean `overwrite` property is not a direct mapping. Review callers that depend on
7-Zip's skip-existing-file behaviour or password and format handling. Native
`archive_file` supports extraction, not arbitrary cleanup. Keep destination
ownership with the caller and retain unrelated files.

Windows acceptance with Cinc 19.4.46 demonstrated that `overwrite :auto` on
the 7-Zip 25.01 source archive extracts once, but its second convergence
fails with `Archive::Error: Can't unlink already-existing object`. The
cookbook does not wrap or bypass native extraction to hide this limitation.
The default acceptance fixture exercises `overwrite false` instead.

See the [Chef archive_file documentation](https://docs.chef.io/resources/archive_file/)
for supported formats and properties. Windows CI checks two convergences,
paths containing spaces, existing destination content, and package/PATH removal.
