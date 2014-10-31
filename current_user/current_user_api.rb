#current user
namespace '/current_user' do
		
  get '/me' do
    return {nobody: true, err: 'Not logged in'} unless session.user
    current_user = User.get_basic_data(session.user._id)
    {current_user: current_user} 
  end

end
