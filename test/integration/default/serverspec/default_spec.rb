require 'spec_helper'

describe package('7-zip 15.14 (x64 edition)') do
  it 'is installed' do
    expect(subject).to be_installed
  end
end

describe file('C:\seven_zip_source') do
  it 'is a directory' do
    expect(subject).to be_directory
  end

  it 'should contain only extracted files' do
    expect(Dir.entries(subject.name).sort).to eq %w(. .. Asm C CPP DOC)
  end
end

describe file('C:\Program Files\seven_zip_source') do
  it 'is a directory' do
    expect(subject).to be_directory
  end

  it 'should contain only extracted files' do
    expect(Dir.entries(subject.name).sort).to eq %w(. .. Asm C CPP DOC)
  end
end
