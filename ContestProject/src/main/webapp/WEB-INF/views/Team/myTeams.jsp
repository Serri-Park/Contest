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
<link rel="stylesheet" href="resources/css/myTeams.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

#sideBtn{
	margin-top: 50px;
    margin-left: 10%;
    height: 300px;
    font-size: 25pt;
}
 
 .table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin-top:50px;
 margin-left: 700px;
  overflow: hidden;
  width: 800px;
}
 
</style>
<c:if test="${empty sessionScope.u_id}">
<script>

alert("로그인 하셔야 합니다.");
location.href="home";
</script>
</c:if>
</head>

<body>
<jsp:include page="../Member/top.jsp"></jsp:include>
<form id="formid"></form>


<div class="table-users">
   <div class="header">My Team List</div>
	<c:if test="${num == 0 }">
		현재 가입된 팀이 없습니다.
	</c:if>
<c:if test="${num != 0 }">
<table align="center">
	<tr>
		
		<th>logo</th>
		<th>팀명</th>
		<th>지역</th>
		<th>가입일</th>
	
		
	</tr>
	<c:forEach items="${mylist}" var="TeamVo">
		<tr >
			<td class="t_id" style="display: none"><input type="hidden" class="teamId" name="teamId" value="${TeamVo.t_id}"></td>
			<td><a href="ScheMain?t_id=${TeamVo.t_id}"><img src = "displayTeamFile?fileName=${TeamVo.t_logo}"/></a></td>
			<td>${TeamVo.t_name}</td>
			<td>${TeamVo.t_areas}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${TeamVo.t_regdate}"/></td>
			<c:if test="${TeamVo.t_permit != 0}">
			
			
			
			</c:if>
			<c:if test="${TeamVo.t_permit == 0}">
			<td><span>활동종료</span></td>
			
				
			

			</c:if>
	</c:forEach>
</table>
</c:if>
</div>

<script>
var formid = $("#formid");
$(".going").on("click",function(){
		event.preventDefault();
		 var t_id = $(this).parent().prevAll(".t_id").children().eq(0).val()//그걸 받아옴
		 formid.attr("action","teamRoom");//액션 태그를 만들고 
		 formid.attr("method","get");
		
		 $("<input type='text' name ='t_id' value='"+t_id+"'>").appendTo(formid);
		 formid.submit();
	});



</script>

</body>
</html>