# frozen_string_literal: true

require 'spec_helper'

describe 'seven_zip_archive source URLs' do
  let(:run_context) { Chef::RunContext.new(Chef::Node.new, {}, nil) }
  let(:resource_class) do
    Chef::Resource::LWRPBase.build_from_file('seven_zip', File.expand_path('../../../resources/archive.rb', __dir__), run_context)
  end
  let(:resource) { resource_class.new('test archive', run_context) }
  let(:provider) { resource_class.action_class.new(resource, run_context) }

  it 'escapes spaces in a source URL on current Ruby' do
    expect(provider.as_uri('https://example.test/an archive.7z').to_s).to eq('https://example.test/an%20archive.7z')
  end

  it 'preserves literal plus signs and existing escapes in valid URLs' do
    source = 'https://example.test/a+b%20c.7z?signature=x+y%2Bz'
    expect(provider.as_uri(source).to_s).to eq(source)
  end
end
