require 'spec_helper'

describe package('7-zip 9.20 (x64 edition)') do
  it { should be_installed }
end
