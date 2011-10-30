require 'rubygems'
require 'bundler/gem_tasks'
require 'rake'
require 'rake/testtask'
require 'rspec'
require 'rspec/core/rake_task'

# Rake::TestTask.new do |t|
#   t.libs     << 'test'
#   t.pattern  = 'test/*_test.rb'
#   t.verbose  = true
# end
 
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

RSpec::Core::RakeTask.new('spec:progress') do |spec|
  spec.rspec_opts = %w(--format progress)
  spec.pattern = "spec/**/*_spec.rb"
end

desc 'Run tests'
task :default => :spec
