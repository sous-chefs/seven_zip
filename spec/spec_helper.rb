# frozen_string_literal: true

require 'chefspec'
require 'tmpdir'

RSpec.configure do |config|
  cookbook_path = Dir.mktmpdir('seven-zip-chefspec-')
  File.symlink(File.expand_path('..', __dir__), File.join(cookbook_path, 'seven_zip'))
  config.cookbook_path = cookbook_path
  config.after(:suite) { FileUtils.remove_entry(cookbook_path) }
  config.platform = 'windows'
  config.version = '2019'
  ENV['ProgramFiles(x86)'] = 'C:\Program Files (x86)' # assume 64bit OS
  ENV['ProgramFiles'] = 'C:\Program Files'
  ENV['WINDIR'] = 'C:\Windows'
  ENV['SYSTEMDRIVE'] = 'C:\\'
end
