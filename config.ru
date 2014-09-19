#config
$app_name   = 'boilerApp1'
$production = (ENV['production'] == true)

require './app'
run Sinatra::Application

