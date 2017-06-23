<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<jsp:include page="../screen/top.jsp" flush="false" />
<jsp:include page="../screen/mAside.jsp" flush="false" />
<style>
	#form {    
	margin: 5% 0% 10% 20%;
	min-height: 300px;
	}
</style>
</head>
<body>
	<div id="form">
		<table class="table table-hover" style="width:900px;"> 
			<tr>
				<th>팀 이름</th>
				<th>작품명</th>
				<th>결과</th>
			</tr>

			<c:forEach items="${m}" var="m">
				<tr>
					<td>${m.t_name }</td>
					<td>${m.w_name }</td>
					<c:if test="${m.w_result == 0}">
					<td>불통과</td>
					</c:if>
					<c:if test="${m.w_result != 0}">
					<td>${m.w_result}차 통과</td>
					</c:if>
				</tr>


			</c:forEach>
		</table>
	</div>
</body>
</html>