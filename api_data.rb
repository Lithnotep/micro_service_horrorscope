require 'faraday'
require 'sinatra'
require './serializers/neos_serializer'
require 'pry'

class ApiData < Sinatra::Base

  get '/greeting' do
      "Hello"
  end


  get "/harbinger/:asteroid_id" do
    binding.pry#unsure if there will be a parameter here
    content_type :json
    NeosSerializer.new.harbinger(NeosService.new.harbinger(params[:asteroid_id])).to_json
  end


  get '/daily' do
    content_type :json
    NeosSerializer.new.daily(NeosService.new.current).to_json
  end

  get '/birthday' do
    content_type :json
    NeosSerializer.new.birthday(NeosService.new.birthday).to_json
  end

end
