Gem::Specification.new do |s|
  PROJECT_GEM = 'church-community-builder'
  PROJECT_GEM_VERSION = '0.1.1'
  
  s.name = PROJECT_GEM
  s.version = PROJECT_GEM_VERSION
  s.platform = Gem::Platform::RUBY
  #s.date = '2009-01-05'

  s.homepage = 'https://github.com/weshays/church-community-builder-api-ruby'
  s.rubyforge_project = 'Project on www.github.com'
  s.authors = ['Wes Hays', 'Chad Feller']
  s.email = ['weshays@gbdev.com','feller@cs.unr.edu']

  s.summary = 'Ruby gem/plugin to interact with the Church Community Builder API.'
  s.description = 'Ruby gem/plugin to interact with the Church Community Builder API. Checkout the project on github for more detail.'

  s.add_dependency('typhoeus', '0.5.1')
  s.add_dependency('xml-simple')


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
