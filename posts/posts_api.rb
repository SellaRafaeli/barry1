namespace '/posts' do
		
	post '/create' do # curl --cookie "user_token=97" -d "title=my_post&content=some_text" localhost:8001/posts/create
		new_id = Post.create(params)				
		{status: 200, _id: new_id}
	end

	get '/id/:_id' do # curl localhost:8001/posts/id/9932
		Post.find_one({_id: params._id})
	end

	get '/user_id/:user_id' do
		$posts.find_all({user_id: params.user_id})
	end
		
	post '/:_id/update' do # curl -H "Content-Type: application/json" -d '"data":{"letters":"abc","password":"xyz"}' http://localhost:8001/posts/11776/update
	 	$posts.update({_id: params[:_id]}, '$set' => params.data)			 
  end

end

