include Mongo

$db    = CONN = MongoClient.new("localhost", 27017).db($app_name)

# custom methods to make dealing with Mongo object ids easier. Some ruby/mongo hacking here. 
class Mongo::Collection

	#WIP
	# def find_one_with_cache(params)
	# 	$cache[params.to_s] ||= find_one(params)
	# end

	def find_one(params)
		self.find(params).first	
	end

	def find_all(params)
		self.find(params).to_a
	end

	def add(doc)
		doc[:_id] = nice_id
		self.insert(doc)
	end

	def nice_id #unique, url-able, dev-friendly. Try it yourself!
		$prod ? rand(36**7).to_s(36)+"-"+rand(1000).to_s : rand(10000).to_s
	end
end
