# This recipe is for testing the seven_zip archive provider

source = 'https://www.7-zip.org/a/7z2201-src.7z'
checksum = '24cb2b9c6c0fb87d9c77a8d2afb572f5c75b45c950eff81a37ebac7fa73d1b4a'

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
