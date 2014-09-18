require 'rubygems'
require 'bundler'
require 'sinatra/namespace'
require 'json'

Bundler.require

puts "done requiring".blue

# config
$app_name = 'boilerApp1'

# our app files
require './db/mongo.rb'
require './users/users_api.rb'
	
# sanity + let's get cooking
get '/' do 
	"This is #{$app_name}\n" 
end
