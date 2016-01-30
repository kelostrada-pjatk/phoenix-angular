
var computersApp = angular.module("computersApp",["ngRoute"]);

computersApp.config(function ($routeProvider){
    $routeProvider.
    when("/computers",{
        templateUrl:"./partials/index.html",
        controller:"computersCtrl"
    }).
    when("/computers/new", {
        templateUrl:"./partials/edit.html",
        controller:"editComputerCtrl"
    }).
    when("/computers/:id",{
        templateUrl:"./partials/show.html",
        controller:"computerCtrl"
    }).
    when("/computers/:id/edit", {
        templateUrl:"./partials/edit.html",
        controller:"editComputerCtrl"
    })
    .otherwise({
        redirectTo:"/computers"
    });
});

computersApp.controller("computersCtrl", ['$rootScope', '$scope', '$http', function($rootScope, $scope, $http) {

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

var retrieveComputer = function($http, $scope, id) {
    $http.get("/api/computers/" + id)
        .success(function(data,status,headers,config) {
            $scope.computer = data.data;
        });
};

var updateComputer = function($http, $location, computer) {
    if (computer.id) {
        $http.patch("/api/computers/" + computer.id, {computer: computer})
            .success(function(data) {
                $location.path("/computers/" + computer.id);
            });
    } else {
        $http.post("/api/computers", {computer: computer})
            .success(function(data) {
                $location.path("/computers/" + data.data.id);
            });
    }
};

computersApp.controller("computerCtrl", ['$scope', '$http', '$routeParams', function($scope, $http, $routeParams) {
    retrieveComputer($http, $scope, $routeParams.id);
}]);

computersApp.controller("editComputerCtrl", ['$scope', '$http', '$routeParams', '$location', function($scope, $http, $routeParams, $location) {
    $scope.computer = {};
    retrieveComputer($http, $scope, $routeParams.id);

    $scope.editComputer = function(computer) {
        updateComputer($http, $location, computer);
    };

}]);

