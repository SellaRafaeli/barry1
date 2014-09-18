require 'rubygems'
require 'bundler'
require 'sinatra/namespace'
require 'json'

Bundler.require

# config - export to config.rb when expands
$app_name = 'boilerApp1'

# our app files - export to require.rb or st when expands
require './db/mongo.rb'
require './users/users_api.rb'
	
# sanity + let's get cooking 
get '/' do 
	"This is #{$app_name}\n" 
end

puts "Ready to rock'n'roll".light_red