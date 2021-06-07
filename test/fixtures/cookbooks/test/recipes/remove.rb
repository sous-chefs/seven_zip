seven_zip_tool 'install seven_zip' do
  action [:install, :add_to_path]
end

seven_zip_tool 'remove seven_zip' do
  action :remove
end
