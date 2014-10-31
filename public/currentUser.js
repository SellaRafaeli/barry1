app.run( function($rootScope, $location, Comm) {    
    window.loggedIn = function() { 
      return ($rootScope.current_user != null); 
    }    

    window.setCurrentUser = function(data) {      
      $rootScope.current_user = data.current_user;
      goTo('/profile');      
    }

    window.autoSignIn = function(res) {      
      Comm.getMe(function(res){            
        if (res.data.current_user) {
          setCurrentUser(res.data);          
        } else {
          goTo('/');      
        }       
      })  
    }
    
    //upon app-load
    if (!loggedIn())
      autoSignIn();
    else // logged-in
      if (thisPageIs('/'))
        goTo('/profile');              
});