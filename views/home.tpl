<!DOCTYPE html>
<html lang="en" ng-app="pizarra">
<head>
	<meta charset="UTF-8">
	<title>White Board</title>
	<link rel="stylesheet" href="static/css/login.css">
</head>
<body>


	<div class="login-page" ng-controller='userCtrl'>
  <div class="form" >
    <form class="register-form"  ng-submit="registerUser(username,pass)">
      <input type="text" placeholder="name" id="nameRegister" ng-model="username"/>
      <input type="password" placeholder="password" id="passRegister" ng-model="pass"/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    <form class="login-form" ng-submit="login()">
      <input type="text" placeholder="username" ng-model="username"/>
      <input type="password" placeholder="password" ng-model="pass"/>
      <button>login</button>
      <p class="message">Not registered? <a href="#">Create an account</a></p>
    </form>
  </div>
</div>
	
    
   <!-- Jquery -->
   <script   src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
    <!-- AngulaJs -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.3/angular.min.js"></script>
   <script src="static/js/app.js"></script>

</body>
</html>