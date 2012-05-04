require 'bundler'
Bundler::GemHelper.install_tasks

Dir['tasks/*.rake'].each { |file| load(file) }

require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
end
