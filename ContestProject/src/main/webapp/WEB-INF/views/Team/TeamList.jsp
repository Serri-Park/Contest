<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/myTeams.css">
<title>Team List</title>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
#allbody{
	width: 90%;
	height: 700px;
	margin:auto;
	border: 1px solid #ffffff;
	padding: 20px;
	
}

#ControllBtn{
	width: 500px;
	height: 37px;
   	margin-left: 30%;
}

#atigs{
	width: 300px;
	height: 350px;
    margin-top: 55px;
    position: fixed;
    font-size:30pt;
    
}


</style>
</head>

<body>
<jsp:include page="../Member/top.jsp"></jsp:include>
<!-- jstl :JSP -->

<section id="allbody" >
	<c:if test="${sessionScope.u_id!= null}">
		
		
		<div id="ControllBtn">
			<c:if test="${Conlist == 1}">
				<button id="createTeam" class="btn btn-default">팀 생성</button>
			</c:if>
			<select name="searchType" class="changeType">		
				<option value="논문/리포트">논문/리포트</option>
				<option value="기획/아이디어">기획/아이디어</option>
				<option value="네이밍/슬로건">네이밍/슬로건</option>
				<option value="디자인/캐릭터/만화">디자인/캐릭터/만화</option>
				<option value="광고/마케팅">광고/마케팅</option>
				<option value="영상/사진">영상/사진</option>
				<option value="UCC/SOUND">UCC/SOUND</option>
				<option value="예체능">예체능</option>
				<option value="문학/수기">문학/수기</option>
				<option value="과학/공학">과학/공학</option>
				<option value="게임/소프트웨어">게임/소프트웨어</option>
				<option value="건축/건설">건축/건설</option>
				<option value="체험/참여">체험/참여</option>
				<option value="취업/창업">취업/창업</option>
				<option value="경품/이벤트">경품/이벤트</option>
				<option value="전시/페스티벌">전시/페스티벌</option>
				<option value="장학(금)재단">장학(금)재단</option>
				<option value="봉사활동">봉사활동</option>
				<option value="해외">해외</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<br>
		
		
		<div class="table-users">
			<div class="header">Team List</div>
			<c:if test="${listnum == 0 }">
				현재 팀이 없습니다.
			</c:if>
			
			<c:if test="${listnum != 0 }">
				<table>
					<tr>
						
						<th>logo</th>
						<th>팀명</th>
						<c:if test="${Conlist == 3}">
							<th>주최사</th>
						</c:if>
						<c:if test="${Conlist == 1}">
							<th>팀장</th>
						</c:if>
						<c:if test="${Conlist == 0}">
							<th>개설자</th>
						</c:if>
						<th>지역</th>
						<th>분야</th>
						<th>개설일</th>
						<th>   </th>
						<th>   </th>
					</tr>
					<c:forEach items="${list}" var="TeamVo">
						<c:if test="${TeamVo.t_permit == permit}">
							<tr>
								<td class="t_id" style="display: none"><input type="hidden" class="teamId" name="teamId" value="${TeamVo.t_id}"></td>
								<td><a href="teamRoom?t_id=${TeamVo.t_id}"><img src = "displayTeamFile?fileName=${TeamVo.t_logo}"/></a></td>
								<td><a href="teamRoom?t_id=${TeamVo.t_id}">${TeamVo.t_name}</a></td>
								<td>${TeamVo.u_id}</td>
								<td>${TeamVo.t_areas}</td>
								<td>${TeamVo.t_filed}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${TeamVo.t_regdate}"/></td>
								
									<c:if test="${Conlist == 0}">
										<c:if test="${TeamVo.m_rights == 10}">
											<td><button class="cancell btn btn-default">지원취소</button></td>
										</c:if>
										
										<c:if test="${TeamVo.m_rights == 2 || TeamVo.m_rights == 4}">
											<td><button class="out btn btn-default">탈퇴</button></td>
										</c:if>
										
										<c:if test="${TeamVo.m_rights == 1 || TeamVo.m_rights == 3}">
											<td><button class="end btn btn-default">활동종료</button></td>
										</c:if>
										
										<c:if test="${TeamVo.m_rights == 1 || TeamVo.m_rights == 3}">
											<td>
												<c:if test="${TeamVo.t_permit == 2}">
												<button class="start btn btn-default">모집시작</button>
												</c:if>
												<c:if test="${TeamVo.t_permit == 1}">
												<button class="completion btn btn-default">모집완료</button>
												</c:if>
											</td>
										</c:if>
									</c:if>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</c:if>
		
		</div>
	</c:if>
</section>
<script>

//가입신청취소
$(".cancell").on("click", function(){
	event.preventDefault();
	var t_id = $(this).parent().prevAll(".t_id").children().eq(0).val();
	
	if (confirm("정말 취소하시겠습니까??") == true){  
		$.ajax({
		type:'post',
		url:'userNo',
		data: {t_id:t_id},
		success : function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("취소되었습니다.");
				location.reload();
			}
		}
		});
	}else{   //취소
	    return;
	}
});







//탈퇴
$(".out").on("click", function(){

	var t_id = $(this).parent().prevAll(".t_id").children().eq(0).val();
	if (confirm("정말 탈퇴하시겠습니까??") == true){    //확인
		 $.ajax({
				type:'post',
				url:'dropoutTeam',
				data: {t_id:t_id},
				success : function(result){
					console.log("result: "+result);
					if(result == 'SUCCESS'){
						alert("탈퇴완료.");
						
						location.reload();
					}
				}
			});
	}else{   //취소
	    return;
	}
});


//활동종료
$(".end").on("click", function(){
	var t_id = $(this).parent().prevAll(".t_id").children().eq(0).val();
	var recruit = 0;
	if (confirm("팀을 비활성하시겠습니까??") == true){    //확인
		 $.ajax({
				type:'post',
				url:'Recruitcont',
				data: {t_id:t_id,permit:recruit},
				success : function(result){
					console.log("result: "+result);
					if(result == 'SUCCESS'){
						alert("비활성화.");
						location.reload();
					}
				}
			});
	}else{   //취소
	    return;
	}
});



//모집완료
$(".completion").on("click", function(){
	var t_id = $(this).parent().prevAll(".t_id").children().eq(0).val();
	var permit = 2;
	if (confirm("팀원 모집을 중지하시겠습니까??") == true){    //확인
		$.ajax({
			 type:'post',
	 		url:'Recruitcont',
	 		data: {permit:permit,t_id:t_id},
	 		success : function(result){
	 			console.log("result: "+result);
	 			if(result == 'SUCCESS'){
	 				alert("모집을 중지합니다.");
	 				location.reload(); 	
	 				
	 			}
	 		}
		});
	}else{   //취소
	    return;
	}
});


//모집시작
$(".start").on("click", function(){
	var t_id = $(this).parent().prevAll(".t_id").children().eq(0).val();
	var permit = 1;
	if (confirm("팀원 모집을 시작하시겠습니까??") == true){    //확인
		$.ajax({
			 type:'post',
	 		url:'Recruitcont',
	 		data: {permit:permit,t_id:t_id},
	 		success : function(result){
	 			console.log("result: "+result);
	 			if(result == 'SUCCESS'){
	 				alert("모집을 시작합니다.");
	 				location.reload(); 			
	 			}
	 		}
		});
	}else{   //취소
	    return;
	}
});

$("#createTeam").on("click", function(){
	
	var Conlist = 0;
	window.location.href="registTeam?Conlist=1";
});
/* 
나중에 분야로 검색할때 이용
//분야
var search = "";

$(".changeType").change(function(){
	
    $( ".changeType option:selected" ).each(function() {
    	search += $( this ).text() + " ";
    });
   
})



 */

</script>
</body>
</html>