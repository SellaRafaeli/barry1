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
require './posts/posts_api'
require './posts/post'

puts "Ready to rock".light_red

$x = 12
get '/' do
	$x = $x + params[:id].to_i
	$x.to_s
end

post '/' do
	$x = $x + params[:id].to_i
	$x.to_s
end
