$users = $db.collection('users')

namespace '/users' do
	get '/:_id' do 		
		$users.find(_id: params[:_id].to_bson_id).first.to_json
	end

	post '/' do
		z = $users.insert(params.merge(rand1000: rand(1000)))
		{status: 200, id: z.to_s}.to_json
	end
end

