# This recipe is for testing the seven_zip archive provider

source = 'https://www.7-zip.org/a/7z1805-src.7z'
checksum = 'd9acfcbbdcad078435586e00f73909358ed8d714d106e064dcba52fa73e75d83'

seven_zip_tool 'install seven_zip' do
  action [:install, :add_to_path]
end

seven_zip_archive 'test_archive' do # rubocop:disable Chef/Modernize/SevenZipArchiveResource
  path      'C:\seven_zip_source'
  source    source
  checksum  checksum
  overwrite true
  timeout   30
end

seven_zip_archive 'extract_with_spaces' do # rubocop:disable Chef/Modernize/SevenZipArchiveResource # rubocop:disable
  path      'C:\Program Files\seven_zip_source'
  source    source
  checksum  checksum
  overwrite true
end
