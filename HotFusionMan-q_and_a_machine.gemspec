$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'q_and_a_machine/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  github_username = 'HotFusionMan'
  product_name = 'q_and_a_machine'

  s.name        = "#{github_username}-q_and_a_machine"
  s.version     = QAndAMachine::VERSION
  s.authors     = ['Albert Davidson Chou']
  s.email       = ["#{github_username}+#{product_name}@Gmail.com"]
  s.homepage    = 'http://q-and-a-machine.rubyforge.org/'
  s.summary     = "#{s.name}-#{s.version}"
  s.description = "A Rails engine implementing a Web-accessible question-answering engine that learns from assertions of facts."

  s.rubyforge_project         = s.name
  s.required_rubygems_version = '> 1.3.6'

  #s.files = Dir['{app,config,db,lib}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.files = `git ls-files`.split( "\n" )
  s.executables = s.files.map { |f| f =~ /^bin\/(.*)/ ? $1 : nil }.compact
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 3.2.3'
  s.add_dependency 'resque'

  s.add_development_dependency 'sqlite3'

  s.add_development_dependency 'rspec-rails', '~> 2.5'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'mock_redis'
end
