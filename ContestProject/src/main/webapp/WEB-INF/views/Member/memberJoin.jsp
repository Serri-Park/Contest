<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="insertmember" method="post">

아이디<input type="text" name="id">
<br>
비밀번호<input type="text" name="pass">

<br>
주소<input type="text" name="address">
<br>
핸프폰<input type="text" name="hp	">
<br>
생녕월일<input type="date" name="birthyear">
<br>
이메일<input type="text" name="email">
<br>
전공<select name="major">
<option value="manage">관리
<option value="video">동영상
<option value="document">문서
<option value="design">디자인
<option value="marketting">마케팅

</select>
<br>
등급<select name="grade">
<option value="member">참여자
<option value="e-member">주최자


</select>
<br>
<input type="submit" value="가입작성">
<input type="reset" value="초기화">
</form> 
</body>
</html>