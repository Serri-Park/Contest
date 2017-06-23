<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
#menu {
	position: absolute;
	top:15%;  
	left:10px;
}

#menu ul {
	clear: left;
	margin: 0;
	padding: 0; 
	list-style-type: none;
}

#menu ul li {
	text-align: center;
	float: left;
	margin: 0;
	padding: 2px, 1px;
	border: 1px solid red;
	width: 150px;
}

</style>
</head>
<body>
<div id="menu">
	<ul>
		<a href="progress?t_id=${t_id}"><li id="">평가 진행상황</li></a>	
	</ul>
	<ul>
		<a href="eval_result?t_id=${t_id}"><li>Contest Total Info</li></a>
	</ul>
	</div>

	<script>
	var str="";
	
	var data = {"t_id":${t_id}};
	var ep = [];
	$(document).ready(function(){
	$.ajax({
		url: 'get_stage',
		type: 'POST',
	      dataType: "json", 
	      data:JSON.stringify(data),
	      headers:{
	            "Content-Type":"application/json",
	            "X-HTTP-Method-Override":"POST"
	         },
	    success: function(data) {
	    	for(var i = 1; i<=data.list.length; i++){
	    		if(data.list[i-1].ep_state == 1)
	    		str+="<ul ><a href='manager?t_id=${t_id}&r_id=0'><li class='stage'>"+i+"단계<br>"+data.list[i-1].ep_how+"</li></a></ul>"; 
	    		else
	    			str+="<ul ><li class='stage'>"+i+"단계<br>"+data.list[i-1].ep_how+"</li></ul>"; 	
	    	}
	    	$("#menu").prepend(str);
	    	
	    },
	      error: function(data) {
	        alert("error");
	      }
	      
		});
	});
	</script>
</body>
</html>