require 'rubygems'
require 'bundler'
require 'sinatra/namespace'
require 'json' 

Bundler.require

# our app files - export to require.rb or st when expands
require './middleware'
require './lib/mylib'
require './db/mongo'
require './users/user'
require './users/users_api'
require './posts/posts_api'
require './posts/post'

get '/' do 
	{msg: 'hello'}
end

puts "Ready to rock".light_red