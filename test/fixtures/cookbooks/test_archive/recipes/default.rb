# This recipe is for testing the seven_zip archive provider
include_recipe 'seven_zip'

seven_zip_archive 'test_archive' do
  path      node['test_archive']['path']
  source    node['test_archive']['source']
  overwrite node['test_archive']['overwrite']
  checksum  node['test_archive']['checksum']
end
