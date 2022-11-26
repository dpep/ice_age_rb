$LOAD_PATH.unshift File.expand_path("lib", __dir__)
package_name = File.basename(__FILE__).split(".")[0]
require "#{package_name}/version"

package = IceAge


Gem::Specification.new do |s|
  s.authors     = ["Daniel Pepper"]
  s.description = "Freeze your ENVironment for testing."
  s.homepage    = "https://github.com/dpep/#{package_name}_rb"
  s.license     = "MIT"
  s.name        = package_name
  s.summary     = package.to_s
  s.version     = package.const_get "VERSION"
  s.files       = `git ls-files * ":!:spec"`.split("\n")

  s.add_development_dependency "byebug"
  s.add_development_dependency "codecov"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
end
