<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>장소 목록 보기</title>
<style>
form label {
	display: inline-block;
	width: 100px;
}

form input {
	margin-top: 20px;
}
</style>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<c:if test="${sessionScope.u_id==null}">
	<script>
		alert("로그인 후 이용하실 수 있습니다.");
		location.href = "/contest/home";
	</script>
</c:if>

<body>
<input type="hidden" value="id" name="${sessionScope.u_id }">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home">Contest helper</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#about">소개</a></li>
					<li><a href="#services">서비스</a></li>
					<li><a href="#contact">위치</a></li>
					<li><a href="ScheMain?id=${member.getId()}">스케줄</a></li>
					<li><a href="place">예약</a></li>
				</ul>

				<c:if test="${empty sessionScope.u_id}">
					<ul class="nav navbar-nav navbar-right">

						<li><a href="join"><span class="glyphicon glyphicon-user"></span>
								Sign Up</a></li>
						<li><a data-toggle="modal" data-target="#login"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
					</ul>

ㅜㅁ
				</c:if>
				<c:if test="${not empty sessionScope.u_id }">
					<!-- sessionScopre.id가 있으면 -->
					<script>
						
					</script>
					<ul class="nav navbar-nav navbar-right">
						<li style="color: white;">${sessionScope.u_id}</li>
						<li><a href="logout"><span
								class="glyphicon glyphicon-log-in"></span> logout</a></li>
					</ul>

				</c:if>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<br>
	<br>
	<br>
	<br>
	<p align="center">결제리스트</p>
	<table class="table table-bordered table-hover">

		<tr>
			<th>예약번호</th>
			<th>결제방법</th>
			<th>결제상태</th>
			<th>결제날짜</th>
			<th>결제자</th>
		</tr>
		<c:forEach items="${pay}" var="list">
		
			<tr>
				<td>${ list.pr_id}</td>
				<td><c:if test="${list.paykind==1 }">
					체크 카드
					</c:if>
				<c:if test="${list.paykind==2 }">
			신용 카드
					</c:if>
					<c:if test="${list.paykind==3 }">
					계좌이체
					</c:if>
					<c:if test="${list.paykind==4 }">
					휴대폰결제
					</c:if>
					</td>
	         
          
					<td><c:if test="${list.pay_Status==0}">
					<font color="red">미결제</font>
					</c:if>
				<c:if test="${list.pay_Status==1}">
			결제완료
					</c:if>
				</td>
 	<td>${ list.pay_date}</td>
 	 	<td>${ list.u_id}</td>
			</tr>
			
		</c:forEach>
	</table>

</body>
</html>