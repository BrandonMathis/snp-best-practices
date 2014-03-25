$:.push File.expand_path('../lib', __FILE__)

require 'snp_best_practices/version'

Gem::Specification.new do |s|
  s.name        = 'snp_best_practices'
  s.version     = SnpBestPractices::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Simple best practices, used by S&P backend engineers in ruby projects'
  s.description = 'Contains deploy configuration'

  s.required_ruby_version     = '>= 2.0'
  s.required_rubygems_version = '>= 1.3.6'

  s.authors     = ['Sergey Ponomarev']
  s.email       = ['sergey.ponomarev@saltpepper.ru']
  s.homepage    = 'http://saltpepper.ru'
  s.license     = 'MIT'

  s.require_path = 'lib'
  s.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'capistrano', '~> 3.1'

  s.add_development_dependency 'rails', '~> 4.0'
end
