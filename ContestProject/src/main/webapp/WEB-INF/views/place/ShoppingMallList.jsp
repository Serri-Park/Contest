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
.card{
width: 300px;

padding-: 10px;
margin-left: 60px;
margin-right:5px;
margin-bottom: 40px;
margin-top: 40px;
}

.card{
width: 260px;
  height:175;
}
ul li{
list-style: none;
}


h1{
  font-weight: lighter;
  margin-left: 100px;
  margin-top: -70px;
}

p{
  margin: 10px;
  font-family: segoe ui;
  line-height: 1.4em;
  font-size: 1.2em;
}

#mainbox{
  font-family: calibri;
  box-sizing: border-box;
  justify-content: center;
  display: inline-block;
flex-wrap: wrap;

}

</style>
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
</head>
<body>
	<jsp:include page="../Member/top.jsp"></jsp:include>


	<br>
<br>
<br>
<br>
		<h1 align="center">장소 리스트</h1>
	

<form id="pageForm" align="right" class="form-inline" style="margin-bottom:20px">
		<input type="hidden" id="page" name="page" value="${criteria.page }">
		<input type="hidden" name="recordsPerPage" value="${criteria.recordsPerPage }">
		
	</form>

		
		<c:forEach items="${placeList}" var="list">

		<div id="mainbox">
<div class="card">
 <a href="viewPlace?p_id=${list.p_id}"><img src="http://localhost:8080/contest/resources/img/${list.p_picture}"  style="width:200px;height:200px;margin-left:20px	"/></a>
<ul>
<li>이름 :${list.p_name }</li>
<li>가격 :${list.p_cost }</li>
<li> 주소 ${list.p_address }</li>
<li>종류 ${list.p_Kind} </li>
<li> 옵션: ${list.p_option}</li>
</ul>   
 </div>
  
</div>
		
	</c:forEach>
	<div class="container" align="center">
		<ul class="pagination">
			<c:if test="${criteria.prev }">
				<li>
					<a href="${criteria.startPage-1}">&laquo;</a>
				</li>
			</c:if>
			
			<c:forEach begin="${criteria.startPage }" end="${criteria.endPage }" var="idx">
				<li <c:out value="${idx==criteria.page?'class=active':''}"/>> <!-- li class-"active" -->
					<a href="${idx}">
						${idx}
					</a>
				</li>
			</c:forEach>
			<c:if test="${criteria.next }">
				<li>
					<a href="${criteria.endPage+1 }">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</div>
	<br>
	<c:if test="${u_id =='admin'}">
	<a href="place">등록</a>
	</c:if>
  <!-- Full Width Image Header -->
  
  
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
                <input name="u_pass" id="u_pass" value='' placeholder="Password" type="password" class="form-control" />
                
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
                <a href="" class="btn btn-default btn-block m-t-md"> 회원가입</a>
            </div>
        </form>
      </div>
     
        </div>
      </div>
    </div>
 
     </div>
     <script>
	var pageForm = $("#pageForm");
		$(".pagination li a").on("click", function(){
			event.preventDefault();
			
			var targetPage = $(this).attr("href");
			pageForm.find("[name=page]").val(targetPage);
			pageForm.attr("action", "PlaceList");
			pageForm.attr("method", "get");
			$("#menuType").empty();
			$("<input type='hidden' name ='p_id' value='"+targetPage+"'>").appendTo(pageForm);
			$("<input type='hidden' name ='menuType' value='${criteria.menuType}'>").appendTo(pageForm);
			pageForm.submit();
		})
		
		
	</script>
</body>
</html>