# encoding: utf-8

path = File.expand_path(File.dirname(__FILE__) + '/../lib/')
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)

require 'blabbr_api'
require 'rack/test'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db('blabbr_api_spec')
  config.identity_map_enabled = true
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.after :each do
    Mongoid.master.collections.reject { |c| c.name =~ /^system\./ }.each(&:drop)
  end
end

# see: http://groups.google.com/group/ruby-grape/browse_thread/thread/6547316b4783cd7c/369b33299264bca9?lnk=gst&q=rspec#369b33299264bca9
def app
  BlabbrApi::Api
end
