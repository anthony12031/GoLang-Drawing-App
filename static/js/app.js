var app = angular.module('pizarra',[]);

app.controller('userCtrl',['$scope','$http',function($scope,$http){


$scope.registerUser = function(username,pass){
  console.log('register')
  console.log(username)
  console.log(pass)
}

$scope.login = function(){
  console.log('login')
}


}])



$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});
