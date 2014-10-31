# The following are exposed globally via settings.key_name.
set :raise_errors,    false
set :show_exceptions, false

set :sessions,        true 
set :session_secret,  'eric_clapton'

set :public_folder,   File.dirname(__FILE__) + '/public'
set :my_key,          'my_val' # settings.my_key == 'my_val'

# The following are exposed globally via $varname.
$app_name   = 'barry2'
$prod       = settings.production?

require './db/settings'
