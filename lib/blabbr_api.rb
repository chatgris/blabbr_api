# encoding: utf-8
#
# Bundler should take care of require but :
# https://github.com/carlhuda/bundler/issues/1096
# https://github.com/carlhuda/bundler/issues/1041
#
# require "rubygems"
# require "bundler/setup"
# Bundler.require(:default)
require 'blabbr_core'
require 'grape'

Dir[File.dirname(__FILE__) + "/blabbr_api/*.rb"].each {|file| require file }
