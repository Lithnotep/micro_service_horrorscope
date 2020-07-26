require 'faraday'
require 'sinatra'
require './serializers/neos_serializer'
require 'pry'

class ApiData < Sinatra::Base

  get '/greeting' do
      "Hello"
  end


  get "/harbinger/:id" do #unsure if there will be a parameter here
    conn = Faraday.new(url: 'https://api.nasa.gov', params: {api_key: ENV['nasa_api_key']})
  end


  get '/daily' do
    content_type :json
    NeosSerializer.new.daily(NeosService.new.current).to_json
  end

end
