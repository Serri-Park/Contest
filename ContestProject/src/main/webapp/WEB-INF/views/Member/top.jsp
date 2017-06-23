<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="verify-v1" content="UKWeA341x+qh1YxCFUrfTgQpQ4B/nSfe4Z3ofWT0SYA=">
        <meta http-equiv="imagetoolbar" content="no">

<title>Insert title here</title>
</head>
<body>


<!-- jQuery library -->

 
    
    
 <!-- Static navbar -->
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="home">The Contest Helper</a>  <!-- 팀로고 -->
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="#"><a href="home">Home</a></li>
           
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">공모전 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="contestList">공모전 현황</a></li> 
								<li><a href="AllTeamList?Conlist=1&permit=1">공모전 팀원모집</a></li>
                                <li><a href="AllTeamList?Conlist=3&permit=1">심사위원 모집</a></li>
  
                            </ul>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Team<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="AllTeamList?Conlist=0&permitt=1">Waiting TeamList</a></li>
                                <li><a href="AllTeamList?Conlist=0&permit=2">My TeamList</a></li>
                                
                                <li><a href="#">미확정</a></li>


                            </ul>
                        </li>
                        
                        <li><a href="#">Gallery</a></li>
                        <li><a href="listPage">Community</a></li>
                        <li><a href="PlaceList">장소대여</a></li>
	 <c:if test="${empty sessionScope.u_id}">
<!-- 	        <li><a href="join"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
	        <li><a href="#" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       
</c:if> 
<c:if test="${not empty sessionScope.u_id}"> <!-- sessionScopre.id가 있으면 -->
         <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> logout</a></li>


</c:if>
     

                    </ul>
                </div><!--/.nav-collapse -->
            </div><!--/.container-fluid -->
       

                </nav>
               
              <div id="login" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
         <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-header">
             <legend>로그인</legend>
   
       <div class="login-box well">
        <form accept-charset="UTF-8" role="form" method="post" action="login">
     
            <div class="form-group">
                <label for="id"> 아이디</label>
                <input name="u_id" value='' id="u_id" placeholder="user_id" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="pass">비밀번호</label>
                <input name="u_pass" id="pass" value='' placeholder="Password" type="password" class="form-control" />
                
            </div>
           
              <div class="checkbox">
      <label><input type="checkbox"> Remember me</label><br><br><br>
      </div>
            <div class="form-group" align="center" >
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Login" id="logins"/>
            </div>
          
        
     <span class='text-center' ><a href="missingPassword" class="text-sm">비밀번호 찾기</a></span>&nbsp;&nbsp;&nbsp;	
            <span class='text-center'>
            <a href="MIssingID" class="text-sm">아이디  찾기</a></span>
           
    
            <hr />
            
            <div class="form-group">
                <a href="join" class="btn btn-default btn-block m-t-md"> 회원가입</a>
            </div>
        </form>
      </div>
     
        </div>
      </div>
    </div>
 
     </div>


</body>
</html>