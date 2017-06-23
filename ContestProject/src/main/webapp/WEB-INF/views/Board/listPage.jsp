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
<body>
<jsp:include page="../Member/top.jsp"></jsp:include>
	
	<!-- jstl: JSP Standard Tag Library -->
	<c:if test="${delmsg}">
		<script>
			alert("게시글이 삭제 되었습니다.");
		</script>
	</c:if>

<div style="margin:5% 15%">
	<div class="form-group" align="center">
		<button id ="menuAll" class="menuAll btn-default">전체글보기</button>
		<button id ="menu1" class="menu1 btn-default">공지사항</button>
		<button id ="menu2" class="menu2 btn-default">자유게시판</button>
		<button id ="menu3" class="menu3 btn-default">수기</button>
		<button id ="menu4" class="menu4 btn-default">Q&A</button>
	</div>
	<form id="pageForm" align="right" class="form-inline" style="margin-bottom:20px">
		<input type="hidden" id="page" name="page" value="${criteria.page }">
		<input type="hidden" name="recordsPerPage" value="${criteria.recordsPerPage }">
		<div class="form-group">
			<label>Menu Type:</label>
			<select id="menuType" name="menuType" class="form-control">
				<option value="0"
					<c:out value="${criteria.menuType==null?'selected':''}"/>>
				전체글보기
				</option>
				<option value="10"
					<c:out value="${criteria.menuType eq '10'?'selected':''}"/>>
				공지사항
				</option>
				<option value="20"
					<c:out value="${criteria.menuType eq '20'?'selected':''}"/>>
				자유게시판
				</option>
				<option value="30"
					<c:out value="${criteria.menuType eq '30'?'selected':''}"/>>
				수기
				</option>
				<option value="40"
					<c:out value="${criteria.menuType eq '40'?'selected':''}"/>>
				Q&A
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
					<a href="read?b_id=${board.b_id}" class="title">${board.b_title }</a>
				</td>
				<td>${board.u_id }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.b_regdate}" /></td>
				<td>${board.b_hits }</td>
			</tr>
		</c:forEach>
			
	</table>
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
	<div align="right"><button id ="newBtn" class="btn btn-default">글쓰기</button></div>
</div>
	<script>
	var pageForm = $("#pageForm");
	$("#newBtn").on("click", function(){
		var categoryCompare = "${criteria.category}";
		var dateCompare = "${criteria.dateState}";
		if(dateCompare==null) {dateCompare="all";}
		if(categoryCompare==null) {categoryCompare="allCategory";}
		$("<input type='hidden' name ='dateState' value='"+dateCompare+"'>").appendTo(pageForm)
		$("<input type='hidden' name ='category' value='"+categoryCompare+"'>").appendTo(pageForm);
		pageForm.attr("action", "create");
		pageForm.attr("method", "get");
		pageForm.submit();
	});		
		$(".pagination li a").on("click", function(){
			event.preventDefault();
			
			var targetPage = $(this).attr("href");
			pageForm.find("[name=page]").val(targetPage);
			pageForm.attr("action", "placeList");
			pageForm.attr("method", "get");
		
			$("<input type='hidden' name ='p_id' value='"+targetPage+"'>").appendTo(pageForm);
			
			pageForm.submit();
		});
	</script>
</body>
</html>