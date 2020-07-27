
require 'dotenv/load'
require './api_data'
require './services/neos_service'
require 'bundler'

Bundler.require

run ApiData
# use "rackup" in command line to run config.ru and get sinatra app server running.
