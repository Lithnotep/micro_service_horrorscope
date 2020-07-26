require 'faraday'
require 'sinatra'
require "pry"

class ApiData < Sinatra::Base

  get '/greeting' do
      "Hello"
  end

  get "/harbinger/:id" #unsure if there will be a parameter here
    conn = Faraday.new(url: 'https://api.nasa.gov', params: {api_key: ENV['nasa_api_key']})
  end


end
