<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="resources/css/claimant.css"> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script>


</script>
<style>

.table-users{
	border: 1px solid #ffffff;
	height: 500px;
	width: 500px;
	/* margin-top: 100px; */
	margin-top: 10px;
	margin-right: 45px;
	margin-left: 40px;
}


#teamId{
	display: none;
	
}

.memid{
display: none;
}

#TBtnBox{
	float:right;
	margin-top:10px;
	margin-right: 60px;
}
</style>




<script>
$(document).ready(function(){ 
     	var permit = 0;
    	var t_id = $("#teamId").text();
    	$("#recruitGo").on("click",function(){
    		permit = 1;
        	$.ajax({
        		type:'post',
        		url:'Recruitcont',
        		data: {permit:permit,t_id:t_id},
        		success : function(result){
        			console.log("result: "+result);
        			if(result == 'SUCCESS'){
        				alert("모집을 시작합니다.");
        				$(".table table-hover").show();
        				location.reload();
        			}
        		}
        	});
        });
    	
    	$("#recruitStop").on("click",function(){
    		permit = 2;
        	$.ajax({
        		type:'post',
        		url:'Recruitcont',
        		data: {permit:permit,t_id:t_id},
        		success : function(result){
        			console.log("result: "+result);
        			if(result == 'SUCCESS'){
        				alert("모집을 중지합니다.");
        				$(".table table-hover").hide();
        				//location.reload();
        				window.opener.location.reload();
        				window.close();

        			}
        		}
        	});
        });
      
   $("#ReturnRoom").on("click",function(){
		window.opener.location.reload();
		window.close();
   });
    	
});
</script>

</head>

<body>


<div>

<div id="teamId">${t_id}</div>
<div class="table-users">
   <div class="header"><h2>신청자 List</h2></div>
<c:if test="${permit.t_permit == 2}">
	<div>모집이 중지되었습니다.</div>
</c:if>
<c:if test="${permit.t_permit == 1}">
<table class="table table-hover">
<c:if test="${num == 0 || permit.t_permit == 2}">
	<tr>
		<th>신청자가 없습니다.</th>
	</tr>
</c:if>
<c:if test="${num != 0}">
	<tr>
		<th>신청일</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>주소</th>
		<th>수락여부</th>	
	</tr>
	<c:forEach items="${clailist}" var="ClaimantVo">
	<tr>
		<td class="memid"><input type="hidden" class="id" name="id" value="${ClaimantVo.u_id}"></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ClaimantVo.m_regdate}"/></td>
		<td>${ClaimantVo.u_name}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ClaimantVo.u_birthyear}"/></td>
		<td>${ClaimantVo.u_address}</td>		
		<td><button class="ok btn btn-warning">수락</button>
		<button class="no btn btn-danger">거절</button></td>
	</tr>

	</c:forEach>
</c:if>
</table>
</c:if>
</div>


<div id="TBtnBox">
<button id="ReturnRoom" class="btn btn-default">teamRoom</button>
<c:if test="${permit.t_permit == 2 or permit.t_permit == 0}">
<button id="recruitGo" class="btn btn-danger">팀원 모집시작</button>
</c:if>

<c:if test="${permit.t_permit == 1}">
<button id="recruitStop" class="btn btn-warning">팀원 모집중지</button>
</c:if>
</div>

</div>
<script>
$(".ok").on("click", function(){
	event.preventDefault();
	//신청서가 들어가는 팀
	var u_id = $(this).parent().prevAll(".memid").children().eq(0).val();
	var t_id = $("#teamId").text();
	 $.ajax({
		type:'post',
		url:'userOk',
		data: {u_id:u_id,t_id:t_id},
		success : function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("수락되었습니다.");
				location.reload();
			}
		}
	});
});
$(".no").on("click", function(){
	event.preventDefault();
	//신청서가 들어가는 팀
	var u_id = $(this).parent().prevAll(".memid").children().eq(0).val();
	var t_id = $("#teamId").text();

	 $.ajax({
		type:'post',
		url:'userNo',
		data: {u_id:u_id,t_id:t_id},
		success : function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("거절되었습니다.");
				location.reload();
			}
		}
	});
});
</script>
</body>
</html>