# DB settings.

# Production environment will have the MONGOLAB_URI and related variables set.
DEFAULT_MONGODB_DB_NAME = "barry"
set :mongodb_db_name, ENV["MONGOLAB_DB_NAME"] || DEFAULT_MONGODB_DB_NAME

DEFAULT_MONGODB_URI = "mongodb://localhost:27017/#{settings.mongodb_db_name}"
set :mongodb_uri,     ENV["MONGOLAB_URI"]     || DEFAULT_MONGODB_URI
