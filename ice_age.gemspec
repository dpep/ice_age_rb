require_relative "lib/ice_age/version"

package = IceAge


Gem::Specification.new do |s|
  s.authors     = ["Daniel Pepper"]
  s.description = "Freeze your ENVironment for testing."
  s.homepage    = "https://github.com/dpep/ice_age_rb"
  s.license     = "MIT"
  s.name        = File.basename(__FILE__).split(".")[0]
  s.summary     = package.to_s
  s.version     = package.const_get "VERSION"
  s.files       = `git ls-files * ":!:spec"`.split("\n")

  s.add_development_dependency "byebug"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
end
