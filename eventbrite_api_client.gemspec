# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eventbrite_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = "eventbrite_api_client"
  spec.version       = EventbriteApiClient::VERSION
  spec.authors       = ["Kelly Price"]
  spec.email         = ["kellyjosephprice@gmail.com"]
  spec.summary       = %q{Eventbrite API Client}
  spec.description   = %q{A simple interface for the Eventbrite API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "rspec", "~> 3.3"

  spec.add_runtime_dependency "httparty", "~> 0"
end
