# This recipe is for testing the seven_zip archive provider

source = 'https://www.7-zip.org/a/7z2501-src.7z'
checksum = '2aed39b8f1238464475e9de7dda169a5e873a1dc8bbf4f664b943eaba5620181'

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
