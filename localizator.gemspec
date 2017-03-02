$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'localizator/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'localizator'
  s.version     = Localizator::VERSION
  s.authors     = ['rafael']
  s.email       = ['skcc321@gmail.com']
  s.homepage    = 'http://google.com'
  s.summary     = 'Summary of Localizator.'
  s.description = 'Description of Localizator.'
  s.license     = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.rdoc'
  ]
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.8'
  s.add_dependency 'rubyzip', '>= 1.0.0'
  s.add_dependency 'jquery-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'minitest-color'
  s.add_development_dependency 'pry'
end
