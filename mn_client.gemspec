# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mn_client/version'

Gem::Specification.new do |spec|
  spec.name          = "mn_client"
  spec.version       = MnClient::VERSION
  spec.authors       = ["Andersen Fan"]
  spec.email         = ["as181920@hotmail.com"]
  spec.description   = %q{micro_notes client}
  spec.summary       = %q{client for micro_notes api server}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'her'
  #spec.add_dependency "httparty"
  spec.add_dependency 'faraday'
  #spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'em-synchrony'
  spec.add_dependency 'em-http-request'
  spec.add_dependency 'yajl-ruby'
  spec.add_dependency 'multi_json'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "rb-inotify"
end

