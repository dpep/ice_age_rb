$LOAD_PATH.unshift 'lib'
package_name = 'ice_age'
require "#{package_name}/version"
package = IceAge


Gem::Specification.new do |s|
  s.authors     = ['Daniel Pepper']
  s.description = 'Freeze your ENVironment for testing.'
  s.files       = Dir.glob('lib/**/*')
  s.homepage    = "https://github.com/dpep/#{package_name}_rb"
  s.license     = 'MIT'
  s.name        = package_name
  s.summary     = package.to_s
  s.version     = package.const_get 'VERSION'

  s.add_development_dependency 'codecov'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
end
