# frozen_string_literal: true

control 'seven-zip-removal' do
  describe package '7-zip 19.00 (x64 edition)' do
    it { should_not be_installed }
  end

  describe os_env('PATH', 'system') do
    its('content') { should_not match(/C:\\seven_zip_test/i) }
  end
end
