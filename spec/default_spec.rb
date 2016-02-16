describe 'seven_zip::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
    end.converge(described_recipe)
  end

  it 'installs seven_zip package' do
    expect(chef_run).to install_windows_package '7-zip 15.14 (x64 edition)'
  end

  it 'updates the path to include seven_zip' do
    expect(chef_run).to add_windows_path 'C:\\\\7-zip'
  end
end
