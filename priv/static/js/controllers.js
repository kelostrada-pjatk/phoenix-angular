
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

computersApp.controller("computersCtrl", function() {

});

computersApp.controller("computerCtrl", function() {

});

var test = function() {
    console.log("test");
}