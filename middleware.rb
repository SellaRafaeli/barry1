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
	content_type 'application/json'
  @response.body = @response.body.to_json
end

def bp
	binding.pry
end

def set_current_user		
	current_user = (token     = request.cookies['user_token']) ? User.basic_data(token: token) : nil
	params['current_user']    = current_user
	params['current_user_id'] = params['cuid'] = current_user && current_user._id 
end
