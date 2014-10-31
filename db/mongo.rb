include Mongo

# Instantiate and connect to the production MongoLab database if production, or
# a local instance if development.
$db = CONN = MongoClient.from_uri(settings.mongodb_uri).db(settings.mongodb_db_name)
puts "Running against MongoDB: #{settings.mongodb_uri} db:#{settings.mongodb_db_name}"

# Custom methods to make dealing with Mongo object ids easier.
# Some ruby/mongo hacking here. 
class Mongo::Collection

	#WIP
	# def find_one_with_cache(params)
	# 	$cache[params.to_s] ||= find_one(params)
	# end

	def find_one(params)
		self.find(params).first	
	end

	def find_all(params = {})
		self.find(params).to_a
	end

  def get(_id)
    self.find_one(_id: _id)
  end

	def add(doc)
		doc[:_id] = nice_id
		self.insert(doc)
	end

	def update_id(_id, fields)
		self.update({_id: _id}, '$set' => fields)		
	end
end
