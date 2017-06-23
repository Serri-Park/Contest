
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

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>

<jsp:include page="../Member/top.jsp"></jsp:include>
<body class="ns">

	<br><br>
	<div class="col-sm-7">
   		<br>
   		<hr>

         	<h2 class="hn" style="margin-left: 5px"><b class="glyphicon glyphicon-th-list" style="margin-right: 10px;"></b>개인일정</h2>
      	<hr>
      </div>
      
      
    	
					
		<div class="col-sm-7" style="margin-left: 500px;">
      	<div class="table-responsive">
   	<div id="memberList">
			<table class="table table-striped table-hover table-condensed">
				<tr align="center">
					<td class="ns"><b>일정 제목</b></td>
					<td class="ns"><b>일정 시작</b></td>
					<td class="ns"><b>일정 종료</b></td>
					<td class="ns"><b>일정 내용</b></td>
				</tr>
					
			<c:forEach var="list" items="${recentlyList }">
				<tr align="center">
			
					<td>${list.s_title }</td>
					<td>${list.s_start }</td>
					
					<td>${list.s_end }</td>
					<td><c:if test="${list.s_going==0}">
					진행준비
					</c:if>
					<c:if test="${list.s_going==50}">
					진행중
					</c:if>
					
					<c:if test="${list.s_going==100}">
					진행완료
					</c:if>
					</td>
		         
				
						
				
				<td>
			
				</td>
				
				</tr>
				
			</c:forEach>
				
			</table>
	</div>
	

			
      </div>

		</div>	
</body>
</html>