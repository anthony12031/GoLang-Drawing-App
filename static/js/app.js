var app = angular.module('pizarra',[]);

app.controller('userCtrl',['$scope','$http',function($scope,$http){


$scope.registerUser = function(username,pass){
  console.log('register')
  console.log(username)
  console.log(pass)
  var newUser = JSON.stringify({Username:username,Password:pass})
  console.log(newUser)
  $http.post('/v1/user',{Username:username,Password:pass})
  .then(function(res){
    console.log(res);
  },function(err){
    console.error(err);
  })
}

$scope.login = function(){
  console.log('login')
}


}])



$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});
