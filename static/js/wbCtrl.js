var app = angular.module('pizarra',[]);

app.controller('wbCtrl',['$scope','$http','$window',function($scope,$http,$window){

$scope.user = "user";

$scope.logout = function(){
  console.log("logout")
  $http.get('/v1/user/logout')
  .then(function(res){
    console.log(res);
    $window.location.href = "/whiteBoard";
  })
}


}])

app.factory('canvasUtils',[function(){

  var currentColor = 'black';
  var currentPencilSize = 2;

  function setCurrentPencilSize(size){
    currentPencilSize = size;
  }

  function setColor(c){
    currentColor = c;
  }

  function drawPoints(ctx,points){
    ctx.lineWidth = 2;
    ctx.lineCap = 'round';
    ctx.lineJoin = 'round';
    ctx.strokeStyle = currentColor;
    ctx.lineWidth = currentPencilSize;
    var p1 = points[0];
    var p2 = points[1];
    ctx.beginPath();
    ctx.moveTo(p1.x, p1.y);
    for (var i = 1, len = points.length; i < len; i++) {
      var midPoint = midPointBtw(p1, p2);
      ctx.quadraticCurveTo(p1.x, p1.y, midPoint.x, midPoint.y);
      p1 = points[i];
      p2 = points[i+1];
    }
    ctx.lineTo(p1.x, p1.y);
    ctx.stroke();
  }

function midPointBtw(p1, p2) {
 return {
   x: p1.x + (p2.x - p1.x) / 2,
   y: p1.y + (p2.y - p1.y) / 2
 };
 }


  return {
    drawPoints:drawPoints,
    setCurrentPencilSize:setCurrentPencilSize,
    setColor:setColor
  }
}])

app.directive('lienzo',['canvasUtils',function(canvasUtils){
  return{
    restrict: 'E',
    templateUrl: '/static/partials/lienzo.html',
    link:function(scope, element, attrs){
      //establecer el ancho y alto del canvas al tamaño de la pantalla
      setCanvasSizes();

      var ctx = $('#drawingCanvas').get(0).getContext('2d');
      var ctxResultCanvas =  $('#resultCanvas').get(0).getContext('2d');
      var points = [];
      var isDrawing = false;


      function setCanvasSizes(){
        $('#drawingCanvas').get(0).width = $(window).width();
        $('#drawingCanvas').get(0).height = $(window).height();
        $('#resultCanvas').get(0).width = $(window).width();
        $('#resultCanvas').get(0).height = $(window).height();
      }

      element.on('mousedown',function(e){
        isDrawing = true;
        var position = { x: e.clientX, y: e.clientY };
        points.push(position);
      })
      element.on('mousemove',function(e){
        if (!isDrawing) return;
        var position = { x: e.clientX, y: e.clientY }
        points.push(position);
        ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        canvasUtils.drawPoints(ctx,points);
      })
      element.on('mouseup',function(e){
        isDrawing = false;
        canvasUtils.drawPoints(ctxResultCanvas,points);
        ctx.clearRect(0,0,ctx.canvas.width,ctx.canvas.height);
        points.length = 0;
      })

    }
  }
}])

app.directive('pencil',[function(){
  return {
    restrict: 'E',
    templateUrl: '/static/partials/pencil.html',
    link: function(scope, element, attrs) {
      imgpointer ='url(/static/img/pencil.png )';
      var pencilOffsetY = 35;
      document.getElementById('drawingCanvas').style.cursor=imgpointer+"0 "+pencilOffsetY+",auto";
      element.on('click',function(){
        document.getElementById('drawingCanvas').style.cursor=imgpointer+"0 "+pencilOffsetY+",auto";
      })
    }
  };
}])

app.directive('bin',[function(){
  return {
    restrict: 'E',
    templateUrl: '/static/partials/bin.html',
    link: function(scope, element, attrs) {
      element.on('click',function(e){
        var resultCanvas = $('#resultCanvas').get(0);
        var ctx = resultCanvas.getContext('2d');
        ctx.clearRect(0,0,ctx.canvas.width,ctx.canvas.height)
      })
    }
  };
}])

app.directive('sizeBar',[function(){
  return {
      restrict: 'E',
      templateUrl: '/static/partials/size-bar.html',
      controller:['canvasUtils','$scope',function(canvasUtils,$scope){
        $scope.setSize = function(size){
          canvasUtils.setCurrentPencilSize(size);
        }
      }]
  }
}])

app.directive('colorPicker',[function(){
  return {
    restrict: 'E',
    templateUrl: '/static/partials/color-picker.html',
    controller:['$scope','canvasUtils',function($scope,canvasUtils){
      $scope.colors = ['#00BFFF','#7CFC00','#EEC900','#FF0000 ','#8E388E']
      $scope.setColor = function(color){
        canvasUtils.setColor(color);
      }
    }]
  };
}])
