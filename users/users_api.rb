$users = $db.collection('users')

namespace '/users' do
	
	# curl localhost:9393/users/vz2xtul-904
	get '/:_id' do 				
		$users.findOne(params[:_id]).to_json
	end

	# curl -d "name=moshe&age=20" localhost:9393/users/create
	post '/create' do
		new_obj = $users.add(params)
		{status: 200, id: new_obj}.to_json
	end

	# curl -H "Content-Type: application/json" -d '"data":{"letters":"abc","password":"xyz"}' http://localhost:9393/users/vz2xtul-904/update
	post '/:_id/update' do			 	
	 	$users.update({_id: params[:_id]}, '$set' => params[:data])			 
  end

end

