# Seven Zip resource migration

## Owner decisions

The owner selected a full custom-resource migration and a replacement major
release. Do not publish these changes as the existing 4.3.0 release PR.
Preserve existing overwrite behaviour. Never recursively remove pre-existing
destination contents. Changes to ownership or overwrite semantics need a
separate owner decision.

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

The cookbook already has no public recipes or attributes. It exposes
`seven_zip_tool` and `seven_zip_archive`. The latter requires the 7-Zip
executable from the Windows registry and always executes extraction. The
Kitchen configuration currently disables idempotency for that reason.

`URI.escape` was removed from current Ruby. `URI::DEFAULT_PARSER.escape`
retains URI escaping rather than form-encoding the complete URL. Regression
tests cover spaces and preservation of plus signs and existing escapes.

Chef's built-in `archive_file` provides idempotent `overwrite :auto` using
archive entry timestamps, but has no removal action. A receipt alone does
not prove extracted files remain intact. Do not add destructive destination
ownership assumptions merely to satisfy an idempotency or cleanup test.

## Acceptance still required

Complete step-into resource tests, safe cleanup semantics, idempotent Windows
Kitchen verification, current platform evidence, test cookbook layout and
resource documentation before describing this migration as complete. Keep
Windows acceptance on a Windows runner; local macOS unit tests do not prove
installation or extraction on Windows.
