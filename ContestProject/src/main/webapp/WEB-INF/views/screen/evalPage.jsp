<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>평가지페이지</title>
<jsp:include page="../Member/top.jsp" flush="false" />
</head>
<body>
<div class="container">
  <h2>${eval.c_name }</h2>

    <h2>평가단계 설정</h2><br>
    <div class="form-group"> 
      <label>1단계 평가방법</label>
      <select class="form-control ep_how" id="stage1" name="ep_how" >
      	<option>Pass or Fail 방법</option>
      	<option>상세채점 방법</option>
      	<option>공개투표 방법</option>
      </select>
    </div>
      <button type="button" class="btn btn-primary" id= "addStage"><span class ="glyphicon glyphicon-plus"></span></button>
      <button type="button" class="btn btn-primary" id= "rmStage"><span class ="glyphicon glyphicon-minus"></span></button>
    <button class="btn btn-default" id="submit">확인</button>
    <button class="btn btn-default" id="cencel">취소</button>
</div>
<script>
	var str = "";
	var stage = 1;
	var setting = [];
	$("#addStage").on("click",function(){
		stage++;
		str = 
			 "<div class='form-group'> "+
			 "<label>"+stage+"단계 평가방법</label>"+
     		 "<select class='form-control ep_how' id='stage"+stage+"' name='ep_how' >"+
				"<option>Pass or Fail 방법</option>"+
    		  	"<option>상세채점 방법</option>"+
     		 	"<option>공개투표 방법</option>"+
     		 "</select></div>";
     		   $(".form-group").last().append(str);
	});
	$("#rmStage").on("click",function(){
		event.preventDefault();
		if(stage>1){
		stage--;
     	$(".form-group").last().remove();
		}
	});
	$("#submit").on("click",function(){
		//var str= "{'test' : [";
		var str = "[";
		var stageNum = $(".ep_how").length;
	  	for(var count=1;count<=stageNum;count++){
	  		if(count!=1){
	  			setting[count-1] = $(".ep_how").eq(count-1).val();
	  			
	  		}else{
	  			setting[count-1] = $(".ep_how").val();
	  			
	  		}
	  		if(count!=stageNum){
	  			str += "{\"ep_stage\":"
	  			str += count+","
	  			str += "\"ep_how\":";
	  			str += "\""+setting[count-1]+"\",";
	  			str += "\"c_id\":";
	  			str += ${manage.c_id}+"},";
	  		}
	  		else{
	  			str += "{\"ep_stage\":"
		  		str += count+",";
	  			str += "\"ep_how\":";
	  			str += "\""+setting[count-1]+"\",";
	  			str += "\"c_id\":";
	  			str += ${manage.c_id}+"}]";
	  		}
	  	}
	  //	str += "}";
	  	
	  	
	  //	alert(str);
		$.ajax({
			url: "evalPage", 
			type: "POST",  
		    data :str,
		    headers:{
	            "Content-Type":"application/json",
	            "X-HTTP-Method-Override":"POST"
	         },
		    dataType: "json", 
		    
		     success: function(data){
		    	
		    	console.log(data.ep_how);
		     
		    	if(data.ep_how=="상세채점 방법"){
		    		location.href = "./elist?t_id="+${t_id}+"&ep_id="+data.ep_id;
		  	 	} else
		   			location.href = "../teamRoom?t_id="+${t_id};
		 	},
		 	 error:function(data){
		          alert(data);
		        }
		  });
	}) 
	$("#cencel").on("click", function() {   
		location.href ="../teamRoom?t_id="+${t_id};
		});
</script>
</body>
</html>