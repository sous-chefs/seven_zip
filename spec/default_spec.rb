describe 'seven_zip::default' do
  context 'with defaults' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new.converge(described_recipe)
    end
    it 'installs seven_zip package' do
      expect(chef_run).to install_windows_package '7-Zip 15.14 (x64 edition)'
    end
    it 'updates the path to include seven_zip' do
      expect(chef_run).to_not add_windows_path('seven_zip').with(path: 'C:\\\\7-zip')
    end
  end
  context 'with syspath' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.set['seven_zip']['syspath'] = true
        node.set['seven_zip']['home'] = 'C:\\\\7-zip'
      end.converge(described_recipe)
    end
    it 'installs seven_zip package' do
      expect(chef_run).to install_windows_package '7-Zip 15.14 (x64 edition)'
    end
    it 'updates the path to include seven_zip' do
      expect(chef_run).to add_windows_path('seven_zip').with(path: 'C:\\\\7-zip')
    end
  end
end
