<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
	#newBtn {
		margin: 10px;
	}
	.greenActive { 
		color: #00B700;
	}
	.nav-stacked > li[role=presentation] {
		height: 25px;
		text-align: left;
	}
	#cnav {
		text-align: center;
		float: left;
		width: 20%;
		height: 100%;
		overflow: hidden;
		
	}
	#pageForm {
		margin-bottom:30px;
		float: right;
		text-align: center;
	}
	section {
		padding-left: 5px;
		float: right;
		width: 80%;
		height: 100%; 
		overflow: hidden;
	}
</style>
<body>
<jsp:include page="../Member/top.jsp"></jsp:include>
	
	<!-- jstl: JSP Standard Tag Library -->
	<c:if test="${delmsg}">
		<script>
			alert("게시글이 삭제 되었습니다.");
		</script>
	</c:if>

<div style="margin:5% 15%;">   
	<form id="pageForm" class="form-inline">
		<input type="hidden" id="page" name="page" value="${criteria.page }">
		<input type="hidden" name="recordsPerPage" value="${criteria.recordsPerPage }">
		<div class="form-group">
			<label>Menu Type:</label>
			<select id="menuType" name="menuType" class="form-control">
				<option value="0"
					<c:out value="${criteria.menuType eq '0'?'selected':''}"/>>
				전체글보기   
				</option>
				<option value="10"
					<c:out value="${criteria.menuType eq '10'?'selected':''}"/>>
				공모전뉴스
				</option>
				<option value="20"
					<c:out value="${criteria.menuType eq '20'?'selected':''}"/>>
				자유게시판
				</option>
				<option value="30"
					<c:out value="${criteria.menuType eq '30'?'selected':''}"/>>
				공모전수상작
				</option>
				<option value="40"
					<c:out value="${criteria.menuType eq '40'?'selected':''}"/>>
				공모전Q&A
				</option>
				<option value="50"
					<c:out value="${criteria.menuType eq '50'?'selected':''}"/>>
				수상자인터뷰
				</option>
				<option value="60"
					<c:out value="${criteria.menuType eq '60'?'selected':''}"/>>
				주최사인터뷰
				</option>
			</select>
		</div>
		<div class="form-group">
			<label>Search Type:</label>
			<select id="searchType" name="searchType" class="form-control">
				<option value="t"
					<c:out value="${criteria.searchType eq 't'?'selected':''}"/>>
				제목
				</option>
				<option value="c"
					<c:out value="${criteria.searchType eq 'c'?'selected':''}"/>>
				내용
				</option>
				<option value="w"
					<c:out value="${criteria.searchType eq 'w'?'selected':''}"/>>
				글작성자
				</option>
				<option value="tc"
					<c:out value="${criteria.searchType eq 'tc'?'selected':''}"/>>
				제목+내용
				</option>
				<option value="cw"
					<c:out value="${criteria.searchType eq 'cw'?'selected':''}"/>>
				내용+글쓴이
				</option>
				<option value="tcw"
					<c:out value="${criteria.searchType eq 'tcw'?'selected':''}"/>>
				제목+내용+글쓴이
				</option>
			</select>
		</div>
		<div class="form-group">
			<label>Keyword:</label>
			<input type="text" id="keyword" name="keyword"
					value="${criteria.keyword}" class="form-control">
		</div>
		<div class="form-group">
			<button id ="searchBtn" class="btn btn-default">Search</button>
		</div>    
	</form>
<br><br><br>


	<div id="cnav">
		<div class="list-group">  
			<ul class="nav nav-pills nav-stacked">
				<li class="list-group-item list-group-item-success">분야별</li>
				<li role="presentation"><a href="" class="b_menuType
				<c:out value="${criteria.menuType eq '0'?' greenActive':'' }"/>">전체보기</a></li>
				<li role="presentation"><a href="10" class="b_menuType
				<c:out value="${criteria.menuType eq '10'?' greenActive':'' }"/>">공모전뉴스</a></li>
				<li role="presentation"><a href="20" class="b_menuType
				<c:out value="${criteria.menuType eq '20'?' greenActive':'' }"/>">자유게시판</a></li>
				<li role="presentation"><a href="30" class="b_menuType
				<c:out value="${criteria.menuType eq '30'?' greenActive':'' }"/>">공모전수상작</a></li>
				<li role="presentation"><a href="40" class="b_menuType
				<c:out value="${criteria.menuType eq '40'?' greenActive':'' }"/>">공모전Q&A</a></li>
				<li role="presentation"><a href="50" class="b_menuType
				<c:out value="${criteria.menuType eq '50'?' greenActive':'' }"/>">수상자인터뷰</a></li>
				<li role="presentation"><a href="60" class="b_menuType
				<c:out value="${criteria.menuType eq '60'?' greenActive':'' }"/>">주최사인터뷰</a></li>
			</ul>
		</div>
	</div>   
	<section>
		<table class="table">
			<tr>
				<th width="50px">글번호</th>
				<th width="300px">제목</th>
				<th width="70px">작성자</th>
				<th width="100px">작성일</th>
				<th width="50px">조회수</th>
			</tr>
			<c:forEach items="${list}" var="board">
				<tr>
					<td>${board.b_id }</td>
					<td>
						<a href="${board.b_id}" class="title">${board.b_title }</a>
					</td>
					<td>${board.u_id }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.b_regdate}" /></td>
					<td>${board.b_hits }</td>
				</tr>
			</c:forEach>
				
		</table>
		
	<div class="container" style="text-align: center;">
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
	<div align="right"><button id ="newBtn" class="btn btn-default">글쓰기</button></div>   
	</section>
</div>
	<script>
		var pageForm = $("#pageForm");
			$(".pagination li a").on("click", function(){
				event.preventDefault();
				
				var targetPage = $(this).attr("href");
				pageForm.find("[name=page]").val(targetPage);
				pageForm.attr("action", "listPage");
				pageForm.attr("method", "get");
				$("#menuType").empty();
				$("<input type='hidden' name ='b_id' value='"+targetPage+"'>").appendTo(pageForm);
				$("<input type='hidden' name ='menuType' value='${criteria.menuType}'>").appendTo(pageForm);
				pageForm.submit();
			})
			
			$(".title").on("click",function(){
				event.preventDefault();
				var b_id = $(this).attr("href");
				pageForm.attr("action","read");
				pageForm.attr("method","get");
				$("<input type='text' name ='b_id' value='"+b_id+"'>").appendTo(pageForm);
				pageForm.submit();
			});
			$("#searchBtn").on("click", function(){
				pageForm.attr("action", "listPage");
				pageForm.attr("method", "get");
				$("#page").val(1);
				pageForm.submit();
			})
			$("#newBtn").on("click", function(){
				pageForm.attr("action", "create");
				pageForm.attr("method", "get");
				pageForm.submit();
			})
			
		$(".b_menuType").on("click", function(event){
			event.preventDefault();
			var menuType = $(this).attr("href")
			$("#keyword").val("");
			$("#searchType").empty();
			$("#menuType").val(menuType);
			pageForm.attr("action", "listPage");
			pageForm.attr("method", "get");
			$("#page").val(1);
			pageForm.submit();
		});
	</script>
</body>
</html>