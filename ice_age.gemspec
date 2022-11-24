package_name = File.basename(__FILE__).split(".")[0]
require_relative Dir.glob("**/version.rb")[0].delete_suffix(".rb")

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
