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
	<c:if test="${u_id.equals('admin')}">
		<script>
			alert("로그인 후 이용하실 수 있습니다.");
			location.href = "/contest/home";
		</script>
	</c:if>
	
	
	<jsp:include page="../Member/top.jsp"></jsp:include>
					
		<br>
		<br>
		<br>
		<br>
		<br>
		<p align="center">예약리스트</p>
		<table class="table table-bordered table-hover">
	
			<tr>
				<th>예약번호</th>
				<th>장소</th>
				<th>예약날짜</th>
	
				<th>예약자</th>
				<th>예약시작시간</th>
				<th>예약마감시간</th>
				<th>예약금액</th>
				<th>결제하기</th>
				<th>사용 기간</th>
			</tr>
			
			<c:forEach items="${reservation}" var="list">
				<tr>
					<td>${ list.pr_id}</td>
					<td>${list. p_name}</td>
					<td>${list. pr_resdate}</td>
					<td>${  list.u_id}</td>
					<fmt:parseNumber value = "${list.pr_Starttime}" pattern = "0" var = "num1"/>
						<fmt:parseNumber value = "${list.pr_endtime}" pattern = "0" var = "num2"/>
					<td>${list.pr_Starttime}
	</td>             
					<td>${ list.pr_endtime}</td>
		            <td>${list.p_cost *(num2-num1)}</td>
		            
	                <td><c:if test="${list.pr_status==0}"><a href="payment?pr_id=${list.pr_id}&id=${list.u_id}&p_id=${list.p_id}">결제</a></c:if> 
	                <c:if test="${list.pr_status==1}">예약완료</c:if>
	                
	                </td>
	                <td>${num2-num1 }시간</td>
	               
	 
				</tr>
			</c:forEach>
		</table>
	
	</body>
	</html>