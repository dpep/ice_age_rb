$LOAD_PATH.unshift 'lib'
package_name = 'env_freeze'
require "#{package_name}"
package = IceAge


Gem::Specification.new do |s|
  s.name        = package_name
  s.version     = package.const_get 'VERSION'
  s.authors     = ['Daniel Pepper']
  s.summary     = 'IceAge'
  s.description = 'Freeze your ENVironment for testing.'
  s.homepage    = "https://github.com/dpep/rb_#{package_name}"
  s.license     = 'MIT'

  s.files       = Dir.glob('lib/**/*')
  s.test_files  = Dir.glob('spec/**/*_spec.rb')
  # s.test_files    = `git ls-files -- {test,spec}/*`.split("\n")

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec/core'
end
