app.service("Comm", function($http) {
  http = $http;

  function defaultCB(res) { 
    console.log(res) 
  }

  function doGet(route, cb) { 
      cb = cb || defaultCB;
      $http.get(route).then(cb).catch(console.log);
  }
  function doPost(route, params, cb, failCB) { 
      cb     = cb     || defaultCB;
      failCB = failCB || defaultCB;  
      $http.post(route, params).then(cb).catch(failCB);
  }

  var res = {
    message: "New data from a service",    

    signin: function(params, cb, failCB) {
      doPost("/users/login", params, cb, failCB);      
    },

    logout: function(cb) {
      doPost("/users/logout", {}, cb, cb);
    },

    create: function(params, cb, failCB) {
      doPost("/users/create", params, cb, failCB);      
    },

    getMe: function(cb) {
      doGet("/current_user/me", cb);
    },

  }

  return res;
});
