# Seven Zip resource migration

## Owner decisions

The owner selected a full custom-resource migration and a replacement major
release. Do not publish these changes as the existing 4.3.0 release PR.
The owner subsequently chose Chef's native `archive_file` instead of retaining
`seven_zip_archive`. Remove that wrapper and document the native overwrite
semantics. Never recursively remove pre-existing destination contents.

## Vendor evidence

The official download page is <https://www.7-zip.org/download.html>. On
2026-11-12 it listed 26.06 EXE installers for Windows x64, x86 and ARM64;
MSI installers were listed for x64 and x86. The older 19.00 x64/x86 MSI
downloads used by this cookbook remain listed. Source compilation is not
part of this cookbook's installer workflow.

Do not infer ARM64 MSI support from the EXE download. The current resource
selects only x64 or x86; adding another architecture requires explicit
installer selection and real Windows evidence.

## Implementation findings

The cookbook already has no public recipes or attributes. The full migration
retains `seven_zip_tool` and removes `seven_zip_archive`. Extraction examples
use native `remote_file` and `archive_file`, with native `overwrite false`.
Two Windows convergences must prove idempotency; local ChefSpec does not.

The obsolete wrapper's URI helper is removed with the wrapper; URL fetching is
delegated to Chef's native `remote_file`.

Chef's built-in `archive_file` provides idempotent `overwrite :auto` using
archive entry timestamps in principle, but Windows Cinc 19.4.46 acceptance
on the 7-Zip 25.01 source archive fails its second extraction with
`Archive::Error: Can't unlink already-existing object`. Do not claim that
mode works on this archive. Acceptance exercises native `overwrite false`,
which skips an existing destination, with a post-extraction unrelated file
that must survive the second convergence. Native extraction has no removal
action. A receipt alone does
not prove extracted files remain intact. Do not add destructive destination
ownership assumptions merely to satisfy an idempotency or cleanup test.

## Acceptance still required

Step-into tests exercise retained installation overrides and PATH actions.
Removal deletes only the selected installation PATH entry and invokes the MSI
uninstaller; no extraction directory is removed. Test cookbooks live under
`test/cookbooks/test` and use a local Policyfile.

The repository contains no dispatchable acceptance workflow on main. Add
`workflow_dispatch` to the existing CI workflow on the feature branch and try
dispatching it by ref before opening a PR. Windows acceptance must pass before
describing this migration as complete. Local macOS unit tests do not prove
installation or extraction on Windows.
