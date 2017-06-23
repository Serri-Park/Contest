<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원 가입 사진 첨부</title>
<style>
form label {
	display:inline-block;
	width: 100px;
}
form input {
	margin-top: 20px;
}
</style>
</head>
<body>
<form action="join" method="post" enctype="multipart/form-data">
	<label for="id">아이디:</label>
	<input type="text" id="u_id" name="u_id" value="${userInfo.u_id}"> <br>
	<label for="pass">암호:</label>
		<input type="password" id="u_pass" name="u_pass" value="${userInfo.u_pass}"> <br>
		<label for="name">이름:</label>
		<input type="text" id="name" name="name" value="${userInfo.u_name}"> <br>
		<label for="u_hp">전화번호:</label>
	<input type="tel" id="u_hp" name="u_hp" value="${userInfo.u_hp}"> <br>
	<label for="photo">사진:</label> ${userInfo.u_profile}
	
	<p><img src="cresources/upload/${list.u_profile}"  width="80px" height="100px"/>
</p>
</form>
<input type=button id='button1' class="btn btn-primary"
		value="전체회원목록보기"
		Onclick="window.location.href='viewAllMember'">
</body>
</html>