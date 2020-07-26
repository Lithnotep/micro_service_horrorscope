require 'faraday'
require 'sinatra'
require './serializers/neos_serializer'
require 'pry'

class ApiData < Sinatra::Base

  get '/greeting' do
      "Hello"
  end

  get '/daily' do
    content_type :json
    NeosSerializer.new.daily(NeosService.new.current).to_json
  end
end
