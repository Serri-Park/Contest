<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>

.bwnavi {
margin-top:-20px;    
width:100%;
height :10%;
background-color: #e31937;
box-shadow:0 0 15px rgb(33, 30, 30);
}
#navsub {
padding-left:30px;
padding-top:25px;
color :white;
font-size :20px;
font-family:'Comic Sans MS';
width:60%;
display:inline-block;
} 
.navcategory{
width:8%;
display:inline-block;
color :white;
font-size :14px;
font-family:'Comic Sans MS';
}
a:hover {color: blue; text-decoration: underline;

}
</style>
<% 
String t_id = "";
t_id = (String)session.getAttribute("t_id"); 
%>
<nav class="bwnavi">
<p id="navsub">Conference</p>

<a href="canvas?t_id=${t_id}" class="navcategory">Canvas</a>
<a href="bwlist?t_id=${t_id}" class="navcategory" id="navproject" style="text-decoration:none;">My Project</a>
<a href="bwcreate?t_id=${t_id}"  class="navcategory" style="text-decoration:none">Create</a>
<a href="home" class="navcategory">회의실 나가기</a>
</nav>
<script>

</script>
</body>
</html>