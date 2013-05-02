require 'rspec/core/rake_task'


desc 'Default: run specs.'
task :default => :spec
task :test => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end


desc "Generate code coverage"
RSpec::Core::RakeTask.new(:coverage) do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  t.rcov = true
  t.rcov_opts = ['--exclude', 'spec']
end



namespace :docs do

  desc 'Build the docs for The City Admin API.'
  task :build do
    system('rm -rf doc')
    system('yardoc --no-private --protected lib/**/*.rb')
  end

end