$posts = $db.collection('posts')

module Post
	extend self

	def find_one(params) 
		$posts.find_one(params)
	end

	def create(params)			
		new_post_data = {user_id: params.cuid, title: params.title, content: params.content}
		id            = $posts.add(new_post_data)	
	end


	def by_user

	end

end