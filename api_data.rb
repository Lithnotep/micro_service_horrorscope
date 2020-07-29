require 'rubygems'
require 'faraday'
require 'sinatra'
require './serializers/neos_serializer'
require 'pry'

class ApiData < Sinatra::Base

  get '/greeting' do
      "Hello"
  end


  get "/harbinger" do
    id = params[:asteroid_id]
    content_type :json
    NeosSerializer.new.harbinger(NeosService.new.harbinger(id)).to_json
  end


  get '/daily' do
    content_type :json
    NeosSerializer.new.daily(NeosService.new.current).to_json
  end

  get '/birthday' do
    birth_date = params[:birthday]
    content_type :json
    NeosSerializer.new.birthday(NeosService.new.birthday(birth_date)).to_json
  end

  get '/faker' do
    content_type :json
    NeosSerializer.new.faker.to_json
  end

end
