require 'faraday'
require 'sinatra'
require "pry"

class ApiData < Sinatra::Base

  get '/greeting' do
      "Hello"
  end



end
