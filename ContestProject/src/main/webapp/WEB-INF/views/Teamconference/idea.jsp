<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- Bootstrap styles -->
    <link rel="stylesheet" href="http://getbootstrap.com/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://weloveiconfonts.com/api/?family=fontawesome">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<%@include file="./bwnav.jsp"%>
<%@include file="./chat.jsp"%>
</head>
<body>
<h3 style="font-family:'Comic Sans MS'; padding-left:25%">IdeaList</h3>
<table class="table" style="width:70%;margin:auto; margin-top:50px; text-align:left;">
      <tr>
         <th>아이디어</th>
         <th>카테고리</th>
         <th>등록자</th>
         <th></th>
      </tr>
      <c:forEach items="${list}" var="a">
         <tr>
            <td>${a.bwi_content}</td>
            <td>${a.bwc_content}</td>
            <td>${a.u_id}</td>
         </tr>  
      </c:forEach>
   </table>

</body>

</html>