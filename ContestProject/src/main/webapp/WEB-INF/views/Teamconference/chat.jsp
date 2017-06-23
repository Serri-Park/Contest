<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>Insert title here</title>
    <script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script> 

	<link rel="stylesheet" href="resources/css/pagecss.css">
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">


    <title>webSocket</title>
    <!-- <div class="col-lg" style="height:40px; width:100px;">
		<div class="input-group">
			<input type="text" placeholder="아이디입력" id="client_name"style="height:40px; width:100px;">
			<br> 
			<span class="input-group-btn" >
				<button class="btn btn-default" type="button" id="conncet_server" style="height:40px; color:red;">서버연결</button>
			</span>
		</div>
	</div> -->

<div class="note blue" style="width:300px; height:80px; right:20px; top:75%; margin-bottom:-50px; background-color:#e2e2e2; z-index:1;">
<p style="color:#e31937; font-size :20px; font-family:'Comic Sans MS';">Chat</p>
	<div class="well" id="msg" style="overflow-x:hidden; overflow-y:scroll; width:300px; height:80px; padding:1px;"></div>
	
		<div class="input-group" style="margin-top:-20px;">
			<input type="text" class="form-control" placeholder="메세지보내기" id="message" style="height:30px;"> 
			<span class="input-group-btn">
				<button class="btn btn-danger" id="send" style="height:30px;">Send</button>
			</span>
		</div>
	
</div>
<nav class="menu" style="display:none">
   <input type="checkbox" href="#" class="menu-open" name="menu-open" id="menu-open" />
   <label class="menu-open-button" for="menu-open">
    <span class="lines line-1"></span>
    <span class="lines line-2"></span>
    <span class="lines line-3"></span>
  </label>
</nav>

     <script type="text/javascript">

     /////////////////
     var menunum = 0;
		$(".menu*").on("click","input",function(){
			if(menunum % 2 == 0){
			$(".note").toggle('500');
			}else{
			$(".note").toggle('500');
			}
			menunum++;
			
		});
		function moveScroll(id) { 
		    var el = document.getElementById(id); 
		if (el.scrollHeight > 0) el.scrollTop = el.scrollHeight; 
		} 
     
    	 var chater;
    	 var websocket;
        $(function(){
            	var clientName =  "박세환";  // $("#client_name").val();
				if ("WebSocket" in window) {
					websocket = new WebSocket("ws://172.19.2.235:8080/second/echo?name=${sessionScope.u_id}&t_id= ${sessionScope.t_id}");
					
				}
            
            //$("#conncet_server").click(function(){
            	//$("#conncet_server").hide();
            	//$("#client_name").hide();
            	//$(".container").show();
            	$(".menu").show();
            //});
            
            
           // $("#conncet_server").bind("click", function() {
            	
            	websocket.onopen = function(evnt) {
                   
                };
               
                websocket.onerror = function(evnt) {
                };
                websocket.onclose = function(evnt) {
                    $("#tou").html("서버 연결끊기!")
                };
               /*   websocket.onText = function(times){
               	  $("#timer").html(times.data);
                }; */ 
                 websocket.onmessage = function server(evnt) {
                	if(evnt.data.match('!!#time')){  //시간설정
                		if(count == 0){
                    		$('.textarea').prop('disabled', false);
                    	}
                	
                	times = evnt.data.substr(7,1);
                	console.log("소켓 실행됬습니다.");
                	countDown(0,0,times,'theTime');
                	
                	}else{
                    $("#msg").html($("#msg").html() + "<br/>" + evnt.data);
                	}
                }; 
                
           });
             $("#message").keypress(function(e) { 
 		       if(e.which == 13) { 
 		           $(this).blur(); 
 		           $('#send').focus().click();
 		           $('#message').focus().click();
 		         	 moveScroll("msg");
 		       } 
 		   });
             
             function send(){
                 if (websocket != null) {
                     var message = document.getElementById("message").value;
                     
                     if ($.trim(chater) != "") {
                     	message = chater + "\|" + message;
                     }
                     var st = srvTime();
                     var today = new Date(st);
                     today = today + "";
                     today = today.substr(15,9);
                     message = message + " ("+today+")";
                     websocket.send(message);
                    
                 } else {
                     alert("서버 연결되지않음.");
                 }
                 
                 chater = null;
                 document.getElementById("message").value = null;
                 
                
             }
            
             
              $("#send").bind("click", function() {
                send();
            	});  

        function changeChater(e) {
        	chater = $(e).html();
        	alert(chater + "님에게 귓속말을 합니다");
        } 
        
        
         var xmlHttp;

         function srvTime(){

        if (window.XMLHttpRequest) {//분기하지 않으면 IE에서만 작동된다.

        xmlHttp = new XMLHttpRequest(); // IE 7.0 이상, 크롬, 파이어폭스 등

        xmlHttp.open('HEAD',window.location.href.toString(),false);

        xmlHttp.setRequestHeader("Content-Type", "text/html");

        xmlHttp.send('');

        return xmlHttp.getResponseHeader("Date");

        }

        } 

       
         
       
    </script>

</head>
<body>

</body>


</html>
