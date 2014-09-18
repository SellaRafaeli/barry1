include Mongo

$db    = CONN = MongoClient.new("localhost", 27017).db($app_name)

#supply to_bson_id is important to be able to easily query by id. See http://stackoverflow.com/questions/22849420/query-mongodb-objectid-using-ruby-driver
class String
	def to_bson_id
  	BSON::ObjectId.from_string(self)
	end
end

class NilClass
	def to_bson_id
  	self
	end
end

module MONGO
 	extend self 	
end