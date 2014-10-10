namespace '/users' do
		
	get '/me' do 		
		User.find_one({_id: params.cuid}) #curl --cookie "user_token=758" localhost:8001/users/me						
	end

	get '/id/:_id' do
		User.find_one({_id: params._id}) #curl localhost:8001/users/id/274						
	end

	post '/create' do # curl -d "name=moshe&age=20" localhost:8001/users/create		
		res = User.create(params)		
		cookies[:user_auth_token] = res[:token]
		{status: 200}.merge(res)
	end
	
	post '/updateMe' do # curl --cookie "user_token=642" -H "Content-Type: application/json" -d '{"data":{"letters":"abc","password":"xyz"}}' http://localhost:8001/users/updateMe	 		 		 	
	 	$users.update({_id: current_user._id}, '$set' => params[:data] || {})			 
  end

end