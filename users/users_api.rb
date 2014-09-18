$users = $db.collection('users')

namespace '/users' do
	get '/:_id' do 		
		$users.find_by_id(params[:id]).to_json
	end

	post '/create' do
		new_obj = $users.insert(params)
		{status: 200, id: new_obj.to_s}.to_json
	end

	# post '/:_id/update' do
	# 	$users.update( { :_id => post_id }, '$set' => params )		
	# end

end

