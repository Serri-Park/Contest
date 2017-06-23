<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
<script src="./resources/summernote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript" src="./resources/js/upload.js"></script>

<title>Insert title here</title>
	<style>
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
		.poster{
			float: left;
		}
		.cinfo{
		    padding-left: 190px;
		}
		.cd-info-list {
		    padding-top: 12px;
		    border-top: 1px solid #ccc;
			border-bottom: 1px solid #ccc;
		}
		.cd-info-list li {
		    position: relative;
		    min-height: 31px;
		    margin: 8px 0;
		    padding-left: 100px;
		    font-size: 14px;
		    color: #666;
		    line-height: 20px;
		}
		.cd-info-list li .tit {
		    position: absolute;
		    top: 0;
		    left: 0;
		    font-weight: 600;
		    color: #111;
		}
		.article {
		    margin-top: 40px;
		}
		.article .tit {
		    margin-bottom: 24px;
		    padding-bottom: 10px;
		    border-bottom: 1px solid #ccc;
		    font-size: 18px;
		    font-weight: 600;
		    color: #111;
		}
		.article .content {
		    font-size: 14px;
		    color: #666;
		    line-height: 25px;
		}
		.cname {
		    font-size: 23px;
		    font-weight: 600;
		    color: #333;
		    line-height: 25px;
		}
		.title {
		    position: relative;
		    margin-bottom: 30px;
		}
		.box-footer{
			margin: 10px 0px;
		}
		.popup {
			position: absolute;
		}
		.back {
			background-color: gray;
			opacity: 0.5;
			width: 100%;
			height: 300%;
			overflow: hidden;
			z-index: 1101;
		}
		.front {
			z-index: 1110;
			opacity: 1;
			border: 1px;
			margin: auto;
		}
		.show {
			position: relative;
			max-width: 1200px;
			max-height: 800px;
			overflow: auto;
		}
		.cp {
			padding-top: 30px;
			padding-bottom: 50px;
		}
		.bdate {
			position: absolute;
		    top: 10px;
		    right: 0;
		    font-size: 13px;
		    color: #666;
		    letter-spacing: 0;
			color: gray;
		}
		.contest-detail {
		    position: relative;
		    margin-bottom: 20px;
		    padding: 35px;
		    border-radius: 20px;
		    background: #f8f8f8;
		}
		ul, ol {
		    list-style: none;
		}
		.uploadList > li {
			width: 150px;
			margin: 5px;
			text-align: center;
			display: inline-block;
		}
	</style>
	
	<script>
	   $(document).ready(function(){
	      var formObj = $("#readForm");
	      
			$(".newBtn").on("click", function(){
				formObj.attr("action", "contestForm");
				formObj.attr("method", "get");
				formObj.submit();
			})
			
			$(".btn-warning").on("click",function(){
				formObj.attr("action","contestModify");
				formObj.attr("method","get");
				formObj.submit();
			});
			
			      
			$(".btn-danger").on("click",function(){
				if(confirm("삭제하시겠습니까?")){
					var arr = [];
					var posterArr = [];
					$(".uploadList li").each(function(index){
						arr.push($(this).attr("data-src"));
					});
					if(arr.length > 0){
						$.post("deleteAllFiles",{files:arr}, function(){
						 
						});
					}
					posterArr.push('${contest.c_poster }');
					if(posterArr.length > 0){
						$.post("deleteAllFiles",{files:posterArr}, function(){
							
						});
					}
				    formObj.attr("action","contestRemove");
				    formObj.submit();
				}
				else return false;
			});
	      
			$(".list-btn-primary").on("click",function(){
				formObj.attr("action","contestList");
				formObj.attr("method","get");
				formObj.submit();
			});

			$(".c_category").on("click", function(event){
				event.preventDefault();
				var category = $(this).attr("href")
				$("#c_keyword").val("");
				$("#category").val(category);
				formObj.attr("action", "contestList");
				formObj.attr("method", "get");
				$("#page").val(1);
				formObj.submit();
			});
		});	
	</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id='templateAttach' type='text/x-handlebars-template'>
	<li data-src="{{fullName}}">
		<a href='{{getLink}}' class="imgClick" style='align=center;'>
			<span class='mailbox-attachment-icon has-img'>
			<img src='{{imgsrc}}' alt='Attachment'style="width: 150px;">
			</span>
		</a>
		<div class='mailbox-attachment-info' style='background-color:rgba(178,235,244,0.3);'>
			<a href='{{downloadLink}}' class='mailbox-attachment-name'>{{fileName}}</a>
		</div>
	</li>
</script>
</head>
<body>
<jsp:include page="../Member/top.jsp"></jsp:include>
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
	
	<section>
		<form id="readForm" method="get">
			<input type="hidden" name="c_id" value="${contest.c_id}">
			<input type="hidden" name="page" value="${criteria.page}">
			<input type="hidden" name="recordsPerPage" value="${criteria.recordsPerPage}">
			<input type="hidden" name="category" id="category" value="${criteria.category}">
			<input type="hidden" name="dateState" value="${criteria.dateState}">
			<input type="hidden" name="c_searchType" value="${criteria.c_searchType}">
			<input type="hidden" name="c_keyword" id="c_keyword" value="${criteria.c_keyword}">
		</form>
		
		<div class="popup back" style="display:none;"></div>
		<div id="popup_front" class="popup front" style="display:none">
			<img id="popup_img">
		</div>
		
		<div class="contest-detail">
			<p style="margin-bottom: 30px;"><button class="list-btn-primary" id="list" style="float: right;">목록보기</button></p>
			<div class="title">
				<h5 class="cname">${contest.c_name}</h5>
				<i class="bdate">조회수 : ${contest.c_viewcnt } &nbsp; | &nbsp; <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${contest.c_regdate}" /></i>
			   
			</div>
		
			<hr>
			<div class="poster">
				<a herf="" target='_blank' id="posterLink">
					<img src="displayFile?fileName=${contest.c_poster }" alt='공개된 포스터가 없습니다.' style="height:270px; width:200px">
				</a>
			</div>
			<div class="cinfo">
				<ul class="cd-info-list">
					<li><span class="tit">응모 분야</span>${contest.c_category }</li>
					<li><span class="tit">주최/주관</span>${contest.c_host }</li>
					<li><span class="tit">참가자격</span>${contest.c_target }</li>
					<li><span class="tit">접수기간</span>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${contest.c_startdate}"/>
						&nbsp;~&nbsp;
						<fmt:formatDate pattern="yyyy-MM-dd" value="${contest.c_enddate}"/>
					</li>
					<li>
						<span class="tit">시상내역</span>${contest.c_prize }
						<c:if test="${contest.c_prize == ''}"> ― </c:if>
					</li>
					<li>
						<span class="tit">홈페이지</span>${contest.c_homepage }
						<c:if test="${contest.c_homepage == ''}"> ― </c:if>
					</li>
				</ul>
			</div>
			<div class="article" style="padding-bottom: 50px;">
				<div class="tit">공모전 공모요강</div>
				<div class="content">${contest.c_content}</div>
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${contest.c_startdate}" var="startdate" /> <fmt:formatDate
									pattern="yyyy-MM-dd HH:mm:ss" value="${contest.c_enddate}"
									var="enddate" /> <jsp:useBean id="now" class="java.util.Date" />
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"
									var="nowdate" /> <fmt:formatDate pattern="yyyy-MM-dd"
									value="${contest.c_enddate}" var="endd" /> <fmt:formatDate
									value="${now}" pattern="yyyy-MM-dd" var="nowd" /> <c:choose>
									<c:when test="${endd == nowd && enddate > nowdate}">
									D-day
							    </c:when>
									<c:when test="${startdate <= nowdate && enddate >= nowdate}">
									
				       				<a href="submit?c_id=${contest.c_id }&t_id=${t_id}"><button  class="submit">접수</button></a>
				    			</c:when>
									<c:when test="${startdate > nowdate}">
									
							    </c:when>
									<c:when test="${enddate<nowdate }">
									
							    </c:when>
									<c:otherwise>
									
							    </c:otherwise>
								</c:choose>
			</div>
		   
		
		    <div class="box-footer">
		    	<div>
					<center><label>첨부파일</label></center>
		    		<hr style="margin-top: 5px;">
		    	</div>
				<ul class="uploadList"></ul>
			</div>
		
			<span style="float: right; margin: 45px -5">
				<button class="newBtn">글쓰기</button>
				<c:if test="${contest.t_id eq t_id }">
				<button class="btn-warning">수정</button>
				<button class="btn-danger">삭제</button>
				</c:if>
				<button type="submit" class="list-btn-primary">목록</button>
				
			</span>
		</div>
	</section>
</div>
	<script>
	var c_id = ${contest.c_id};
	var notImg = $("#posterLink").children('img').attr("src");
	var poster = '${contest.c_poster }'
	var posterOrg = poster.substr(0,12) + poster.substr(12+"thumbNail_".length);
	$("#posterLink").on("click", function(event){
		if(!notImg.match('undefined'))
			if(confirm("원본 이미지를 보시겠습니까?"))
				$(this).attr("href", 'displayFile?fileName='+posterOrg)
	});
	
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("getAttachContest/"+c_id, function(list){
		$(list).each(function(){
			var fileInfo = getFileInfo(this);
			var html = template(fileInfo);
			$(".uploadList").append(html);
		});
	});

	$(".uploadList").on("click", ".imgClick", function(event){
		var fileLink = $(this).attr("href");
		if(checkImageType(fileLink)) {
			event.preventDefault();
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			$(".popup").show("slow");
			imgTag.addClass("show");
		}
	});
	
	$("#popup_img").on("click", function(){
        $(".popup").hide("slow");
	});
	</script>
</body>
</html>