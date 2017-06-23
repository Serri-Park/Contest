<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<jsp:include page="../screen/top.jsp" flush="false" />
</head>
<body>
<div class="container">
  <h2>${eval.c_name }</h2>

    <h2>상세평가항목 설정</h2><br>
    <div class="form-inline">
    <div class="form-group"> 
      <label>1.</label>
     <input type="text" name="el_name" class="form-control el_name">
      <label>배점</label>
     <input type="number" name="el_score" class="form-control el_score">
    </div>
    </div>
      <button type="button" class="btn btn-primary" id= "addEl"><span class ="glyphicon glyphicon-plus"></span></button>
      <button type="button" class="btn btn-primary" id= "rmEl"><span class ="glyphicon glyphicon-minus"></span></button>
    <button class="btn btn-default" id="submit">확인</button>
    <button class="btn btn-default" id="cencel">취소</button>
</div>
<script>
	var str = "";
	var stage = 1;
	var setting = new Array();
	
	$("#addEl").on("click",function(){
		stage++;
		str = 
			 "<div class='form-inline'><div class='form-group'> "+
			 "<label>"+stage+".</label>"+
     		 "<input type='text' name='el_name' class='form-control el_name'>"+
     	     "<label>배점</label><input type='number' name='el_score' class='form-control el_score'></div></div>";
     		   $(".form-group").last().append(str);
	});
	$("#rmEl").on("click",function(){
		event.preventDefault();
		if(stage>1){
		stage--;
     	$(".form-group").last().remove();
		}
	});
	$("#submit").on("click",function(){
		//var str= "{'test' : [";
		var str = "[";
		var stageNum = $(".el_name").length;
		var count =0;
	  	for(count=0;count<stageNum;count++){
	  		setting[count] = new Array();
	  		//alert($(".el_name").eq(count).val());
	  		if(count!=0){
	  			setting[count][0] = $(".el_name").eq(count).val();
	  			setting[count][1] = $(".el_score").eq(count).val();
	  		}else{
	  			setting[count][0] = $(".el_name").val();
	  			setting[count][1] = $(".el_score").val();
	  		}
	  		if(count+1!=stageNum){
	  			str += "{\"el_name\":"
	  			str += "\""+setting[count][0]+"\","
	  			str += "\"el_score\":";
	  			str += setting[count][1]+",";
	  			str += "\"ep_id\":";
	  			str += ${ep_id}+"},";
	  		}
	  		else{
	  			str += "{\"el_name\":"
		  		str += "\""+setting[count][0]+"\",";
	  			str += "\"el_score\":";
	  			str += setting[count][1]+",";
	  			str += "\"ep_id\":";
	  			str += ${ep_id}+"}]";
	  		}
	  	}
	  //	str += "}";
	  	
	  	
	  	//alert(str);
		$.ajax({
			url: "elistCreate", 
			type: "POST",  
		    data :str,
		    headers:{
	            "Content-Type":"application/json",
	            "X-HTTP-Method-Override":"POST"
	         },
		    dataType: "text", 
		    
		     success: function(data){
		    	 console.log(data)
		    	  	location.href = "../teamRoom?t_id="+${t_id};
		 	},
		 	 error:function(data){
		          alert("error:"+data);
		        }
		  });
	}) 
	</script>
	</body>
</html>