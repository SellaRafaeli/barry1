**Barry** is a lightweight, low-ceremony, ready-to-use boiler-plate Sinatra-based Ruby web-app API BE based on principles of extreme minimalism and optimized for Developer Happiness. 

## Design Principles & Features
1. BE as API, agnostic to client, accepts and returns JSON. 
2. [NoSQL]-DB-as-model - no models in code, DB is source of truth.
3. Statelessness; authentication is done via token cookie.
4. Client-oriented routes over RESTfulness (e.g. '/updateMe' route rather than '/:id/update', since the former makes much more sense.)
5. Code minimalism. Empty lines tell no bugs or maintenance. 
6. Optimize for developer happiness. 

## Install:
1. $ git clone https://github.com/SellaRafaeli/barry.git
2. $ cd barry
3. $ bundle install
4. $ shotgun / rackup 

## Usage: 
 
Create user, get auth token 

```	
$ curl -d "name=moshe&age=20" localhost:9393/users/create	# {"status":200,"id":7604,"token":"126"}
```

Update user's address (using auth token cookie):

```
$ curl --cookie "user_token=126" -H "Content-Type: application/json" -d '{"data":{"country":"Israel","city":"Haifa"}}' http://localhost:9393/users/updateMe # {"ok":1,"nModified":1,"n":1}
```
 
Get user's data (using auth token cookie):

```
$ curl --cookie "user_token=642" localhost:9393/users/me # {"id":1109,"name":"moshe","age":"20","token":"642","letters":"abc","password":"xyz"}
```

## License
Barry is licensed under MIT. Copyright © 2014 Sella Rafaeli.

## Version History
0.0.1 - September 2014
