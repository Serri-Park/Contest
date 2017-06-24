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


.memid{
display: none;
}

#TBtnBox{
	float:right;
	margin-top:10px;
	margin-right: 60px;
}


.teamDates{
	display: none;
}

.recommendDIV{
	display: none;
}

.hidenId{
	display: none;
}

#retrunList{
	display: none;
}

</style>




<script>
$(document).ready(function(){ 
     	
      
   $("#ReturnRoom").on("click",function(){
		window.opener.location.reload();
		window.close();
   });
    	
});
</script>

</head>

<body>


	<div>
	
		<div class="teamDates" id="m_rights">${teamDate.m_rights}</div>
		<div class="teamDates" id="teamId">${teamDate.t_id}</div>
		<div class="teamDates" id="t_filed">${teamDate.t_filed}</div>
		
		<div class="table-users">

		<c:if test="${permit.t_permit == 2}">
			<div>모집이 중지되었습니다.</div>
		</c:if>
		
			<c:if test="${permit.t_permit == 1}">
			
			<!--  -->
			<!-- 추천리스트 -->		
				<div class="recommendDIV">
					<table id="recommendTable" class="table table-hover">
						<tr>
							<th class="hidenId">ID</th>
							<th>이름</th>
							<th>분야</th>
							<th>주소</th>
							<th>e-mail</th>
						</tr>
					</table>
				</div>
				
				<!--  -->
				<!-- 신청자 리스트 -->
				<div class="header">
					<h2>신청자 List</h2>
					<table class="table table-hover">
						<c:if test="${num == 0}">
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
				</div>
			</c:if>
		</div>
		
	
		<div id="TBtnBox">
			<c:if test="${permit.t_permit == 1}">
				<button id="ReturnRoom" class="btn btn-default">teamRoom</button>
			
				<c:if test="${teamDate.m_rights == 3}">
					<button id="recommendBtn" class="btn btn-warning">심사위원 추천</button>
				</c:if>
				
				<button id="retrunList" class="btn btn-warning">돌아가기</button>
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

$("#recommendBtn").on("click",function(){
	var t_id = $("#teamId").text();
	var m_rights = $("#m_rights").text();
	var t_filed = $("#t_filed").text();
	var src="";
	var divsrc="";
	
	$.ajax({
		type:'GET',
		url:'recommend',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "GET"
		},
		dataType:"json",
		data:{t_filed:t_filed,t_id:t_id},
		success:function(data) {
			if(data != null) {
				$(".header").remove();
				$(".header").hide();
				$(".recommendDIV").show();
				
				$(data.list).each(function(){
					divsrc += "<h2>추천 심사위원 List</h2>"
					src += "<tr class='reply'><td><a href='MassageMakeForm?rc_id="+this.u_id+"'>"+this.u_id+"</a></td><td>"+this.u_name+"</td><td>"+this.u_major+"</td><td>"+this.u_email+"</td><td>"+this.u_address+"</td></tr>";
					
				});
				
				$("#recommendTable").append(src);
				$("#recommendBtn").hide();
				$("#retrunList").show();
			}else if(data == null){
				src += "<tr><th>신청자가 없습니다.</th></tr>"
				$("#recommendTable").append(src);
				$("#recommendBtn").hide();
				$("#retrunList").show();
			}
		}
	}); 
		
});



$("#retrunList").on("click",function(){
/* 	$(".recommendDIV").remove();
	$(".recommendDIV").hide();
	$(".header").show();
	$("#retrunList").hide();
	$("#recommendBtn").show(); */	
	location.reload();
});


</script>
</body>
</html>