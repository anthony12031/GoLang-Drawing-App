var app = angular.module('user',[]);

app.controller('userCtrl',['$scope','$http','$window',function($scope,$http,$window){

$scope.registerUser = function(username,pass){
  var newUser = JSON.stringify({Username:username,Password:pass})
  $http.post('/v1/user',{Username:username,Password:pass})
  .then(function(res){
    console.log(res);
    //$window.location.href = "/whiteBoard";
  },function(err){
    console.error(err);
  })
}

$scope.login = function(usern,pass){
  $http.get('/v1/user/login/?username='+usern+'&password='+pass)
  .then(function(res){
    console.log(res);
    //$window.location.href = "/whiteBoard";
  },function(err){
    console.error(err);
  })
}

function getAllusers(){
$http.get('/v1/user')
.then(function(res){
  console.log(res.data);
},function(err){
  console.error(err);
})

$scope.login = function(){
  console.log('login')
}
}


}])



$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});
