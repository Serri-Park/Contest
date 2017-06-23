<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<link rel="stylesheet" href="http://cdn.bootcss.com/animate.css/3.5.1/animate.min.css">
    <title>One Page Wonder - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/one-page-wonder.css" rel="stylesheet">

</head>
<body>

<br>

   
<jsp:include page="../Member/top.jsp"></jsp:include>
     
<div class="container" style="margin:30px 400px" >

  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:2020px; margin-left:-500px;">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="resources/images/idea.JPG" alt="Los Angeles" style="width:100%; height:450px;">
      </div>

      <div class="item">
        <img src="resources/images/idea.JPG" alt="Chicago" style="width:100%;height:450px">
      </div>
    
      <div class="item">
        <img src="resources/images/idea.JPG" alt="New york" style="width:100%;height:450px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
        <a href="AllTeamList?Conlist=0&permit=1">  <img class="img-circle" src="resources/images/recurit.JPG" alt="Generic placeholder image" width="140" height="140"></a>
          
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
         <a href="AllTeamList?Conlist=1&permit=1"> <img class="img-circle" src="resources/images/team.jpg" alt="Generic placeholder image" width="240" height="200">
           
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <a href="AllTeamList?Conlist=3&permit=1"><img class="img-circle" src="resources/images/eval.jpg" alt="Generic placeholder image" width="240" height="200"></a>
          
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->


    </div>

    <c:forEach items="${contest}" var="lists">
    ${lists.c_name }
    
    
    
    
    
    </c:forEach>

     
    
          




    
</body>

</html>
