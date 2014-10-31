var app = angular.module("barry", ['ngRoute', 'jsonFormatter']);

app.config(function($routeProvider){
  $routeProvider.when("/",
    {
      templateUrl: "login.html",
      controller: "LoginCtrl"
    }).when('/profile', {
  		templateUrl: "profile.html",      
  		controller: "ProfileCtrl",
    }).when('/analytics', {
      templateUrl: "analytics.html",      
      controller: "AnalyticsCtrl"
    }).when('/logout', {
  		template: " ",
  		controller: "LoginCtrl"
    });
});

app.run(function($rootScope, $location, Comm) {        
  root = $rootScope;

  window.goTo = function(path) {
    $location.path(path);
  }
  window.thisPageIs = function(path) {
    return ($location.path() == path);
  }

  $rootScope.$on('$routeChangeSuccess', function() {
    $rootScope.isLoginPage = $location.path() == "/";
  });
  
});

function LoginCtrl($scope, $route, $routeParams, $location, $rootScope, Comm) {
  g1 = $scope; // Expose $scope for debugging.  
  
  $scope.login = function() {
    $scope.status = {msg: 'Logging in...'};     
    user_params = { username: $scope.username, password: $scope.password };
    
    Comm.signin(user_params, 
      function succ(res) {      
        $scope.status = {msg: "Success"}
        setCurrentUser(res.data);
        goTo('/profile');
      }, 
      function fail(res) {
        $scope.status = {msg: "Failed to Log In."};        
        goTo('/');
      }
    ); 
  };  

  $scope.logout = function() {      
    Comm.logout();
    $rootScope.current_user = null;
    goTo('/');  
  }

  if ($location.path() == "/logout") { 
    $scope.logout() 
  }
}

function ProfileCtrl($scope, $route, $routeParams, $filter, $rootScope, Comm) {
	p1 = $scope;
  c1 = Comm;
  
  $scope.createUser = function() {
    $scope.create_status = {msg: 'Creating...'};     
    user_params = { username: $scope.new_username, password: $scope.new_password };
    
    Comm.create(user_params, 
      function succ(res) {      
        $scope.create_status = {msg: "Successfully created user."}        
      }, 
      function fail(res) {
        $scope.create_status = {msg: "Failed to Create."};        
      }
    ); 
  };

	Comm.getMe(function(res) {
	  $scope.userdata = res.data.current_user;
  });

  $scope.mockCreditLines = [{name: "Zara", avgMonthlyFlow: 5000, creditPossible: {amount: 10, interestPct: 3.4}, active: true},
                {name: "Castro", avgMonthlyFlow: 4300, creditPossible: {amount: 20, interestPct: 2.4}, disable: true},
                {name: "H&M", avgMonthlyFlow: 2700, creditPossible: {amount: 400, interestPct: 3.9}},
                {name: "H&O", avgMonthlyFlow: 2900, creditPossible: {amount: 150, interestPct: 3.6}}];
              
  $scope.activate = function() {  alert('activating'); }
}

less = {
  logLevel: 1
}
