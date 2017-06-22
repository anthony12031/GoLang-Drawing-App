<!DOCTYPE html>
<html ng-app="pizarra" ng-cloak>
<head>
<meta charset="utf-8"/>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="keywords" content="lavagna collaborativa, disegnare on line, applicazione real time, multiuser whiteboard, realtime application, drawing on line, drawing game, html5, web 2.0, software, internet, image capture, webcam" />
<meta name="description" content="lavagna multiutente condivisa in tempo reale,multiuser whiteboard real time application, draw on line and share your draw with all on the net" />
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
        <meta charset="utf-8" />
        <title>Real time whiteboard collaborative multicolor multiusers with saving state</title>
		<link rel="stylesheet" href="static/css/styles.css" />
		<link rel="stylesheet" type="text/css" href="static/css/jquery-ui-css.css" />

		 <!-- Boostrap -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	    <!-- Optional theme -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" 
	    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	    <link rel="stylesheet" href="./chat/css/chat.css" type="text/css" />
    </head>    
    <body ng-controller="teacherController">
    <div>
	<div id="controlli">	
<textarea name="boardtext"  id="writetext" class="tools" rows="6" cols="140" placeholder="write text" /></textarea>
<canvas id="canvaspicker" width="302" height="57" style="border:none;"></canvas>
<div id="divcontrolstudents">Block / unblock all Students in this room<br />
  <input id="controlstudents" type="checkbox" checked="checked" />allow all students to write on board<br />
  </div>
<div id="barrasize"><img src="static/img/size1.png" id="size1" /><img src="static/img/size2.png" id="size2" /><img src="static/img/size3.png" id="size3" /><img src="static/img/size4.png" id="size4" /></div>
<img src="static/img/pencil.png" alt="pencil" id="pencil" class="toolimages" /><br />
<img src="static/img/rubber.png" alt="eraser" id="eraser" class="toolimages" /><br />
<img src="static/img/text.png" alt="text tool" id="text" class="toolimages" /><br />
<img src="static/img/size.png" alt="size tool" id="sizetool" class="toolimages" /><br />
<img src="static/img/colorPalette.png" alt="colorpicker" id="colorpicker" class="toolimages" /><br />
    <img src="static/img/pointer-small.png" alt="colorpicker" id="pointer" class="toolimages" style="width:auto;padding:5px" /> 
<img src="static/img/undoNew.png" alt="Undo" id="undo" class="toolimages" /><br />
<img src="static/img/redo.png" alt="redo" id="redo" class="toolimages" /><br />
<img src="static/img/arrowLeft.png" alt="redo" id="slideLeft" class="toolimages" ng-click="slideLeft()"/><br />
<img src="static/img/square.png" alt="draw a square" id="square" class="toolimages" /><br />
<img src="static/img/line.png" alt="draw a straight line" id="straight" class="toolimages" /><br />
<img src="static/img/circle.png" alt="draw a circle" id="circle" class="toolimages" /><br />
<img src="static/img/fillBucket.png" alt="draw a circle" id="fill-bucket" class="toolimages" /><br />
<img src="static/img/bin.png" alt="clean the whole whiteboard" id="bin" class="toolimages" /><br />
<label for="file-imagefore"><img src="static/img/download.png" alt="download the image of the canvas" id="download" class="toolimages" /></label>
<input id="file-imagefore" type="file" style="display:none" /><br />
<label for="file-imagebg">
<img src="static/img/background.png" alt="change the background" id="backgroundchange" class="toolimages" />
</label>
<input id="file-imagebg" type="file" style="display:none" /><br />
 <img id="initcall" src="static/img/live-sessions.png" alt="open media call" class="toolimages" /><button id="butjoin">Join<br />caller</button>
</div>
<block-tool  ng-click="controStudents()"></block-tool> 
<div style="position:relative;">
<div id="draggabile"></div>
		<div id="cursors">
	    	<!-- The mouse pointers will be created here -->
		</div>	
<canvas id="respondcanvas"  width="1200" height="900">Your browser needs to support canvas for this to work!</canvas>		
<canvas id="bgcanvas" width="1200" height="900">Your browser needs to support canvas for this to work!</canvas>	
<canvas id="canvashapes" width="1200" height="900">Your browser needs to support canvas for this to work!</canvas>
</div>	
</div>


      <!-- Jquery -->
   <script   src="https://code.jquery.com/jquery-3.2.1.min.js"   
   integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="   crossorigin="anonymous"></script>
    <!-- AngulaJs -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.3/angular.min.js"></script>
    <!--<script  src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular-route.js"></script> -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.3/angular-animate.js"></script>

    <!-- user defined js -->
    <script type="text/javascript" src="./chat/js/app.js"></script>
    <script type="text/javascript" src="./chat/js/chatController.js"></script>
    <script type="text/javascript" src="./chat/js/socketService.js"></script>
    <!-- Bootstrap -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>	
    
    <!-- floodFill -->
    <script type="text/javascript" src="static/js/floodFill2D.js"></script>
    
    <!-- main module -->
    <script src="./static/js/app.js"></script>
    
    <!-- pizarra script -->
    <script src="static/js/script.js"></script>		

</body>
</html>         
