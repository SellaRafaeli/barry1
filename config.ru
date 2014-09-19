#config
$app_name   = 'barry1'
$production = (ENV['production'] == true)

require './app'
run Sinatra::Application

