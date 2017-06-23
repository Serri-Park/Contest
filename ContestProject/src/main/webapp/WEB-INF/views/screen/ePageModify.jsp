<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>평가지페이지</title>

</head>
<body>
<div class="container">
  <h2>${eval.c_name }</h2>

    <h2>평가단계 설정</h2><br>
    <c:forEach items="${getList}" var="list">
		<div class="form-group"> 
      <label>${list.ep_stage }단계 평가방법</label>
      <select class="form-control ep_how"  name="ep_how" value="${list.ep_how }">
      	<option>Pass or Fail 방법</option>
      	<option>상세채점 방법</option>
      	<option>공개투표 방법</option>
      </select>
     
    </div>
		<input class="ep_id" value =${list.ep_id } style="display:none">      
   
	</c:forEach>
     <button class="btn btn-default" id="submit">확인</button>
    <button class="btn btn-default" id="cencel">취소</button>
</div>
<script>
var str = "";
var stage = 1;
var setting = [];
$("#submit").on("click",function(){
	//var str= "{'test' : [";
	var str = "[";
	var setting_id=[];
	var stageNum = $(".ep_how").length;
  	for(var count=1;count<=stageNum;count++){
  		
  			setting[count-1] = $(".ep_how").eq(count-1).val();
  			setting_id[count-1] = $(".ep_id").eq(count-1).val();
  		if(count!=stageNum){
  			str += "{\"ep_stage\":"
  			str += count+","
  			str += "\"ep_how\":";
  			str += "\""+setting[count-1]+"\",";
  			str += "\"ep_id\":";
  			str += setting_id[count-1]+"},";
  		}
  		else{
  			str += "{\"ep_stage\":"  
	  		str += count+",";
  			str += "\"ep_how\":";
  			str += "\""+setting[count-1]+"\",";
  			str += "\"ep_id\":";
  			str += setting_id[count-1]+"}]";
  		}
  	}
  //	str += "}";
  	
  	
  //	alert(str);
	$.ajax({
		url: "ePageModify", 
		type: "POST",  
	    data :str,
	    headers:{
            "Content-Type":"application/json",
            "X-HTTP-Method-Override":"POST"
         },
	    dataType: "text",
	    
	     success: function(data){
	    	//alert(data);
	    	location.href = "../teamRoom?t_id="+${add};
	 	},
	 	 error:function(data){
	          alert("error:"+data);
	        }
	  });
}) 
	$("#cencel").on("click", function() {   
		location.href ="../teamRoom?t_id="+${add};
		});
</script>
</body>
</html>