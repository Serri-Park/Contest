<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	  @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	  		.hn {font-family: 'Hanna';}
	  @import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
			.ns {font-family: 'Noto Sans KR', sans-serif;}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Insert title here</title>
</head>
<body class="ns">
	<br><br>
	<div class="col-sm-7">
	<br>
		<hr>
			<h2 class="hn" style="margin-left: 5px"><b class="glyphicon glyphicon-search" style="margin-right: 10px;"></b>검색결과</h2>
		<hr>
	</div>
	
	<div class="col-sm-7" style="margin-left: 300px;">
	<div class="table-responsive">	
	<input type="hidden" value="${session.member.getId() } name="id">
	<table class="table table-striped table-hover table-condensed">
				<tr align="center">
					<td class="ns"><b>일정 제목</b></td>
					<td class="ns"><b>일정 시작</b></td>
					<td class="ns"><b>일정 종료</b></td>
					<td class="ns"><b>일정 내용</b></td>
				</tr>
			<c:forEach var="list" items="${getValue }">
				<tr align="center">
				<c:if test="${list.schecategory==2 }">
					<td>${list.schetitle }</td>
					<td>${list.schestart }</td>
					<td>${list.scheend }</td>
					<td>${list.schecontent }</td>
					</c:if>
					<c:if test="${list.schecategory==1 }">
					<td>${list.schetitle }</td>
					<td>${list.schestart }</td>
					<td>${list.scheend }</td>
					<td>${list.schecontent }</td>
					</c:if>
					<c:if test="${list.schecategory=='' }">
					<td>${list.schetitle }</td>
					<td>${list.schestart }</td>
					<td>${list.scheend }</td>
					<td>${list.schecontent }</td>
					</c:if>
				</tr>
			</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>