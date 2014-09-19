# tech middleware to ensure JSON on both sides. This file could use some improvement.

# before do
#   @params.merge! JSON.parse(request.body.read); request.body.rewind  
# end

use Rack::Parser, :content_types => {
  'application/json'  => Proc.new { |body| ::MultiJson.decode body }
}

before do		
	set_current_user
end

after do
 @response.body = @response.body.to_json
end

# == 

def current_user
	request.env['current_user']
end

def set_current_user
	request.env['current_user'] = (token = request.cookies['user_token']) ? User.basic_data(token: token) : nil
end
