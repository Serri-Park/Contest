<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원 목록 보기</title>
<style>
form label {
	display: inline-block;
	width: 100px;
}

form input {
	margin-top: 20px;
}
</style>
</head>
<body>
	<table class="table table-bordered table-hover">
		<caption>게시글 전체 목록</caption>
		<tr>
			<th>사진</th>
			<th>이름</th>
			<th>아이디</th>
			<th>전화번호</th>
			<th>패스워드</th>
		</tr>
		<c:forEach items="${userInfos}" var="list">
			<tr>
				<td><img src="http://localhost:8080/contest/resources/upload/${list.u_profile}"  width="80px" height="100px"/></td>
				<td><a href="viewMember?u_id='${list.u_id}'">${list.u_name}</a></td>
				<td>${list.u_id}</td>
				<td>${list.u_hp}</td>
				<td><span class="badge">${list.u_pass}</span></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>