require 'rubygems'
require 'bundler'
require 'sinatra/namespace'
require 'json'

Bundler.require

puts "done requiring".blue

# config
$app_name = 'boilerApp1'

# our app files
require './config/config.rb'
require './db/mongo.rb'
require './base_api.rb'
require './users/users_api.rb'
	