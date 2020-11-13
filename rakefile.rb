require 'cookstyle'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: [:cookstyle, :spec]

RSpec::Core::RakeTask.new do |task|
  task.pattern = 'spec/**/*_spec.rb'
  task.rspec_opts = ['--color', '-f documentation', '-tunit']
end

RuboCop::RakeTask.new(:cookstyle) do |task|
  task.options << '--display-cop-names'
end

begin
  require 'stove/rake_task'
  Stove::RakeTask.new
rescue LoadError => e
  puts ">>> Gem load error: #{e}, omitting #{task.name}" unless ENV['CI']
end
