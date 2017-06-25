<!DOCTYPE html>
<html lang="en" ng-app="pizarra">
<head>
  <meta charset="UTF-8">
  <title>whiteBoard</title>
  <!-- material design lite -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.blue-light_blue.min.css" />
  <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

  <link rel="stylesheet" href="/static/css/whiteBoard.css">
  <link href="static/colorpanel-master/dist/jquery.colorpanel.css" rel="stylesheet">
</head>

<body ng-controller="wbCtrl">

  <!-- Colored raised button -->
<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="logout">
  logout
</button>


<lienzo></lienzo>
<pencil></pencil>
<bin></bin>
<size-bar></size-bar>
<color-picker></color-picker>



<div id="credits">Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>

<!-- Jquery -->
<script   src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
 <script src="static/colorpanel-master/dist/jquery.colorpanel.js"></script>
 <!-- AngulaJs -->
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.3/angular.min.js"></script>
<script src="/static/js/wbCtrl.js"></script>

</body>
</html>
