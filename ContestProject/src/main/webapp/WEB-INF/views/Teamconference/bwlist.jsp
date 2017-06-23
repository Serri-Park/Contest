<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>

<%@include file="./bwnav.jsp"%>
<%@include file="./chat.jsp"%>
<h3 style="font-family:'Comic Sans MS'; padding-left:25%">Project</h3>
<table class="table" style="width:70%;margin:auto; margin-top:50px; text-align:left;">
      <tr>
         <th>번호</th>
         <th>제목</th>
         <th>등록일</th>
         <th></th>
      </tr>
      <c:forEach items="${list}" var="a">
         <tr>
            <td>${a.bw_id}</td>
            <td>${a.bw_sub}</td>
            <td style="margin-right:-30px;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${a.bw_time}"/></td>
            <td class="btn-group btn-group-justified" style="display:inline-block;">
            <a href="./idea?bw_id=${a.bw_id}" class="btn btn-sm btn-default push-down-sm"><span class="glyphicon glyphicon-comment"></span><span class="hidden-xs hidden-sm"> Ideas</span></a>
            <a href="./page?bw_id=${a.bw_id}" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-th"></span><span class="hidden-xs hidden-sm"> Session</span></a>
           </td>
         </tr>  
      </c:forEach>
   </table>
<!-- <div class="container">
  <h2>로그인 하세요</h2>
  <form method="post" style="margin:10% 10%">
  
    <div class="form-group">
      <label for="ID">회원 ID :</label>
      <input type="text" class="form-control" id="ID" name="ID" >
    </div>
    <button class="btn btn-default" id="login">로그인</button>
  </form>

</div> -->
</body>
</html>