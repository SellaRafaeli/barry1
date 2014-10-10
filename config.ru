#config

#\ -p 8001 #set default port
$app_name   = 'barry1'
$production = (ENV['production'] == true)

require './app'

run Sinatra::Application

