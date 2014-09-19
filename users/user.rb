module User
	extend self

	def create(base_params)
		token = rand(1000).to_s		
		new_user = base_params.merge!(token: token)
		id  = $users.add(new_user)
		[id, token]	
	end

	def basic_data(criteria)		
		user = $users.find(criteria).first
		subfields = {_id: user._id} if user		
	end

end