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
<style>
#allbody{
	width: 90%;
	height: 700px;
	margin:auto;
	border: 1px solid #ffffff;
	padding: 20px;
	
}

#ControllBtn{
	height: 37px;
   	margin-left: 27%;
}



.form-control{
	width: 150px;
	display: inline-block;
}

</style>
</head>

<body>
<jsp:include page="../Member/top.jsp"></jsp:include>
<!-- jstl :JSP -->

<section id="allbody" >
	<c:if test="${sessionScope.u_id!= null}">
		
		
		<div id="ControllBtn">
			

			<div class="form-group">
				<select name="searchTypeFile" id="changeType" class="form-control">
					<option value="All" <c:out value="${search.searchTypeFile eq 'All'?'selected':'' }"/>>All</option>	
					<option value="논문/리포트" <c:out value="${search.searchTypeFile eq '논문/리포트'?'selected':'' }"/>>논문/리포트</option>
					<option value="기획/아이디어" <c:out value="${search.searchTypeFile eq '기획/아이디어'?'selected':'' }"/>>기획/아이디어</option>
					<option value="네이밍/슬로건" <c:out value="${search.searchTypeFile eq '네이밍/슬로건'?'selected':'' }"/>>네이밍/슬로건</option>
					<option value="디자인/캐릭터/만화" <c:out value="${search.searchTypeFile eq '디자인/캐릭터/만화'?'selected':'' }"/>>디자인/캐릭터/만화</option>
					<option value="광고/마케팅" <c:out value="${search.searchTypeFile eq '광고/마케팅'?'selected':'' }"/>>광고/마케팅</option>
					<option value="영상/사진" <c:out value="${search.searchTypeFile eq '영상/사진'?'selected':'' }"/>>영상/사진</option>
					<option value="UCC/SOUND" <c:out value="${search.searchTypeFile eq 'UCC/SOUND'?'selected':'' }"/>>UCC/SOUND</option>
					<option value="예체능" <c:out value="${search.searchTypeFile eq '예체능'?'selected':'' }"/>>예체능</option>
					<option value="문학/수기" <c:out value="${search.searchTypeFile eq '문학/수기'?'selected':'' }"/>>문학/수기</option>
					<option value="과학/공학" <c:out value="${search.searchTypeFile eq '과학/공학'?'selected':'' }"/>>과학/공학</option>
					<option value="게임/소프트웨어" <c:out value="${search.searchTypeFile eq '게임/소프트웨어'?'selected':'' }"/>>게임/소프트웨어</option>
					<option value="건축/건설" <c:out value="${search.searchTypeFile eq '건축/건설'?'selected':'' }"/>>건축/건설</option>
					<option value="체험/참여" <c:out value="${search.searchTypeFile eq '체험/참여'?'selected':'' }"/>>체험/참여</option>
					<option value="취업/창업" <c:out value="${search.searchTypeFile eq '취업/창업'?'selected':'' }"/>>취업/창업</option>
					<option value="경품/이벤트" <c:out value="${search.searchTypeFile eq '경품/이벤트'?'selected':'' }"/>>경품/이벤트</option>
					<option value="전시/페스티벌" <c:out value="${search.searchTypeFile eq '전시/페스티벌'?'selected':'' }"/>>전시/페스티벌</option>
					<option value="장학(금)재단" <c:out value="${search.searchTypeFile eq '장학(금)재단'?'selected':'' }"/>>장학(금)재단</option>
					<option value="봉사활동" <c:out value="${search.searchTypeFile eq '봉사활동'?'selected':'' }"/>>봉사활동</option>
					<option value="해외 " <c:out value="${search.searchTypeFile eq '해외'?'selected':'' }"/>>해외</option>
					<option value="기타" <c:out value="${search.searchTypeFile eq '기타'?'selected':'' }"/>>기타</option>
				</select>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<select name="searchAreas" id="searchAreas" class="form-control">		
					<option value="All" <c:out value="${search.searchAreas eq 'All'?'selected':'' }"/>>All</option>
					<option value="서울" <c:out value="${search.searchAreas eq '서울'?'selected':'' }"/>>서울</option>
					<option value="부산" <c:out value="${search.searchAreas eq '부산'?'selected':'' }"/>>부산</option>
					<option value="대구" <c:out value="${search.searchAreas eq '대구'?'selected':'' }"/>>대구</option>
					<option value="울산" <c:out value="${search.searchAreas eq '울산'?'selected':'' }"/>>울산</option>
					<option value="대전" <c:out value="${search.searchAreas eq '대전' ?'selected':'' }"/>>대전</option>
					<option value="광주" <c:out value="${search.searchAreas eq '광주'?'selected':'' }"/>>광주</option>
					<option value="제주" <c:out value="${search.searchAreas eq '제주' ?'selected':'' }"/>>제주</option>
			</select>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<c:if test="${Conlist == 0 && permit == 1 || permit == 2}">
				<select name="searchRights" id="SearchRights" class="form-control">		
					<option value=0 <c:out value="${search.searchRights == 0 ?'selected':'' }"/>>모든팀</option>
					<option value=1 <c:out value="${search.searchRights == 1 ?'selected':'' }"/>>참여자</option>
					<option value=3 <c:out value="${search.searchRights == 3 ?'selected':'' }"/>>개최자</option>
				</select>
			</c:if>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<label>Keyword:</label> 
				<input type="text" name="keyword" id="keyword" placeholder="${search.keyword}" value="" class="form-control">
				<button id="searchBtn" class="btn btn-default">Search</button>
				
				<span>
					<c:if test="${Conlist == 1 || Conlist == 0}">
						<button class="createTeam" class="btn btn-default">참여팀 생성</button>
					</c:if>
					<c:if test="${Conlist == 3}">
						<button class="createTeam" class="btn btn-default">개최팀 생성</button>
					</c:if>
				</span>
			</div>
		</div>
		
		<div class="table-users">
			<div class="a">Team List</div>
			<c:if test="${listnum == 0 }">
				현재 팀이 없습니다.
			</c:if>
			
			<c:if test="${listnum != 0 }">
				<table>
					<tr>
						
						<th>logo</th>
						<th>팀명</th>
						
						<c:if test="${Conlist == 3}">
							<th>주최자</th>
						</c:if>
						<c:if test="${Conlist == 1}">
							<th>팀장</th>
						</c:if>
						<c:if test="${Conlist == 0}">
							<th>구분</th>
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
								
								<c:if test="${Conlist == 0}">
									<c:if test="${TeamVo.m_rights == 1}">
										<td>참가팀</td>
									</c:if>
									
									<c:if test="${TeamVo.m_rights == 3}">
										<td>개최팀</td> 
									</c:if>
								</c:if>
								
								<td>${TeamVo.u_name}</td>
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

var Conlist = "";
Conlist = ${Conlist};
var permit ="";
permit = ${permit};
$(".createTeam").on("click", function(){
	if(Conlist ==1 || Conlist ==0){
	window.location.href="registTeam?Conlist=1";
	}else if(Conlist == 3){
		window.location.href="registTeam?Conlist=3";	
	}
});



//나중에 분야로 검색할때 이용
//분야
var searchFile = "";
var searchRights = 0;
var keyword="";
var searchAreas="";
$("#changeType").change(function(){
	
    $( "#changeType option:selected" ).each(function() {
    	searchFile = $( this ).text() + "";
    	
    });
   
});



//개최자 & 참가자 구분
$("#SearchRights").change(function(){
	
    $( "#SearchRights option:selected" ).each(function() {
    	searchRights = $(this).val();
    	
    });
   
});


//지역 구분
$("#searchAreas").change(function(){
	
    $( "#searchAreas option:selected" ).each(function() {
    	searchAreas = $(this).text() + "";
    	
    });
   
});


$("#searchBtn").on("click",function(){
	keyword = $("#keyword").val();
	window.location.href="AllTeamList?Conlist="+Conlist+"&permit="+permit+"&searchFile="+searchFile+"&searchRights="+searchRights+"&keyword="+keyword+"&searchAreas="+searchAreas;
});


//가입
//가입
$(".app").on("click", function(){
   //신청서가 들어가는 팀
 
   var t_id = $(this).parent().prevAll(".t_id").children().eq(0).val();
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



</script>
</body>
</html>