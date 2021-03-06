<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
<link rel="stylesheet" href="http://getbootstrap.com/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" href="resources/css/Modal.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>

<style>
.selected { background-color:red }
.unselected { background-color:white }
.dEnd{width:30px;
	height:10px;
	}
.defaultDiv{
border:1px solid red;
float:left;
width:230px;
height:170px;
margin-left:20px;
border-radius: 5px;
}
.defaultDiv1{
margin-left:10%; margin-right:10%; width:185px; height:110px;border-radius: 5px;
}
.defaultDiv2{
display:none;
}
.bwdiv{
border:1px solid red; float:left; width:220px; height:180px; margin-left:20px; border-radius: 5px;
}
.textarea{
margin-left:10%; margin-right:10%; width:175px; height:90px; resize: none; border-radius: 5px;
}
.submit{
margin-top:15px; margin-right:20px; float:right; border-radius: 5px; background-color:red; color:white;
}
.category_align{
width:200px;font-size:20px;  text-align:center; font-family:'Comic Sans MS'; color:black; display:inline-block;margin-right:10px; margin-bottom:20px;  border:1px solid #e31937; border-radius:5px;

}
</style>


    <!-- jQuery -->
    
<%@include file="./bwnav.jsp"%>
<%@include file="./chat.jsp"%>

<div class="form-group" style="float:left; width:800px; margin-left:30px; margin-top:60px;">

</div>
 
 <div class="col-sm-3 sidebar squeeze-right">
			<div class="round-information" style=" margin-bottom:-5px; margin-top:20px; margin-left:130px;display:block">

				<span id="round_status"></span>
				<br>
				<p style="display:block"><small>Remaining time</small><br><span class="countdown-timer" id="theTime" >00:00:00</span></p>
            </div>
			<br>							
				<div id="round-controls" class="btn-group btn-group-justified push-down" style="margin-top:-15px;">
					<a onclick="return confirm('Are you sure you want to reset this session? Any ideas will be saved.');" href="/projects/session/673?t=e3c4811d&amp;action=reset" data-action="reset" class="btn-round-control btn btn-secondary"><span class="glyphicon glyphicon-step-backward"></span><br><small class="hidden-sm">RESET</small></a>
					<a href="#" data-action="previous" class="btn-round-control btn btn-secondary"><span class="glyphicon glyphicon-backward"></span><br><small class="hidden-sm">PREV</small></a>
					<a href="#" data-action="next" class="btn btn-round-control btn-secondary" id="timerBtn" ><span class="glyphicon glyphicon-play"></span><br><small class="hidden-sm">Start</small></a>
<!--
					<a href="javascript:void(0)" data-action="pause" class="btn-round-control btn btn-secondary"><span class="glyphicon glyphicon-pause"></span></a>
					<a href="javascript:void(0)" data-action="stop" class="btn-round-control btn btn-secondary"><span class="glyphicon glyphicon-stop"></span></a>
-->
					<a href="#" data-action="next" class="btn-round-control btn btn-secondary"><span class="glyphicon glyphicon-forward"></span><br><small class="hidden-sm">NEXT</small></a>
				</div>
							
                <div>
                <button class="btn btn-secondary btn-block btn-chat-show" id="createBtn" style=" font-size:20px; font-family:'Comic Sans MS'; color:white;background-color:#e31937;"><span class="glyphicon glyphicon-comment"></span> Ready</button>
                </div>
		</div>   

<div class="page-id">

</div>


        <!-- panel with buttons -->
            <div class="panel">
                <a href="#category_form" id="category_pop" style="margin-top:120px;font-size:20px; font-family:'Comic Sans MS'; color:white;background-color:#e31937;">카테고리 분류</a>
            </div>

        <!-- popup form #1 -->
        <a href="#x" class="overlay" id="category_form"></a>
        <div class="popup" style="margin-bottom:-15px;">
            <h2>카테고리 분류명</h2>
            <p>아이디어를 나눌 카테고리를 등록하세요</p>
            <div>
                <label for="category_name">카테고리 명</label>
                <input type="text" id="category_name" value="" />
            </div>
            <input type="button" id="categoryBtn" value="등록하기" />

            <a class="close" href="#close"></a>
        </div>
 <br><br><br><br><br><br><br>
<div class="table" id="category_list" style="display:none; float:left; border:3px solid red; width:800px; margin-right:100px; font-size:17px; font-family:'Comic Sans MS'; border-radius:5px;">


</div>     
</head>

<body>


 <script>
	
 var istrueBtn = false;
var times = ${times};
 //var staticpage = ${pageread};
 var bw = ${bw};
 var count = 0;
 var pageread;
 var nextpage;
 var countCk = ${countCk};
 function timer(){
  	  if(websocket !=null){
  		
  		  websocket.send(times+"\|"+times+"\|"+times+"\|"+times+"\|"+times);
  	  }
  };
  $("#timerBtn").click(function(){
   	 timer();
   	 $("#timerBtn").hide();   	 
    });
		
	   function countDown(hrs,min,sec,gid) {
		   sec--;
		   if (sec == -01) {
		     sec = 59;   
		     min = min - 1;
		   }
		  else {   min = min;  }
		  if (min == -01) {
		     min = 59;
		     hrs = hrs - 1;
		   }
		  else { hrs = hrs; }
		 if (sec<=9) { sec = "0" + sec; }
		 if (hrs<=9) { hrs = "0" + hrs; }
		   time = hrs + ":" + (min<=9 ? "0" + min : min) + ":" + sec + "";
		 if (document.getElementById) { document.getElementById(gid).innerHTML = time; }
		  var SD=window.setTimeout("countDown("+hrs+","+min+","+sec+",'"+gid+"');", 1000);
		 if (hrs == '00' && min == '00' && sec == '00') { sec = "00"; window.clearTimeout(SD);
		 		count++;
				if(count <= countCk) {
					$.ajax({   //pageread에 맞는 페이지를 가져온다
						 type:"post",
				         url:"bwlistpage",
				         dataType:"text",
				         async: false,
				         data : {bwp_id : pageread,
				        	 	bw_id : bw },
				         success:function(result){
				        	 pageread = result;
				        	 console.log("이전페이지 검색완료 : "+result);
				         },
				         
				         error:function(){
				        	 alert("브레인라이팅은 혼자 할 수 없습니다.");
				         }
					}); 
					 console.log("다음 아작스 실행 "+pageread);
					 $.ajax({   //pageread에 맞는 페이지 select해서 list로 뿌려준다 
						 type:"post",
				         url:"listpage1",
				         dataType:"json",
				         async: false,
				         data : {bwp_id : pageread},
				         success:function(data){
				        	 for(var i=1; i<= data.list.length; i++){
				        		 console.log(data.list[i-1].bwi_content);
				        	 $("#textarea"+i).val(data.list[i-1].bwi_content);
				        	 }
				        	 $('.textarea').prop('disabled', true);
				        	 $('.submit').prop('disabled', true);
							 if(count != countCk){ ///////////////////////////////////시간 및 페이시 다시 생성
								 
								 $(".form-group div").attr('class','defaultDiv');
								 $(".form-group textarea").attr('class','defaultDiv1');
								 $(".form-group button").attr('class','defaultDiv2');
								 countDown(0,0,times,'theTime');
					        	 startpage();
							 }else{
								 $("#category_list").show();
							 }
				        	 
				        	
				         },
				         
				         error:function(){
				        	 alert("실패용");
				         }
					});
					
				} /* else{
					/* $(".form-group.children().children().first().next().next().next().next()").hide();
					$(".form-group.children()").addClass("dEnd"); */
					
				
				
		 }

		 }
		 
			 	
				 var bt
					$(".form-group*").on("mouseover","div",function(){
						if(countCk == count){
					 	 bt = $(this);
					 	 bt.draggable();
					 	 bt.css( 'cursor', 'move' )
					     bt.mousedown(function(){ // mousedown 이벤트 생성
					        	$(this).css('z-index', -1); // 클릭한 이미지만 z-index 증가시킴D
					 	 });      
					   		bt.mouseup(function(){ // mousedown 이벤트 생성
					 	        	$(this).css('z-index', 1); // 클릭한 이미지만 z-index 증가시킴D
							}); 
						}
					});

			 		$('.table*').on("mouseup", "p", function(){
			 			if(countCk == count){
				 			var btt = $(this).text();
				 			var tttt = bt.children('textarea').val();

					 			$.ajax({
					 				url : "categoryupdate",
					 				data : {
					 						bwc_content : btt,
					 						bwi_content : tttt
					 						},
					 				type : "post",
					 				dataType : "text",
					 				success : function(data){
					 					alert("카테고리 설정이 완료되었습니다.");
					 			
					 				},
					 				error: function(){
					 					alert("error");
					 				}
					 			});
				 			 bt.remove('div');
			 			}
			 		}); 
			 

		 function addLoadEvent(func) {
		   var oldonload = window.onload;
		   if (typeof window.onload != 'function') {
		     window.onload = func;
		   } else {
		     window.onload = function() {
		       if (oldonload) {
		         oldonload();
		       }
		       func();
		     }
		   }
		 }
		 var str = "";
			var stage = 0;
			var formnum =0;
			
			
			function disable(){
				 $('.textarea').prop('disabled', true);
				 istrueBtn = true;	 
			
			}
			 var formnum=0;
	function startpage(){
		 stage++;
		 formnum++;
	      str = "<div name='dv1' class='bwdiv'>"+
	           "<label>"+stage+"번 Idea</label>"+"<br>"+
	           "<textarea class = 'textarea' id='textarea"+stage+"'></textarea>"+"<br>"+
	           "<button class ='submit'>Submit</button></div>";
	           stage++;
	          
	      str = str + 
	      "<div name='dv1' class='bwdiv' id='ideadiv'"+stage+"'>"+
	           "<label>"+stage+"번 Idea</label>"+"<br>"+
	           "<textarea class = 'textarea' id='textarea"+stage+"'></textarea>"+"<br>"+
	           "<button class ='submit'>Submit</button></div>";
	           stage++;
	          
	      str = str + 
	      "<div name='dv1' class='bwdiv' id='ideadiv'"+stage+"'>"+
	           "<label>"+stage+"번 Idea</label>"+"<br>"+
	           "<textarea class = 'textarea' id='textarea"+stage+"'></textarea>"+"<br>"+
	           "<button class ='submit'>Submit</button></div><br><br><br><br><br><br><br><br><br><br><br><br></div>";

	              $(".form-group").append(str);
	            //  countDown(0,0,30,'theTime');
	}

/* 	var ttt = "";
	$('.form-group*').on("click","div",function(){
		if(count == countCk){
		var bt = $(this);
		var i = bt.children().first().next().next().val();
		ttt = ttt + i +"/@";
		
		 if(bt.hasClass() == "selected"){
		bt.addClass("unselected");
		}else{
		bt.addClass("selected");
		
		} 
		}
	}); */ 
	
/* 	$('.table*').on("click","td",function(){
		if(count == countCk){
		var bt = $(this).text();
		var cate = ttt.split("/@");
		$.ajax({
			url : "categoryupdate",
			data : {
					bwc_content : bt,
					bwi_content : ttt
					},
			type : "post",
			dataType : "text",
			success : function(data){
				alert("카테고리 설정이 완료되었습니다.");
				ttt = "";
			},
			error: function(){
				alert("error");
			}
			
		});
	}
	}); */
	 
	var idea_idid;
	var idr = "";
	$('.form-group*').on("click","button",function(){
		var bt = $(this);
		var btclass = bt.attr("class")
		var IDEA_content = bt.prev().prev().val();	
		if(IDEA_content != ""){
			if(bt.text() == 'Submit'){
				bt.text("수정하기");
				bt.prev().prev().prop('disabled', true);
				//content.prev().prop("disabled" , true);
				//alert(btclass);
				//content.next().css("border" , "4px solid #f00");
				//content.children("button").prev().prev().prop("disabled",true);
				$.ajax({
					url : "ideasub",
					data : {bwi_content : IDEA_content,
							bwp_id : pageread,
							u_id : "${sessionScope.u_id}"
					},
					dataType: "text",
					type : "post",
					success: function(data){
					//	alert("저장되었습니다.");
					},
					error : function(data){
						alert("저장실패");
					}
				});
	
			}else if(bt.text() == '수정하기'){
				bt.text("수정완료");
				bt.prev().prev().prop('disabled', false);
				//var IDEA_content = bt.prev().prev().val();
			      $.ajax({
			         type:"post",
			         url:"bwread",
			         dataType:"text",
			         data : {bwi_content : IDEA_content,
			        	 	u_id : "${sessionScope.u_id}"		        	 
			         },
			         success:function(result){
			        	 idea_idid = result;
			         }
			      });
			}else{
				//var IDEA_content = bt.prev().prev().val();
				$.ajax({
					url : "ideaModify",
					data : {
						bwi_content : IDEA_content,
						bwi_id : idea_idid
					},
					dataType: "text",
					type : "post",
					success: function(data){
						//alert("수정되었습니다.");
					},
					error : function(data){
						alert("수정실패");
					}
				});
				bt.prev().prev().prop('disabled', true);
				bt.text("수정하기");
			}  
		}else{
			alert("공백은 제출 할 수 없습니다.")
		}

	});


  $("#createBtn").on("click", function() {  //팀ID를 data에 넣고 가야함 !!
	 /*  $.ajax({
	  		url:"count",
			  type: "post",
			  async: false,
			  data: {team_id : '700'},
			  dataType : "text",
			  success: function(data){
					countCk = data;
			  },
			  error : function(data) {
				  alert("에러");
			  }
	  	}); */
	   $.ajax({
		  url:"page",
		  type: "post",
		  data : {bw_id : bw},
		  dataType : "text",
		  success: function(data){
			  pageread = data;
		  },
		  error : function(data) {
			  
		  }
	  }); 
	  $("#timer").show();
	  startpage();
	  $('.textarea').prop('disabled', true);
	  $('#createBtn').prop('disabled', true);
	  
  });
  var category = "";
  
  $("#categoryBtn").click(function(){
	  $.ajax({
		  url : "category",
		  type : "post",
		  data : {bwc_content : $("#category_name").val()},
		  dataType : "text",
		  success : function(data){
			  category = "<p class='category_align' style='margin-top:20px; margin-left:30px;display:inline-block; width:25%; height:15%; color:white;background-color:#e31937;'>"+data+"</p>";			 
			  $("#category_list").append(category);
			  location.href="#close";
		  },    
		  error : function(data){
			  alert("등록이 되지않았습니다.");
		  }
	  });
  });  
  


	
 	
  </script>
</body>
</html>