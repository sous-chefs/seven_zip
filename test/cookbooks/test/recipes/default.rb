# frozen_string_literal: true

seven_zip_tool 'install seven_zip' do
  path 'C:\\seven_zip_test'
  action [:install, :add_to_path]
end

archive = ::File.join(Chef::Config[:file_cache_path], '7z2501-src.7z')
remote_file archive do
  source 'https://www.7-zip.org/a/7z2501-src.7z'
  checksum '2aed39b8f1238464475e9de7dda169a5e873a1dc8bbf4f664b943eaba5620181'
end

['C:\\seven_zip_source', 'C:\\Program Files\\seven_zip_source'].each do |destination|
  archive_file "extract into #{destination}" do
    path archive
    destination destination
    overwrite false
  end
  file "#{destination}\\unrelated.txt" do
    content 'Existing content must remain intact.'
  end
end
