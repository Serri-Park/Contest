<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    .ideamenu a{cursor:pointer;}
    .ideamenu .idealistt{display:none;}
    .ideamenu{
    margin-bottom:15px; font-size:20px;color:white;font-family:'Comic Sans MS';background-color: #e31937;box-shadow:0 0 15px rgb(33, 30, 30);text-align:center;border: 1px solid #e31937; border-radius:5px;margin-left:25px; float: left; width: 15%;
    }
</style>

<!-- Bootstrap styles -->
    <link rel="stylesheet" href="http://getbootstrap.com/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://weloveiconfonts.com/api/?family=fontawesome">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
       
<%@include file="./bwnav.jsp"%>
<%@include file="./chat.jsp"%>
</head>
<body>

<h3 style="font-family:'Comic Sans MS'; padding-left:25%">IdeaList</h3>
<div class="Allmenus">
   
</div>

      <c:forEach items="${list}" var="a" varStatus="loop">
<script>
var k1 = ${loop.index};
var k3 ="${a.bwc_content}";
if(k1 == 0){
	var z = "";
	z = z + "<div class='ideamenu'>"+
    "<a href='#' style='text-decoration:none;color:white;'>카테고리  : ${a.bwc_content}</a>"+
    "<div class='idealistt'>"+
     "<hr>"+
      "<p>${a.bwi_content}</p>"+
    "</div>"+
  "</div>";
  $(".Allmenus").append(z);
}else{
	var k2 = "${list[loop.index-1].bwc_content}";
	if(k2 == k3){
		var g = "";
		g = g + "<p>${a.bwi_content}</p>";
		$(".Allmenus div div:last").append(g);
	}else{
		var z = "";
		z = z + "<div class='ideamenu'>"
	    +"<a href='#' style='text-decoration:none;color:white;'>카테고리  : ${a.bwc_content}</a>"
	    +"<div class='idealistt'>"
	     +"<hr>"
	      +"<p>${a.bwi_content}</p>"
	    +"</div>"
	  +"</div>";
	  $(".Allmenus").append(z);
	}
} 
</script>

</c:forEach>
<script>
      $(document).ready(function(){
          $(".ideamenu>a").click(function(){
              var submenu = $(this).next("div");

              // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
              if( submenu.is(":visible") ){
                  submenu.slideUp();
              }else{
                  submenu.slideDown();
              }
          }).mouseover(function(){
              $(this).next("div").slideDown();
          });
      });
</script>
      

</body>

</html>