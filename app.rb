require 'rubygems'
require 'bundler'
require 'sinatra/namespace'
require 'json' 

Bundler.require

# our app files - export to require.rb or st when expands
require './middleware'
require './ruby_awesomeness'
require './db/mongo'
require './users/user'
require './users/users_api'

puts "Ready to rock".light_red