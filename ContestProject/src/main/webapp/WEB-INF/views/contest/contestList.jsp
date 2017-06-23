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
	<style>
		#leftS {
			float: right;
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
		
		section {
			padding-left: 5px;
			float: right;
			width: 80%;
			height: 100%; 
			overflow: hidden;
		}
	</style>
</head>
<body>	
<jsp:include page="../Member/top.jsp"></jsp:include>

	<!-- jstl: JSP Standard Tag Library -->
	<c:if test="${delmsg}">
		<script>
			alert("게시글이 삭제 되었습니다.");
		</script>
	</c:if>
<div style="margin: 0% 10%">
	<div id="cnav">
		<div class="list-group">  
			<ul class="nav nav-pills nav-stacked">
				<li class="list-group-item list-group-item-success">분야별</li>
				<li role="presentation"><a href="allCategory" class="c_category
				<c:out value="${criteria.category eq 'allCategory'?' greenActive':'' }"/>">전체보기</a></li>
				<li role="presentation"><a href="논문/리포트" class="c_category
				<c:out value="${criteria.category eq '논문/리포트'?' greenActive':'' }"/>">논문/리포트</a></li>
				<li role="presentation"><a href="기획/아이디어" class="c_category
				<c:out value="${criteria.category eq '기획/아이디어'?' greenActive':'' }"/>">기획/아이디어</a></li>
				<li role="presentation"><a href="네이밍/슬로건" class="c_category
				<c:out value="${criteria.category eq '네이밍/슬로건'?' greenActive':'' }"/>">네이밍/슬로건</a></li>
				<li role="presentation"><a href="디자인/캐릭터/만화" class="c_category
				<c:out value="${criteria.category eq '디자인/캐릭터/만화'?' greenActive':'' }"/>">디자인/캐릭터/만화</a></li>
				<li role="presentation"><a href="광고/마케팅" class="c_category
				<c:out value="${criteria.category eq '광고/마케팅'?' greenActive':'' }"/>">광고/마케팅</a></li>	
				<li role="presentation"><a href="영상/사진" class="c_category
				<c:out value="${criteria.category eq '영상/사진'?' greenActive':'' }"/>">영상/사진</a></li>	
				<li role="presentation"><a href="UCC/SOUND" class="c_category
				<c:out value="${criteria.category eq 'UCC/SOUND'?' greenActive':'' }"/>">UCC/SOUND</a></li>
				<li role="presentation"><a href="예체능" class="c_category
				<c:out value="${criteria.category eq '예체능'?' greenActive':'' }"/>">예체능</a></li>	
				<li role="presentation"><a href="문학/수기" class="c_category
				<c:out value="${criteria.category eq '문학/수기'?' greenActive':'' }"/>">문학/수기</a></li>
				<li role="presentation"><a href="과학/공학" class="c_category
				<c:out value="${criteria.category eq '과학/공학'?' greenActive':'' }"/>">과학/공학</a></li>
				<li role="presentation"><a href="게임/소프트웨어" class="c_category
				<c:out value="${criteria.category eq '게임/소프트웨어'?' greenActive':'' }"/>">게임/소프트웨어</a></li>
				<li role="presentation"><a href="건축/건설" class="c_category
				<c:out value="${criteria.category eq '건축/건설'?' greenActive':'' }"/>">건축/건설</a></li>
				<li role="presentation"><a href="체험/참여" class="c_category
				<c:out value="${criteria.category eq '체험/참여'?' greenActive':'' }"/>">체험/참여</a></li>
				<li role="presentation"><a href="취업/창업" class="c_category
				<c:out value="${criteria.category eq '취업/창업'?' greenActive':'' }"/>">취업/창업</a></li>
				<li role="presentation"><a href="경품/이벤트" class="c_category
				<c:out value="${criteria.category eq '경품/이벤트'?' greenActive':'' }"/>">경품/이벤트</a></li>
				<li role="presentation"><a href="전시/페스티벌" class="c_category
				<c:out value="${criteria.category eq '전시/페스티벌'?' greenActive':'' }"/>">전시/페스티벌</a></li>
				<li role="presentation"><a href="장학(금)재단" class="c_category
				<c:out value="${criteria.category eq '장학(금)재단'?' greenActive':'' }"/>">장학(금)재단</a></li>
				<li role="presentation"><a href="봉사활동" class="c_category
				<c:out value="${criteria.category eq '봉사활동'?' greenActive':'' }"/>">봉사활동</a></li>
				<li role="presentation"><a href="해외" class="c_category
				<c:out value="${criteria.category eq '해외'?' greenActive':'' }"/>">해외</a></li>
				<li role="presentation"><a href="기타" class="c_category
				<c:out value="${criteria.category eq '기타'?' greenActive':'' }"/>">기타</a></li>
			</ul>
		</div>
	</div>
	<form id="pageForm" class="form-inline" style="margin-bottom:20px">
		<input type="hidden" id="page" name="page" value="${criteria.page }">
		<input type="hidden" name="recordsPerPage" value="${criteria.recordsPerPage }">
		<section>
			<div align="right"><button id ="newBtn" class="btn btn-default">글쓰기</button></div>
			<ul class="nav nav-pills nav-justified">
				<li role="presentation"><a href="all" class="dateSelect
				<c:out value="${criteria.dateState eq 'all'?' greenActive':'' }"/>" >전체보기</a></li>
				<li role="presentation"><a href="start" class="dateSelect
				<c:out value="${criteria.dateState eq 'start'?' greenActive':'' }"/>">접수예정</a></li>
				<li role="presentation"><a href="ing" class="dateSelect
				<c:out value="${criteria.dateState eq 'ing'?' greenActive':'' }"/>">접수중</a></li>
				<li role="presentation"><a href="end" class="dateSelect
				<c:out value="${criteria.dateState eq 'end'?' greenActive':'' }"/>">접수마감</a></li>
			</ul>
		
			<table class="table">
				<tr>
					<th width="300px">공모전명</th>
					<th width="100px">주최사</th>
					<th width="60px">현황</th>
					<th width="100px">진행기간</th>
					<th width="60px">조회수</th>
				</tr>
				<c:forEach items="${list}" var="contest">
					<tr>
						<td>
							<a href="${contest.c_id}" class="title">${contest.c_name }</a>
						</td>				
						<td>${contest.c_host }</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${contest.c_startdate}" var="startdate"/>
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${contest.c_enddate}" var="enddate"/>
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="nowdate" /> 
							
							<fmt:formatDate pattern="yyyy-MM-dd" value="${contest.c_enddate}" var="endd"/>
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowd" /> 
							
							<c:choose>
							    <c:when test="${endd == nowd && enddate > nowdate}">
									D-day
							    </c:when>
				    			<c:when test="${startdate <= nowdate && enddate >= nowdate}">
				       				접수중
				    			</c:when>
							    <c:when test="${startdate > nowdate}">
									접수예정
							    </c:when>
								<c:when test="${enddate<nowdate }">
									접수마감
							    </c:when>
							    <c:otherwise>
									미정
							    </c:otherwise>
							</c:choose>
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${contest.c_startdate}"/>
							&nbsp;~&nbsp;
							<fmt:formatDate pattern="yyyy-MM-dd" value="${contest.c_enddate}"/>
						</td>
						<td>${contest.c_viewcnt }</td>
					</tr>
				</c:forEach>
					
			</table>
			
			<div id="leftS">
				<div class="input-group">
					<select id="c_searchType" name="c_searchType" class="form-control">
						<option value="c_name"
							<c:out value="${criteria.c_searchType eq 'c_name'?'selected':''}"/>>
						공모전명
						</option>
						<option value="c_host"
							<c:out value="${criteria.c_searchType eq 'c_host'?'selected':''}"/>>
						주최사명
						</option>
					</select>
					<span class="input-group-btn">
					</span>
					<input type="text" class="form-control" id="c_keyword" name="c_keyword" value="${criteria.c_keyword}" placeholder="Search for...">
					<span class="input-group-btn">
						<button class="btn btn-default" id ="c_searchBtn">Go!</button>
					</span>
				</div>
			</div>
			
			
			<p style="clear:both;"></p>
			<div align="center">
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
		</section>
	</form>
</div>
	<script>
	var pageForm = $("#pageForm");
		$(".pagination li a").on("click", function(){
			event.preventDefault();
			var targetPage = $(this).attr("href");
			pageForm.find("[name=page]").val(targetPage);
			pageForm.attr("action", "contestList");
			pageForm.attr("method", "get");
			$("<input type='hidden' name ='dateState' value='"+"${criteria.dateState}"+"'>").appendTo(pageForm);
			$("<input type='hidden' name ='category' value='"+"${criteria.category}"+"'>").appendTo(pageForm);
			$("<input type='hidden' name ='c_id' value='"+targetPage+"'>").appendTo(pageForm);
			pageForm.submit();
		});
		
		$(".title").on("click",function(){
			event.preventDefault();
			var c_id = $(this).attr("href");
			var dateCompare = "${criteria.dateState}";
			var categoryCompare = "${criteria.category}";
			
			if(dateCompare==null) {dateCompare="all";}
			if(categoryCompare==null) {categoryCompare="allCategory";}
			
			$("<input type='hidden' name ='c_id' value='"+c_id+"'>").appendTo(pageForm);
			$("<input type='hidden' name ='dateState' value='"+dateCompare+"'>").appendTo(pageForm)
			$("<input type='hidden' name ='category' value='"+categoryCompare+"'>").appendTo(pageForm);
			pageForm.attr("action","contestRead");
			pageForm.attr("method","get");;
			pageForm.submit();
		});

		function searchGo(){
			var dateCompare = "${criteria.dateState}";
			var categoryCompare = "${criteria.category}";
			if(dateCompare==null) {dateCompare="all";}
			if(categoryCompare==null) {categoryCompare="allCategory";}
			$("<input type='hidden' name ='dateState' value='"+dateCompare+"'>").appendTo(pageForm);
			$("<input type='hidden' name ='category' value='"+categoryCompare+"'>").appendTo(pageForm);
			pageForm.attr("action", "contestList");
			pageForm.attr("method", "get");
			$("#page").val(1);
			pageForm.submit();
		}
		
		$("#c_searchBtn").on("click", function(){
			searchGo();
		});

		$("#c_keyword").keypress(function(event){
			if(event.keyCode == 13){
				event.preventDefault();
				searchGo();
			}
		});
		
		$("#newBtn").on("click", function(){
			var categoryCompare = "${criteria.category}";
			var dateCompare = "${criteria.dateState}";
			if(dateCompare==null) {dateCompare="all";}
			if(categoryCompare==null) {categoryCompare="allCategory";}
			$("<input type='hidden' name ='dateState' value='"+dateCompare+"'>").appendTo(pageForm)
			$("<input type='hidden' name ='category' value='"+categoryCompare+"'>").appendTo(pageForm);
			pageForm.attr("action", "contestForm");
			pageForm.attr("method", "get");
			pageForm.submit();
		});		
		
		$(".dateSelect").on("click",function(event){
			event.preventDefault();
			$("#c_keyword").val("");
			var date = $(this).attr("href");
			var categoryCompare = "${criteria.category}";
			if(categoryCompare==null) {categoryCompare="allCategory";}
			$("<input type='hidden' name ='dateState' value='"+date+"'>").appendTo(pageForm);
			$("<input type='hidden' name ='category' value='"+categoryCompare+"'>").appendTo(pageForm);
			pageForm.attr("action","contestList");
			pageForm.attr("method","get");
			$("#page").val(1);
			pageForm.submit();
		});

		$(".c_category").on("click", function(event){
			event.preventDefault();
			$("#c_keyword").val("");
			var category = $(this).attr("href")
			var dateCompare = "${criteria.dateState}";
			if(dateCompare==null) {dateCompare="all";}
			$("<input type='hidden' name ='dateState' value='"+dateCompare+"'>").appendTo(pageForm);
			$("<input type='hidden' name ='category' value='"+category+"'>").appendTo(pageForm);
			pageForm.attr("action", "contestList");
			pageForm.attr("method", "get");
			$("#page").val(1);
			pageForm.submit();
		});
		
	</script>
</body>
</html>