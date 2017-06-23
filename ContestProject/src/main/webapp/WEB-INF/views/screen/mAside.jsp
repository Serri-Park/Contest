<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#menu {
	position: absolute;
	top:15%;  
	left:3%;
}

#menu ul.vert-one{
	margin:0;padding:0;list-style-type:none;display:block;
	font:bold 12px tahoma, sans-serif;line-height:165%;
	width:200px;
}

#menu ul.vert-one li.on{
	margin:0;padding:0;border-top:1px solid #c50909;
	border-bottom:1px solid #900000;
}

#menu ul.vert-one li.on a{
	display:block;text-decoration:none;color:#fff;
	background:#eb5454;padding:5px 0 5px 20px;width:200px;
}
#menu ul.vert-one li.un{
	margin:0;padding:0;border-top:1px solid #c50909;
	border-bottom:1px solid #900000;
}

#menu ul.vert-one li.un a{
	display:block;text-decoration:none;color:#fff;
	background:#eb5454;padding:5px 0 5px 20px;width:200px;
}

#menu ul.vert-one li a:hover{
	background:#bc2e2e url("http://www.blueb.co.kr/data/201010/IJ12872476173279/vert-one_arrow.gif") no-repeat 0 9px;
}
#menu ul.vert-one li a.current{
background:#ff8080 url("http://www.blueb.co.kr/data/201010/IJ12872476173279/vert-one_arrow.gif") no-repeat 0 9px;}
#menu ul.vert-one li a.current:hover{
background:#bc2e2e url("http://www.blueb.co.kr/data/201010/IJ12872476173279/vert-one_arrow.gif") no-repeat 0 9px;}

</style>

</style>
</head>
<body>
<div id="menu">
	<ul class="vert-one">
		<li class="on"><a href="progress?t_id=${t_id}">평가 진행상황</a></li>	
	
		<li class="on"><a href="eval_result?t_id=${t_id}">Contest Total Info</a></li>
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
	    		str+="<li class='stage on'><a href='manager?t_id=${t_id}&r_id=0'  class='current'>"+i+"단계<br>"+data.list[i-1].ep_how+"</a></li>"; 
	    		else
	    			str+="<li class='stage un'><a href='#'>"+i+"단계<br>"+data.list[i-1].ep_how+"<br>(CAN'T CLICK)</a></li>"; 	
	    	}
	    	$(".vert-one").prepend(str);
	    	
	    },
	      error: function(data) {
	        alert("error");
	      }
	      
		});
	});
	</script>
</body>
</html>