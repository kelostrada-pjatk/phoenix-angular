
var computersApp = angular.module("computersApp",["ngRoute"]);

computersApp.config(function ($routeProvider){
    $routeProvider.
    when("/computers",{
        templateUrl:"./computers",
        controller:"computersCtrl"
    }).
    when("/computer/:id",{
        templateUrl:"./computers/show",
        controller:"computerCtrl"
    })
    .otherwise({
        redirectTo:"/computers"
    });
});

computersApp.controller("computersCtrl", ['$scope', '$http', function($scope, $http) {

    $scope.computers = [];

    var retrieveComputers = function() {
        $http.get("/api/computers")
            .success(function(data,status,headers,config) {
                $scope.computers = data.data;
            })
            .error(function(data,status,headers,config){
                console.log(data,status);
            });
    };

    retrieveComputers();
}]);

computersApp.controller("computerCtrl", ['$scope', '$http', '$routeParams', function($scope, $http, $routeParams) {

    var retrieveComputer = function(id) {
        $http.get("/api/computers/" + id)
            .success(function(data,status,headers,config) {
                $scope.computer = data.data;
            })
            .error(function(data,status,headers,config){
                console.log(data,status);
            });
    };

    retrieveComputer($routeParams.id);

}]);
