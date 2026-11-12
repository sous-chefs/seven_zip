# frozen_string_literal: true

require 'spec_helper'

describe 'seven_zip_tool' do
  platform 'windows', '2019'
  step_into :seven_zip_tool

  context 'installation with caller overrides' do
    recipe do
      seven_zip_tool 'install' do
        package 'Custom 7-Zip'
        source 'https://example.test/seven.zip.msi'
        checksum 'a' * 64
        path 'C:\\Custom Seven Zip'
      end
    end

    it 'passes the installer properties and quoted path to the native package resource' do
      is_expected.to install_windows_package('Custom 7-Zip').with(
        source: 'https://example.test/seven.zip.msi', checksum: 'a' * 64,
        options: 'INSTALLDIR="C:\\Custom Seven Zip"'
      )
    end
  end

  context 'adding an explicit path' do
    recipe do
      seven_zip_tool 'add' do
        path 'C:\\Custom Seven Zip'
        action :add_to_path
      end
    end

    it 'adds only the selected installation directory to PATH' do
      is_expected.to add_windows_path('seven_zip').with(path: 'C:\\Custom Seven Zip')
    end
  end

  context 'removal with an explicit path' do
    recipe do
      seven_zip_tool 'remove' do
        package 'Custom 7-Zip'
        path 'C:\\Custom Seven Zip'
        action :remove
      end
    end

    it 'removes the path entry before uninstalling the package' do
      is_expected.to remove_windows_path('seven_zip').with(path: 'C:\\Custom Seven Zip')
      is_expected.to remove_windows_package('Custom 7-Zip')
    end
  end
end

describe 'seven_zip_tool registered installation path' do
  let(:run_context) { Chef::RunContext.new(Chef::Node.new, {}, nil) }
  let(:resource_class) do
    Chef::Resource::LWRPBase.build_from_file('seven_zip', File.expand_path('../../../resources/tool.rb', __dir__), run_context)
  end
  let(:resource) { resource_class.new('tool', run_context) }
  let(:provider) { resource_class.action_class.new(resource, run_context) }
  let(:key) { 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths\\7zFM.exe' }

  it 'does not read a missing registry key during repeated removal' do
    allow(provider).to receive(:registry_key_exists?).with(key).and_return(false)
    expect(provider).not_to receive(:registry_get_values)
    expect(provider.registry_path).to be_nil
  end

  it 'uses the registered installation path when present' do
    allow(provider).to receive(:registry_key_exists?).with(key).and_return(true)
    allow(provider).to receive(:registry_get_values).with(key).and_return([{ name: 'Path', data: 'C:\\7-Zip' }])
    expect(provider.registry_path).to eq 'C:\\7-Zip'
  end

  it 'does not assume the Path value is present in a residual registry key' do
    allow(provider).to receive(:registry_key_exists?).with(key).and_return(true)
    allow(provider).to receive(:registry_get_values).with(key).and_return([])
    expect(provider.registry_path).to be_nil
  end
end
