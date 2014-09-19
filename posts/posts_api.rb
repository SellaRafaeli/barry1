$posts = $db.collection('posts')

namespace '/posts' do
	
	get '/:_id' do # curl localhost:9393/posts/776
		$posts.findOne(params[:_id])
	end

	post '/create' do # curl -d "user=moshe&age=20" localhost:9393/posts/create
		new_obj = $posts.add(params)
		{status: 200, id: new_obj}
	end
	
	post '/:_id/update' do # curl -H "Content-Type: application/json" -d '"data":{"letters":"abc","password":"xyz"}' http://localhost:9393/posts/11776/update
	 	$posts.update({_id: params[:_id]}, '$set' => params[:data])			 
  end

end

