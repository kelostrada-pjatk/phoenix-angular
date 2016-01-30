//$routeProvider - standardowy obiekt angulara ogarniający nawigację
computersApp.config(function ($routeProvider){
    $routeProvider.
    //when - określamy fragment url + szablon i kontroler z nim powiązany
    when("/listcars",{
        templateUrl:"./computers",
        controller:"carsCtrl"
    }).
        //:id - parametr w url
        when("/car/:id",{
            templateUrl:"./partials/car.html",
            controller:"carCtrl"
        })
        //taki else
        .otherwise({
            redirectTo:"/listcars"
        });
});
