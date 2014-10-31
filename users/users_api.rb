namespace '/users' do
		
	get '/id/:_id' do
		User.find_one({_id: params._id}) 
	end

	post '/create' do		
		admin? ? User.create(params) : halt(401, {err: "Not admin."})
	end
	
	post '/logout' do						
		session.clear
		{msg: "Good-bye"}		
	end

	post '/login' do
		bp
		user = User.find_with_password(params[:username], params[:password])		
		if user 
			session.user = User.basic_data(user)
		      session.user_id = user._id
			{current_user: session.user}
		else
			halt(401, {error: "Bad Credentials."})
		end 
	end
	
end
