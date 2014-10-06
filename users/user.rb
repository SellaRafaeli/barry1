$users = $db.collection('users')

module User
	extend self

	def create(params)
		token = rand(1000).to_s		
		new_user_data = {name: params.name, age: params.age, token: token}
		id  = $users.add(new_user_data)
		{id: id, token: token}
	end

	def find_one(params)
		$users.find_one(params)
	end

	def basic_data(criteria)		
		user = $users.find(criteria).first
		subfields = {_id: user._id} if user		
	end

end