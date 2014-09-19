$users = $db.collection('users')

namespace '/users' do
		
	get '/me' do 		
		$users.findOne({_id: current_user._id})	 #curl --cookie "user_token=642" localhost:9393/users/me			
	end

	get '/:_id' do # curl localhost:9393/users/vz2xtul-904 				 				
		#$users.findOne(_id: params[:_id])
	end

	post '/create' do # curl -d "name=moshe&age=20" localhost:9393/users/create		
		id, token = User.create(params)	
		{status: 200, id: id, token: token}
	end
	
	post '/updateMe' do # curl --cookie "user_token=642" -H "Content-Type: application/json" -d '{"data":{"letters":"abc","password":"xyz"}}' http://localhost:9393/users/updateMe	 		 		 	
	 	$users.update({_id: current_user._id}, '$set' => params[:data] || {})			 
  end

end