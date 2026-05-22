require_relative "lib/ice_age/version"

Gem::Specification.new do |s|
  s.authors     = ['Daniel Pepper']
  s.description = 'Freeze your ENVironment for testing.'
  s.files       = `git ls-files * ':!:spec'`.split("\n")
  s.homepage    = 'https://github.com/dpep/ice_age_rb'
  s.license     = 'MIT'
  s.name        = 'ice_age'
  s.summary     = 'IceAge'
  s.version     = IceAge::VERSION

  s.required_ruby_version = '>= 3.2'

  s.add_development_dependency 'debug', '>= 1'
  s.add_development_dependency 'rspec', '>= 3.10'
  s.add_development_dependency 'rspec-debugging'
  s.add_development_dependency 'simplecov', '>= 0.22'
end
