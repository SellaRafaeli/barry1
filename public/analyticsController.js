function AnalyticsCtrl($scope, $route, $routeParams, $filter, Comm) {
	Comm.getMe(function(res) {
	  $scope.userdata = res.data.current_user;
  });

  $scope.analytics = [{name: "Cash Flow", value: 5000},
                {name: "Growth Projection", value: 2700}, 
                {name: "Past Flow Gaps", value: 3100}];
}
