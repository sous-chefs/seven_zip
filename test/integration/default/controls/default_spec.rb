# frozen_string_literal: true

control 'seven-zip-installation' do
  describe package '7-zip 19.00 (x64 edition)' do
    it { should be_installed }
  end

  describe os_env('PATH', 'system') do
    its('content') { should match(/C:\\seven_zip_test/i) }
  end

  ['C:\\seven_zip_source', 'C:\\Program Files\\seven_zip_source'].each do |destination|
    describe file("#{destination}\\unrelated.txt") do
      its('content') { should eq 'Existing content must remain intact.' }
    end
  end

  describe file 'C:\seven_zip_source' do
    it { should be_directory }
  end

  %w(Asm C CPP DOC).each do |f|
    describe file "C:\\seven_zip_source\\#{f}" do
      it { should be_directory }
    end
  end

  describe file 'C:\Program Files\seven_zip_source' do
    it { should be_directory }
  end

  %w(Asm C CPP DOC).each do |f|
    describe file "C:\\Program Files\\seven_zip_source\\#{f}" do
      it { should be_directory }
    end
  end
end
