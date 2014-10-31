$users = $db.collection('users')
$users.ensure_index( { username: 1 }, { unique: true } )

module User
	extend self

def create(params)	
    bp
    data = params.just('username', 'password', 'name')

    return nil unless data.password
    data['password'] = BCrypt::Password.create(data['password'])

    id = $users.add(data)
    data.and(id: id)
  end

  def update_by_id(_id, fields)
    $users.update_id(_id, fields)
  end

  def find_one(params)	
    $users.find_one(params)
  end

  def find_with_password(username, given_password)
    user = self.find_one(username: username)  		
    return nil unless user

    real_password = BCrypt::Password.new(user.password)
    (real_password == given_password) ? user : nil		
  end

  def basic_data(user)
    user.just('_id', 'username', 'admin', 'company', 'name')
  end

  def find_basic_data(criteria)
    user = $users.find(criteria).first
    user && basic_data(user)
  end

  def get_basic_data(_id)
    find_basic_data(_id: _id)
  end
end
