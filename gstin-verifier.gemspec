
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gstin/verifier/version"

Gem::Specification.new do |spec|
  spec.name          = "gstin-verifier"
  spec.version       = Gstin::Verifier::VERSION
  spec.authors       = ["Babu Lal Meena", "Ranveer"]
  spec.email         = ["babulal@bizongo.in", "ranveer.bhambhu@bizongo.in"]

  spec.summary       = 'Repository to get company details from gstin number'
  spec.description   = 'Mastersindia api integration'
  spec.homepage      = 'https://github.com/Bizongo/gstin'
  spec.license       = "MIT"
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.2.0'
  spec.add_dependency 'pry'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'httparty'
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
