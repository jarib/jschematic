# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jschematic/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'jschematic'
  s.version     = Jschematic::VERSION
  s.authors     = ["Mike Sassak", "Jari Bakken"]
  s.email       = ["msassak@gmail.com", "jari.bakken@gmail.com"]
  s.description = "JSON Schema v3 Validator"
  s.summary     = "jschematic #{s.version}"
  s.homepage    = "https://github.com/jarib/jschematic"

  s.add_dependency 'addressable'

  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'yajl-ruby'
  s.add_development_dependency 'rake'

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end
