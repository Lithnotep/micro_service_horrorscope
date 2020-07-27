# require 'simplecov'
# SimpleCov.start
require 'dotenv'
Dotenv.load
require 'rack/test'
require 'rspec'
require 'webmock/rspec'
require './serializers/neos_serializer'

WebMock.disable_net_connect!(allow_localhost: true)

ENV['RACK_ENV'] = 'test'

require './api_data'

module RSpecMixin
  include Rack::Test::Methods
  def app() ApiData end
end

RSpec.configure { |c| c.include RSpecMixin }
