# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'blabbr_api/version'

Gem::Specification.new do |s|
  s.name         = "blabbr_api"
  s.version      = BlabbrApi::VERSION
  s.authors      = ["chatgris"]
  s.email        = "jboyer@af83.com"
  s.summary      = "Api of blabbr app"
  s.description  = "Api of blabbr app"
  s.homepage     = "https://github.com/chatgris/blabbr_api"

  s.files        = `git ls-files app lib`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.add_dependency "grape",                     "~> 0.1.5"
  #s.add_dependency "blabbr_core",              "~>0.0.1"
  s.add_development_dependency 'rack-test'
  s.add_development_dependency "rspec",         "~>2.8"
  s.add_development_dependency "fuubar"
  s.add_development_dependency "autotest-standalone"
end
