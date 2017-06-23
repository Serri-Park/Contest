<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<jsp:include page="../Member/top.jsp"></jsp:include>
<body  align="center">
<br>
<br>
<br>

<h2 style="margin-left: 10px"><b class="glyphicon glyphicon-check" style="margin-right: 5px"></b>예약</h2>

<form action="reservationForm" method="post">
<br>

<input type="hidden" value="${sessionScope.u_id}" name="u_id">
<input type="hidden" value="${a.p_id}" name="p_id">
<label>날짜:</label><input type="date"  name="pr_resdate"><br>
<label>시작시간:</label><input type="time"  name="pr_Starttime"><br>
<label>마감시간:</label><input type="time" name="pr_endtime"><br>
<label>장소명:</label>${a.p_name}<br>
<label>예약자:</label>${sessionScope.u_id}<br>
	
<label>시간당 가격</label>${a.p_cost}<br>
<input type="submit" value="예약" onclick="return confirm('예약하신것이 맞으신가요	?')" class="btn btn-primary"><input type="reset" value="다시작성" class="btn btn-warning">
</form>
</body>
</html>