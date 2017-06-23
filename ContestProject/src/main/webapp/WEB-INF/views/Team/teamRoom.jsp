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
<!-- <link rel="stylesheet" href="resources/css/teamRoom.css"> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<!-- 스타일 -->
<style>
#allbody{
	width: 80%;
	height: 700px;
	margin:auto;
	border: 1px solid #ffffff;
}
/* #formid{
	display: none;
} */

#t_id{
display: none;
}

#atigs{

	height: 37px;
    margin: 10px
}

#imgsite{
	width: 80%;
	height: 300px;
	border: 1px solid #ffffff;
    margin: 10px;
    padding: 17px;
}

img{
	width: 98%;
	height: 98%;
}


#sectionLeft{
	width: 45%;
    float: left;
    margin-left: 70px;
}

#sectionrigth{
	width: 45%;
    margin-top: 55px;
    margin-left: 48%;
}

#table-users{
	width: 80%;
	height: 300px;
	border: 1px solid #2d2d2d;
    margin: 10px;
    padding: 17px;
}

#partici{
	width: 40%;
	height: 280px;
	border: 1px solid #2d2d2d;
    margin: 10px;
    padding: 17px;

}

#contentser{
	width: 40%;
	height: 300px;
	border: 1px solid #2d2d2d;
    margin: 10px;
    padding: 17px;

}


</style>


</head>
<jsp:include page="../Member/top.jsp"></jsp:include>

<!-- <body align="center"> -->
<body>
<form id="formid">
		<input type="hidden" class="t_id" name="t_id" value="${t_id}">

	</form>
<section id="allbody">

	<section id="sectionLeft">
	
		<div id="atigs">
			<c:if test="${Rights.m_rights == 10}">
				<button class="cancell btn btn-default">지원취소</button>
			</c:if>
			
			<c:if test="${Rights.m_rights == null}">
				<button class="app btn btn-default">가입신청</button>
			</c:if>
			
			
			<c:if test="${teamDate.t_permit == 0}">
				<c:if test="${Rights.m_rights == 1 || Rights.m_rights == 3 }">
					<span>팀이 활동하지 않습니다.</span>
					<button id="inactive" class="btn btn-default" onclick="activation()">활성화</button><br>
				</c:if>
			</c:if>
		
			<c:if test="${teamDate.t_permit != 0}">
		
				<c:if test="${Rights.m_rights == 1 || Rights.m_rights == 3 }">
			
						<c:if test="${Rights.m_rights == 1}">
							<button id="claimant" class="btn btn-warning">가입신청자보기</button>
						</c:if>
							
						<c:if test="${Rights.m_rights == 3}">
							<button id="claimant" class="btn btn-warning">심사위원지원자보기</button>
							<a href="contestForm?t_id=${t_id }"><button>공모전</button></a>
						</c:if>
					<button id="inactive" class="btn btn-warning">활동중지</button>
				</c:if>
			
			</c:if>
			
			<c:if test="${Rights.m_rights == 2 || Rights.m_rights == 4}">
				<button id="inactive" class="btn btn-danger" onclick="dropout()">탈퇴</button>
			</c:if>
			
			<c:if test="${teamDate.t_permit == 0}">
			<span>팀이 활동하지 않습니다.</span>
			<button id="inactive" class="btn btn-default" onclick="activation()">활성화</button>
			<br>
		</c:if>
  
		<c:if test="${teamDate.t_permit == 2}">
		
			<c:if test="${Rights.m_rights == 1 || Rights.m_rights == 2}">
				<a href="ScheMain?tid=${sessionScope.team_id }"><button
						id="conference" class="btn btn-danger">캘린더</button></a>
				<a href="bwlist?t_id=${t_id}&u_id=${sessionScope.u_id }" class="btn btn-default" id="navproject" style="text-decoration:none;">My Project</a>

			</c:if>
			
			<c:if test="${Rights.m_rights == 3}">
				<c:if test="${manage.ep_how==null}">
					<button class="btn btn-default" id="evalPage">평가단계설정</button>
				</c:if>
				
				<c:if test="${manage.ep_how!=null}">
					<button class="btn btn-default" id="ePageModify">평가단계수정</button>
					<button class="btn btn-default" id="evallist">평가지작성</button>
				</c:if>
				
				<c:if test="${Rights.m_rights == 3 || Rights.m_rights == 4}">
					<button class="btn btn-default" id="manager">평가매니저</button>
				</c:if>
			</c:if>
		
		</c:if>
		</div>

	
	<!-- <form id="formid"> -->
	<input type="hidden" class="t_id" name="t_id" value="${t_id}">
	<!-- </form> -->
	
	
	<div id="imgsite">
	<img src = "displayTeamFile?fileName=${teamDate.t_logo}"/> 
	</div>
	
	<div id="table-users">
	   <div><h4>팀원리스트</h4></div>
	<table class="table table-hover">
		<tr>
			<th>회원ID</th>
			<th>이름</th>
			<th>등급</th>
			<th>가입일</th>	
		</tr>
		<c:forEach items="${list}" var="ClaimantVo">
		<c:if test="${ClaimantVo.m_rights < 10 && ClaimantVo.m_rights > 0}">
		<tr>
			<td>${ClaimantVo.u_id}</td>
			<td>${ClaimantVo.u_name}</td>
			<c:if test="${ClaimantVo.m_rights == 1 || ClaimantVo.m_rights == 3}">
			<td>팀장</td>
			</c:if>
			<c:if test="${ClaimantVo.m_rights == 2 || ClaimantVo.m_rights == 4}">
			<td>회원</td>
			</c:if>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ClaimantVo.m_regdate}"/></td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	</div>
	
	</section>
	
	<section id= "sectionrigth">
	<article id="partici">
	<div><h3>팀명: ${teamDate.t_name}</h3></div>
	<div>
	<div><h4>팀 소개</h4></div>
	<div>${teamDate.t_content}</div>
	</div>
	</article>
		
	
	<!-- 공모전정보 -->
	<article id="contentser">
	
	<c:if test="${leader == 1}">
	<div><h4>참여한 공모전</h4></div>
	</c:if>
	<c:if test="${leader == 3}">
	<div><h4>개최한 공모전</h4></div>
	</c:if>
	<table class="table table-hover">
	<c:if test="${ConlCount == 0}">
	기록이 없습니다.
	</c:if>
	<c:if test="${ConlCount > 0}">
		<tr>
			<th>제목</th>
			<th>분야</th>
			<th>시작일</th>
			<th>종료일</th>
			<c:if test="${leader == 1}">
			<th>접수일</th>	
			</c:if>
			<c:if test="${leader == 3}">
			<th>등록일</th>	
			</c:if>
			
		</tr>
		<c:forEach items="${Colist}" var="Colist">
			<tr>
				<td>${Colist.c_name}</td>
				<td>${Colist.c_category}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${Colist.c_startdate}"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${Colist.c_enddate}"/></td>
				<c:if test="${leader == 1}">
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${Colist.r_regdate}"/></td>
				</c:if>
				<c:if test="${leader == 3}">
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${Colist.c_regdate}"/></td>
				</c:if>
			</tr>
		</c:forEach>
	</c:if>
	</table>
	</article>
	
	</section>

</section>




<script>

$("#claimant").on("click",function(){

		 var t_id = $(".t_id").val();
			window.open("claimant?t_id="+t_id,"가입신청자","width=600,height=600 scrollbars=yes,")
	});
	

function dropout(){
	event.preventDefault()
	var t_id = $(".t_id").val();
	alert(t_id);
	if (confirm("정말 탈퇴하시겠습니까??") == true){    //확인
		 $.ajax({
				type:'post',
				url:'dropoutTeam',
				data: {t_id:t_id},
				success : function(result){
					console.log("result: "+result);
					if(result == 'SUCCESS'){
						alert("탈퇴완료.");
						
						window.location.href="myTeams";
					}
				}
			});
	}else{   //취소
	    return;
	}
}


$("#inactive").on("click",function(){
	event.preventDefault()
	var t_id = $(".t_id").val();
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
						window.location.href="myTeams";
					}
				}
			});
	}else{   //취소
	    return;
	}
});


function activation(){
	event.preventDefault()
	var t_id = $(".t_id").val();
	var recruit = 1;
	if (confirm("팀을 활성화합니다.") == true){    //확인
		 $.ajax({
				type:'post',
				url:'Recruitcont',
				data: {t_id:t_id,permit:recruit},
				success : function(result){
					console.log("result: "+result);
					if(result == 'SUCCESS'){
						alert("활성화.");
						window.location.href="myTeams";
					}
				}
			});
	}else{   //취소
	    return;
	}
}

//가입신청취소
$(".cancell").on("click", function(){
	event.preventDefault();
	var t_id = $(".t_id").val();
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

//가입
$(".app").on("click", function(){
   //신청서가 들어가는 팀
 
   var t_id = $(".t_id").val();
   if (confirm("정말 취소하시겠습니까??") == true){  
	    $.ajax({
	      type:'post',
	      url:'joinTeam',
	      data: {t_id:t_id},
	      success : function(result){
	         console.log("result: "+result);
	         if(result == 'SUCCESS'){
	            alert("신청되었습니다.");
	            
	            location.reload();
	
	         }
	      }
	   });
   }else{   //취소
	    return;
	}
});
</script>


	<script>
		var formid = $("#formid");
		
		function dropout() {
			event.preventDefault()
			var t_id = $(".t_id").val();
			alert(t_id);
			if (confirm("정말 탈퇴하시겠습니까??") == true) { //확인
				$.ajax({
					type : 'post',
					url : 'dropoutTeam',
					data : {
						t_id : t_id
					},
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("탈퇴완료.");

							window.location.href = "myTeams";
						}
					}
				});
			} else { //취소
				return;
			}
		}

		function inactive() {
			event.preventDefault()
			var t_id = $(".t_id").val();
			var recruit = 0;
			if (confirm("팀을 비활성하시겠습니까??") == true) { //확인
				$.ajax({
					type : 'post',
					url : 'Recruitcont',
					data : {
						t_id : t_id,
						permit : recruit
					},
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("비활성화.");
							window.location.href = "myTeams";
						}
					}
				});
			} else { //취소
				return;
			}
		}

		function activation() {
			event.preventDefault()
			var t_id = $(".t_id").val();
			var recruit = 1;
			if (confirm("팀을 활성화합니다.") == true) { //확인
				$.ajax({
					type : 'post',
					url : 'Recruitcont',
					data : {
						t_id : t_id,
						permit : recruit
					},
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("활성화.");
							window.location.href = "myTeams";
						}
					}
				});
			} else { //취소
				return;
			}
		}
		$("#manager").on("click", function() {
			var str = "<input type='hidden' name='r_id' value='0'>";
			 str += "<input type='hidden' name='ep_id' value='${manage.ep_id}'>"; 
			$("form").append(str);
			$("form").attr("action", "screen/manager");
			$("form").attr("method", "get");
			$("form").submit();
		});
		$("#ePageModify").on("click", function() {
			$("form").attr("action", "screen/ePageModify");
			$("form").attr("method", "get");
			$("form").submit();
		});
		$("#evalPage").on("click", function() {
			$("form").attr("action", "screen/evalPage");
			$("form").attr("method", "get");
			$("form").submit();
		});
	</script>
</body>
</html>