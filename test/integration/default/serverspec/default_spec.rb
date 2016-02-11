require 'spec_helper'

describe package('7-zip 15.14 (x64 edition)') do
  it { should be_installed }
end
