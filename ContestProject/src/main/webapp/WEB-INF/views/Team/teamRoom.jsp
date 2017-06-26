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

#formid{
display: none;
}

#atigs{
	
	height: 37px;
    margin-left: 100px;
}

#imgsite{
    width: 80%;
    height: 300px;
    border: 1px solid #ffffff;
    margin-top: 30px;
    margin-left: 27px;
    border-top-left-radius: 2em;
    border-top-right-radius: 2em;
    border-bottom-left-radius: 2em;
    border-bottom-right-radius: 2em;
    box-shadow:10px 10px 10px silver;
    
}

img{
	width: 100%;
	height: 100%;
	border-top-left-radius: 2em;
    border-top-right-radius: 2em;
    border-bottom-left-radius: 2em;
    border-bottom-right-radius: 2em;
	
}


#sectionLeft{
	width: 45%;
    float: left;
    margin-left: 70px;
}

#sectionrigth{
	width: 45%;
  	 margin-top: 25px;
    margin-left: 48%;
}

#table-users{
	width: 80%;
	height: 300px;
	border: 1px solid #ffffff;
    margin: 10px;
    padding: 17px;
    border-top-left-radius: 2em;
    border-top-right-radius: 2em;
    border-bottom-left-radius: 2em;
    border-bottom-right-radius: 2em;
    box-shadow:10px 10px 10px #CCC7C7;
     background-color: #D8EEEE;
}

#partici{
	width: 80%;
	height: 280px;
	border: 1px solid #ffffff;
    margin-top: 30px;
    margin-left:30px;
    padding: 17px;
    border-top-left-radius: 2em;
    border-top-right-radius: 2em;
    border-bottom-left-radius: 2em;
    border-bottom-right-radius: 2em;
    box-shadow:10px 10px 10px #CCC7C7;
     background-color: #D8EEEE;

}

#contentser{
	width: 80%;
	height: 285px;
	border: 1px solid #ffffff;
	margin-top: 30px;
    margin-left: 10px;
    padding: 17px;
    border-top-left-radius: 2em;
    border-top-right-radius: 2em;
    border-bottom-left-radius: 2em;
    border-bottom-right-radius: 2em;
    box-shadow:10px 10px 10px #CCC7C7;
    background-color: #D8EEEE;

}


</style>


</head>
<jsp:include page="../Member/top.jsp"></jsp:include>

<!-- <body align="center"> -->
<body>
<form id="formid">
		<input type="hidden" class="t_id" name="t_id" value="${t_id}">
		<input type="hidden" class="t_filed" name="t_filed" value="${teamDate.t_filed}">
		<input type="hidden" class="m_rights" name="m_rights" value="${leader}">
</form>
		

<section id="allbody">
	<div id="atigs">
			
			<c:if test="${teamDate.t_permit == 0}">
				<c:if test="${Rights.m_rights == 1 || Rights.m_rights == 3 }">
					<c:if test="${permit.t_permit != 2}">
						<span>팀이 활동하지 않습니다.</span>
						<button id="inactive" class="btn btn-default" onclick="activation()">활동시작</button><br>
					</c:if>
				</c:if>
			</c:if>
			
		

			
			
			
			<c:if test="${teamDate.t_permit != 0}">
				<c:if test="${Rights.m_rights == 10}">
					<button class="cancell btn btn-default">지원취소</button>
				</c:if>
				<c:if test="${Rights.m_rights == 11}">
					<button class="cancell btn btn-default">거절</button>
				</c:if>
				<c:if test="${Rights.m_rights == null}">
					<button class="app btn btn-default">가입신청</button>
				</c:if>
			
				
				
				<c:if test="${Rights.m_rights == 1 || Rights.m_rights == 3 }">
							
						<c:if test="${teamDate.t_permit == 1 || teamDate.t_permit == 2}">
							<button id="inactive" class="btn btn-warning" onclick="inactive()">활동중지</button>
							
							
						
						</c:if>
						
						<c:if test="${teamDate.t_permit == 1}">
							<button id="recruitStop" class="btn btn-warning">팀원 모집완료</button>
						</c:if>
						
						<c:if test="${teamDate.t_permit == 2}">
							
							<button id="recruitGo" class="btn btn-danger">팀원 모집시작</button>
						</c:if>
						
						<c:if test="${Rights.m_rights == 1}">
							<button id="claimant" class="btn btn-warning">가입신청자보기</button>
						</c:if>
							
						<c:if test="${Rights.m_rights == 3}">
							<button id="claimant" class="btn btn-warning">심사위원지원자보기</button>
							<a href="ScheMain?t_id=${t_id }">
						<button id="conference" class="btn btn-danger">캘린더</button></a>
							<a href="contestForm?t_id=${t_id }"><button class="btn btn-default">공모전 개최</button></a>
						</c:if>
					
				</c:if>	
				
			</c:if>
			
			<c:if test="${Rights.m_rights == 2 || Rights.m_rights == 4}">
				<button id="inactive" class="btn btn-danger" onclick="dropout()">탈퇴</button>
				
			</c:if>
			
		
  
			<c:if test="${teamDate.t_permit == 2}">
			
				<c:if test="${Rights.m_rights == 1 || Rights.m_rights == 2}">
					
					<a href="ScheMain?t_id=${t_id }">
						<button id="conference" class="btn btn-danger">캘린더</button></a>
					
					<!-- 참가자팀 팀장만 보기 -->
					<c:if test="${Rights.m_rights == 1}">
						<a href="contestList?t_id=${t_id}&dateState=ing&category=${teamDate.t_filed}">
							<button id="conference" class="btn btn-danger">접수</button></a>
					</c:if>
					<!--  -->
					<a href="bwlist?t_id=${t_id}&u_id=${sessionScope.u_id }" class="btn btn-default" id="navproject" style="text-decoration:none;">My Project</a>
	
				</c:if>
				
				
				<c:if test="${Rights.m_rights == 4}">
						<a href="ScheMain?t_id=${t_id }">
						<button id="conference" class="btn btn-danger">캘린더</button></a>
						<button class="btn btn-default" id="manager">평가매니저</button>
						
				</c:if>
				<c:if test="${Rights.m_rights == 3}">
					
					<c:if test="${manage.ep_state==1}">
						<button class="btn btn-default" id="evalPage">평가단계설정</button>
					</c:if>
				
					<c:if test="${manage.ep_state==0}">
						<button class="btn btn-default" id="ePageModify">평가단계수정</button>
					</c:if>
					<button class="btn btn-default" id="manager">평가매니저</button>

				</c:if>
				
				
				
			</c:if>
		</div>
	
	
	
	<section id="sectionLeft">
	
		
		
	<!-- 이미지 -->
	<article id="imgsite">
		<img src = "displayTeamFile?fileName=${teamDate.t_logo}"/> 
	</article>
	
	<article id="partici">
			<div><h3>팀명: ${teamDate.t_name}</h3></div>
				<div>
					<div><h4>팀 소개</h4></div>
				<div>${teamDate.t_content}</div>
			</div>
	</article>
	
	
	
	</section>
	
	<section id= "sectionrigth">
		
		<article id="table-users">
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
		var formid = $("#formid");
		
		function dropout() {
			event.preventDefault()
			var t_id = $(".t_id").val();
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

							window.location.href = "AllTeamList?Conlist=0&permitt=1";
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
							 location.reload();
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
							location.reload();
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
		
		
		
		$("#claimant").on("click",function(){
			
			 var t_filed = $(".t_filed").val();
			 var m_rights = $(".m_rights").val();
			 var t_id = $(".t_id").val();
			 //window.open("post?ppctor="+ppctor,"메세지창","width=500,height=600 scrollbars=yes,")
				window.open("Team/claimant?t_id="+t_id+"&m_rights="+m_rights+"&t_filed="+t_filed,"모집현황창","width=630,height=630 scrollbars=yes,")
		});



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
   if (confirm("정말 가입하시겠습니까??") == true){  
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


//모집시작
var permit = 0;
	var t_id = $(".t_id").val();
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
        				location.reload();
        				

        			}
        		}
        	});
        });


    	
</script>
	
</body>
</html>