
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>게시물확인</title>
<link rel="stylesheet" href="resources/css/allTeamListcss.css">
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

.table{
	    margin-left: 30%;
	    width: 60%;
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

.t_id{
	display: none;
}

</style>

</head>
<body>
<jsp:include page="../Member/top.jsp"></jsp:include>
<!-- jstl :JSP -->

<section id="allbody" >

<div id="atigs" class="w3-sidebar w3-light-grey w3-bar-block" style="width:15%">
<h3 class="w3-bar-item">Menu</h3>
<a href="registTeam" class="w3-bar-item w3-button">팀 생성</a>
<a href="AllTeamList?Conlist=0&search=All" class="w3-bar-item w3-button">모든 팀 보기</a>
<a href="MyTeamJoinTotal" class="w3-bar-item w3-button" >팀 가입 현황</a>

</div>



<div class="table">
<c:if test="${listnum == 0}">
현재 팀들이 없습니다.
</c:if>


	<div class="row header green">
		<div class="cell">
		</div>
		<div class="cell">팀명</div>
		<div class="cell">지역</div>
		<div class="cell">분야</div>
		<div class="cell">신청날짜</div>
		<div class="cell">상태</div>
	</div>
	<c:set var="number2" value="0"/>
	
	<c:forEach items="${lists}" var="TeamVo">
<%-- 	<c:if test="${TeamVo.t_permit<2 && TeamVo.t_permit>0 }"> --%>
	<div class="row">
			<div class="cell" id="t_id">
			<input type="hidden" id="teamId" class="teamId" name="teamId" value="${TeamVo.t_id}">
			<input type="hidden" class="rights" name="rights" value="${TeamVo.m_rights}">
				<input type="hidden" class="rights" name="rights" value="${TeamVo.u_id}">
			</div>
			
			<div class="cell"><a href="teamview?t_id=${TeamVo.t_id}">${TeamVo.t_name}</a></div>
			<div class="cell">${TeamVo.t_areas}</div>
			<div class="cell">${TeamVo.t_filed}</div>
			<div class="cell"><fmt:formatDate pattern="yyyy-MM-dd" value="${TeamVo.t_regdate}"/></div>
		
	
	
	
		<c:if test="${num != 0}">
			<c:if test="${TeamVo.m_rights == 10}">
					<div class="cell"><span>가입 신청중</span></div>
			</c:if>
			<c:if test="${TeamVo.m_rights<5}">
				<div class="cell"><span>가입했음</span></div>
			</c:if>
			<c:if test="${TeamVo.m_rights==null}">
				<div class="cell"><span>가입취소</span></div>
			</c:if>
						
		</c:if>	
	</div>
		</c:forEach>
	
</div>


</section>

</body>
</html>