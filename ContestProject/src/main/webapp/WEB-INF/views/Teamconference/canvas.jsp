<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title></title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="./bwnav.jsp"%>
<%@include file="./chat.jsp"%>  

   <div id="toolbars" style="float:left; width:800px; margin-left:25%; margin-top:50px;display:inline;">
       <!-- 도트크기 -->
      <select id="dot" style="display:inline-block; width:100px;">
           <option value="1">1px</option>
           <option value="2">2px</option>  
           <option value="5">5px</option>
           <option value="10">10px</option>
       </select>
       <!-- 색깔 -->
       <input type="color" id="color" value="#000000" style="display:inline-block; width:100px;"/>
       <button id="btnDel" style="display:inline-block; width:100px;">지우기</button>
   <button type="button" style="display:inline-block; width:100px;" class="controls" onclick="saveCanvas()">저장 </button>
     <button type="button" style="display:inline-block; width:100px;" class="controls" onclick="loadCanvasClicked(event)">불러오기</button>
    <input type="file" id="canvas_file" value="캔버스" style="display:none; width:100px;" onchange="loadCanvas(this)"/> 
  </div>
  <br>
   <canvas id="canvas" width="1000px" height="500px" style="float:left;box-shadow:0 0 10px #e31937;border-radius:10px; margin-left:25%;border:2px solid #e31937; background-color:rgb(245,245,245); display:inline;">
   </canvas>

   
   <script type="text/javascript">
   var posX = 0;
   var posY = 0;
   var drawable = false;
 //  var isEditable = true;
		   var canvas, ctx;
	          var dot = 1;
	           var color = '#000000';

 

  	 var paintwebsocket;
  	$(function(){
       	var clientName =  "박세환";  // $("#client_name").val();
			if ("paintwebsocket" in window) {
				paintwebsocket = new WebSocket("ws://172.19.2.235:8080/second/paint-echo?name=" + clientName);
			}
	   
		paintwebsocket.onopen = function(evnt) {
			
       };
      
       paintwebsocket.onerror = function(evnt) {
    	   alert("열지못함");
       };
       paintwebsocket.onclose = function(evnt) {
           alert("서버 닫김");
       };
       
       paintwebsocket.onmessage = function server(evnt) {

				var msgs = evnt.data.split(" ");
				var recolor = msgs[0];
				var redot = msgs[1];
				var reposX = msgs[2];
				var reposY = msgs[3];
				var recoorsX = msgs[4];
				var recoorsY = msgs[5];
				
				ctx.strokeStyle = recolor;
				ctx.lineWidth = redot;
	            ctx.beginPath();

	            ctx.moveTo(reposX, reposY);

	            ctx.lineTo(recoorsX, recoorsY);

	            ctx.stroke();

	            ctx.closePath();
			
       };
  	});

   // 그리기 옵션

           // 그리기 옵션 - 도트크기
          $('#dot').bind('change', function(){
              dot = $('#dot').val();
            });
           // 그리기 옵션 - 색깔
          $('#color').bind('change', function(){
             color = $('#color').val();
           });

          // 지우기
                 function clearCanvas()
                  {
                      ctx.clearRect(0, 0, canvas.width, canvas.height);
                      ctx.beginPath();

                      localStorage.removeItem('imgData');
                  }

                  $("#btnDel").click(function(){
                     clearCanvas();
                 });

      window.onload = function(){
         canvas = document.getElementById("canvas");
         ctx = canvas.getContext("2d");

         canvas.addEventListener("onmousedown",listener);
         canvas.addEventListener("onmousemove",listener);
         canvas.addEventListener("onmouseup",listener);
         canvas.addEventListener("mousedown", listener);
         canvas.addEventListener("mousemove", listener);
         canvas.addEventListener("mouseup", listener);
         canvas.addEventListener("mouseout", listener);
      }

      function listener(event) {
         switch(event.type){
            case "mousedown":
               initDraw(event);
               break;
            case "mousemove":
               if(drawable)
                  draw(event);

               break; 

            case "mouseout":
            case "mouseup":
               finishDraw();
               break;

         }
      }

      function initDraw(event){
/*       	if( !isEditable ){
      		return;
      	} */
    	  var coors = getPosition(event);
    	  ctx.strokeStyle = color;
         ctx.beginPath();
         drawable = true;
         posX = coors.X;
         posY = coors.Y;

         
      }
      function draw(event) {
/*     	  if( !isEditable ){
        		return;
        	} */
    	  var coors = getPosition(event);
    	  paintwebsocket.send(color+"\|"+dot+"\|"+posX+"\|"+posY+"\|"+coors.X+"\|"+coors.Y);
    	  ctx.moveTo(posX,posY);
    	  ctx.lineTo(coors.X,coors.Y);
    	  ctx.stroke();
    	  posX = coors.X;
    	  posY = coors.Y;


      }
      function finishDraw() {
/*     	  if( !isEditable ){
        		return;
        	} */
         drawable = false;
         ctx.closePath();
         
      }
      function getPosition(event) {
         var x = event.pageX - canvas.offsetLeft;
         var y = event.pageY - canvas.offsetTop;
         return {X: x, Y: y};
         // body...
      }
      function saveCanvas()
      {
        var link = document.createElement('a');
        link.download = "canvas.png";
        link.href = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");;
        link.click();
      }
      function loadCanvasClicked(event)
     {
        event.preventDefault();
        document.getElementById("canvas_file").click();
      }
      function loadCanvas(file_btn)
    {
        var file = file_btn.files[0];
        var imageObj = new Image();
        imageObj.src = window.URL.createObjectURL(file);
        imageObj.onload = function(){
          ctx.drawImage(imageObj,0,0,500 , 500);
        }
      }


 
   </script>
</body>
</html>
