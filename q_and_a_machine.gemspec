$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'q_and_a_machine/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'q_and_a_machine'
  s.version     = QAndAMachine::VERSION
  s.authors     = ['Albert Davidson Chou']
  s.email       = ["HotFusionMan+#{s.name}@Gmail.com"]
  s.homepage    = 'http://q-and-a-machine.rubyforge.org/'
  s.summary     = "#{s.name}-#{s.version}"
  s.description = "A Rails engine implementing a Web-accessible question-answering engine that learns from assertions of facts."

  s.rubyforge_project         = s.name
  s.required_rubygems_version = '> 1.3.6'

  #s.files = Dir['{app,config,db,lib}/**/*'] + ['LICENSE', 'Rakefile', 'README.rdoc']
  s.files = `git ls-files`.split( "\n" )
  s.executables = s.files.map { |f| f =~ /^bin\/(.*)/ ? $1 : nil }.compact
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 3.2.2'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
end
