describe package '7-zip 19.00 (x64 edition)' do
  it { should be_installed }
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
