<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	.fileDrop{
		width: 90%;
		height: 100px;
		border: 1px dotted gray;
		background-color:rgba(77,88,99,0.3);
		margin: auto;
		margin-top: 65px;
	}
	
	#fs {
		margin-top: 30px;
		display: inline-block;
	}
	
	#fd {
		margin-top: 10px;
	}
	.labelP {
		margin-left: 25px;
		margin-right: 10px;
	}  
	.textBox {
		width: 200px;	
	}
	
	
	.contest-write {
	    margin-bottom: 40px;
	    padding: 35px;
	    border-radius: 20px;
	    background: #f8f8f8;
	}
	.write-list {
	    position: relative;
	}
	ul, ol {
	    list-style: none;
	}
	.write-list > li {
	    position: relative;
	    margin: 7px 0;
	    padding-left: 100px;
	    line-height: 29px;
	}
	.write-list > li .tit {
	    position: absolute;
	    top: 0;
	    left: 0;
	    font-size: 14px;
	    font-weight: 600;
	    color: #111;
	}
	.write-list > li .long {
	    width: 57.4%;
	}
	.ipt {
	    display: inline-block;
	    font-size: 13px;
	    vertical-align: middle;
	    color: #666;
	}
	.short {
		margin-right: -23px;
	}
	.short > input[type=text] {
	    width: 87%;
	}
	.write-list > li .long input[type=text] {
	    width: 95%;
	}
	input[type=text] {
	    padding: 5px;
	    border: 1px solid #ddd;
	    vertical-align: top;
	    outline: none;
	    height: 30px;
	}
	input {
	    font-family: '맑은 고딕','malgun gothic';
	}
	.write-list > li .bold {
	    padding-left: 12px;
	    font-size: 14px;
	    font-weight: 600;
	    color: #111;
	}
	.write-list > li .notice-bg {
	    padding-left: 4px;
	    background: #eee;
	    font-size: 12px;
	}
	.write-kind-area span {
	    display: inline-block;
	    width: 27%;
	}
		.uploadList > li {
			width: 150px;
			margin: 3px;
			text-align: center;
			display: inline-block;
		}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id='template' type='text/x-handlebars-template'>
	<li data-src="{{fullName}}">
		<span class='mailbox-attachment-icon has-img'>
			<img src='{{imgsrc}}' alt='Attachment'style="width: 150px;">
		</span>
		<div class='mailbox-attachment-info' style='background-color:rgba(178,235,244,0.3);'>
			<a href='{{downloadLink}}' class='mailbox-attachment-name'>{{fileName}}</a>
			<a href='{{fullName}}' class='btn btn-default btn-xs pull-right delbtn' style="font-weight:bolder;">X</a>
		</div>
	</li>
</script>

<script id='poster' type='text/x-handlebars-template'>
	<li data-src="{{fullName}}">
		<span class='mailbox-attachment-icon has-img'><img src='{{imgsrc}}' alt='Attachment' style="height:300px; width:200px"></span>
		<div class='mailbox-attachment-info' style='background-color:rgba(178,235,244,0.3);'>
			<a href='{{downloadLink}}' class='mailbox-attachment-name'>{{fileName}}</a>
			<a href='{{fullName}}' class='btn btn-default btn-xs pull-right delbtn' style="font-weight:bolder;">X</a>
		</div>
	</li>
</script>
</head>
<body>
<jsp:include page="../Member/top.jsp"></jsp:include>

<div style="margin: 0% 10%">
	<div id="cnav">
		<form id="contestList" method="get">
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
		</form>
	</div>
	
	<section>
		<form id="modifyForm" method="post">
			<input type="hidden" name="page" value="${criteria.page }">
			<input type="hidden" name="recordsPerPage" value="${criteria.recordsPerPage }">
		
			<p><button class="btn btn-default" id="list" style="float: right;">목록보기</button></p>
			
			<div class="contest-write">
				<ul class="write-list">
					<li>
						<span class="tit">
							공모전명
							<span class="need">*</span>
						</span>
						<span class="ipt long">
						<input type="text" class="" id="c_name" name="c_name" value="${contest.c_name}">
						</span>
					</li>
					<li>
						<span class="tit">
							주최/주간
							<span class="need">*</span>
						</span>
						<span class="ipt short">
							<input type="text" class="textBox" id="c_host" name="c_host" value="${contest.c_host}">
						</span>
						<span class="ipt bold">참가자격
							<span class="need">*</span>
						</span>
						<span class="ipt short">
							<input type="text" class="textBox" id="c_target" name="c_target" value="${contest.c_target}">
						</span>
						<span class="ipt bold">
							홈페이지
							<!--span class="need">*</span-->
						</span>
						<span class="ipt short">
							<input type="text" class="textBox" id="homepage" name="homepage" value="수정시 클릭하세요." readonly>
							<input type="hidden" id="c_homepage" name="c_homepage">
						</span>
					</li>
					<li>
						<input type="hidden" id="c_category" name="c_category">
						<input type="hidden" id="c_prize" name="c_prize">
						<span class="tit">
							공모분야
							<span class="need">*</span>
						</span>
			
						<div class="notice-bg">분야별</div>
						<div class="write-kind-area">
							<span><input type="checkbox" class="categoryCheck" value="논문/리포트"/>논문/리포트</span>
							<span><input type="checkbox" class="categoryCheck" value="기획/아이디어"/>기획/아이디어</span>
							<span><input type="checkbox" class="categoryCheck" value="네이밍/슬로건"/>네이밍/슬로건</span>
							<span><input type="checkbox" class="categoryCheck" value="디자인/캐릭터/만화"/>디자인/캐릭터/만화</span>
							<span><input type="checkbox" class="categoryCheck" value="광고/마케팅"/>광고/마케팅</span>
							<span><input type="checkbox" class="categoryCheck" value="영상/사진"/>영상/사진</span>
							<span><input type="checkbox" class="categoryCheck" value="UCC/SOUND"/>UCC/SOUND</span>
							<span><input type="checkbox" class="categoryCheck" value="예체능"/>	예체능</span>
							<span><input type="checkbox" class="categoryCheck" value="문학/수기"/>문학/수기</span>
							<span><input type="checkbox" class="categoryCheck" value="과학/공학"/>과학/공학</span>
							<span><input type="checkbox" class="categoryCheck" value="게임/소프트웨어"/>게임/소프트웨어</span>
							<span><input type="checkbox" class="categoryCheck" value="건축/건설"/>건축/건설</span>
							<span><input type="checkbox" class="categoryCheck" value="체험/참여"/>체험/참여</span>
							<span><input type="checkbox" class="categoryCheck" value="취업/창업"/>취업/창업</span>
							<span><input type="checkbox" class="categoryCheck" value="경품/이벤트"/>경품/이벤트</span>
							<span><input type="checkbox" class="categoryCheck" value="전시/페스티벌"/>전시/페스티벌</span>
							<span><input type="checkbox" class="categoryCheck" value="장학(금)재단"/>장학(금)재단</span>
							<span><input type="checkbox" class="categoryCheck" value="봉사활동"/>봉사활동</span>
							<span><input type="checkbox" class="categoryCheck" value="해외"/>해외</span>
							<span><input type="checkbox" class="categoryCheck" value="기타"/>기타</span>
							<p class="labelP" id="categoryGuide"></p>
						</div>
						<div class="notice-bg">시상내역</div>
						<div class="write-kind-area">
							<span><input type="radio" name="prizeRadio" class="prizeRadio" value="5천만원이상"> 5천만원이상</span>	
							<span><input type="radio" name="prizeRadio" class="prizeRadio" value="5천만원~3천만원"> 5천만원~3천만원</span>	
							<span><input type="radio" name="prizeRadio" class="prizeRadio" value="3천만원~1천만원"> 3천만원~1천만원</span>	
							<span><input type="radio" name="prizeRadio" class="prizeRadio" value="1천만원이하"> 1천만원이하</span>	
							<span><input type="radio" name="prizeRadio" class="prizeRadio" value="취업특전"> 취업특전</span>	
							<span><input type="radio" name="prizeRadio" class="prizeRadio" value="입사시가산점"> 입사시가산점</span>	
							<span><input type="radio" name="prizeRadio" class="prizeRadio" value="인턴채용"> 인턴채용</span>	
							<span><input type="radio" name="prizeRadio" class="prizeRadio" value="정직원채용"> 정직원채용</span>	
							<span><input type="radio" name="prizeRadio" class="prizeRadio" value="기타"> 기타</span>	
						</div>
					</li>
					<li>
						<span class="tit">
							접수기간
							<span class="need">*</span>
						</span>
						<span class="ipt">
							<input type="datetime-local" class="textBox"  name="c_start" id="c_start" value="${contest.start}">
						~ 
						</span>
						<span class="ipt">
						<input type="datetime-local" class="textBox" name="c_end" id="c_end" value="${contest.end}">
						</span>
					</li>
			
			
					<li>
						<span class="tit">
							공모요강
							<span class="need">*</span>
						</span>
						<textarea class="form-control" id="content" name="c_content">${contest.c_content}</textarea>
					</li>
			
					
					
					<li>
						<span class="tit">포스터 첨부</span>
						<span class="ipt">
							<ul class="mailbox-attachments clearfix posterList"></ul>
							<input class="posterSelect" type="file" name="file" multiple>		
						</span>
					</li>
		
					<li style="margin-top:25px;">
						<span class="tit">
							파일첨부
						</span>
						<span class="ipt">
							<input class="fileSelect" type="file" name="file" multiple/>		
						</span>
					</li>
					
					
					<li style="margin-top:15px;">
						<span class="tit">파일첨부 ( FILE DROP HERE )
						</span>
					</li>
				
					<div class="fileDrop"></div>

					<div class="box-footer" style="margin-top:10px;">
						<ul class="mailbox-attachments clearfix uploadList"></ul>
					</div>
			
					<center>
						<input type="submit" class="btn btn-default stop" value="수정취소" style="margin-top: 20px; margin-bottom: -25px;">
						<input type="submit" class="btn btn-default go" value="수정하기" style="margin-top: 20px; margin-bottom: -25px;">
					</center>
				
					<!--
					<input type="hidden" class="form-control" id="t_id" name="t_id" value="${team.t_id }">
					팀아이디 받아오면 밑에거 지우고 주석처리한걸로 값 이용하세요~
					! -->
					<input type="hidden" class="form-control" id="t_id" name="t_id" value="0"/>
				</ul>
			</div>
		</form>  
	</section>
	
		<div class="modal link-dialog homein" tabindex="-1" style="display: none; padding-right: 15px;">
			<div class="modal-dialog">  
				<div class="modal-content">    
					<div class="modal-header">         
						<button type="button" class="close" id="homeclose" data-dismiss="modal">
							<span>×</span>
						</button>      
						<h4 class="modal-title">수정할 링크 추가</h4>    
					</div>    
					<div class="modal-body">
						<div class="form-group">
							<label>링크에 표시할 내용</label>
							<input class="note-link-text form-control" type="text" id="hurlc">
						</div>
						<div class="form-group">
							<label>이동할 URL</label>
							<input class="note-link-url form-control" type="text" id="hurl" value="http://">
						</div>
						<div class="checkbox">
							<label><input type="checkbox" checked="" id="newWindow"> 새창으로 열기</label>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" id="linkAddBtn" disabled>링크 추가</button>
					</div>  
				</div>
			</div>
		</div>
</div>
	<script>

	var listFor = $("#contestList");
	var addfile = [];
	var arr = [];
	var modifile = [];
	var template = Handlebars.compile($("#template").html());
	var poster = Handlebars.compile($("#poster").html());
	var c_id = ${contest.c_id};
	

	$("#homepage").on("click", function(event){
		event.preventDefault();
		$(".homein").show();			
	});  
	$("#homeclose").on("click", function(event){
		event.preventDefault();
		$(".homein").hide();			
	});  
	$("#hurlc").keyup(function(event){
		var hurlc = $('#hurlc').val();
		var hurl = $('#hurl').val();
		if(hurlc != "" && hurl != ""){
			$("#linkAddBtn").attr('disabled', false);
		}else {
			$("#linkAddBtn").attr('disabled', true);
		}
	});
	$("#hurl").keyup(function(event){
		var hurlc = $('#hurlc').val();
		var hurl = $('#hurl').val();
		if(hurlc != "" && hurl != ""){
			$("#linkAddBtn").attr('disabled', false);
		}else {
			$("#linkAddBtn").attr('disabled', true);
		}
	});
	
	$("#linkAddBtn").on("click", function(event){
		event.preventDefault();
		var hurlc = $('#hurlc').val();
		var hurl = $('#hurl').val();
		var newWindow = $("#newWindow")
		var url 
		if(newWindow.is(":checked")){
			url = "<a href='" + hurl +"' target='_blank' >"+hurlc+"</a>";
			$("#homepage").val("수정완료")
			$("#c_homepage").val(url)
			$(".homein").hide();			
		}
		else {
			url = "<a href='" + hurl +"' target='_self' >"+hurlc+"</a>";
			$("#homepage").val("수정완료")
			$("#c_homepage").val(url)
			$(".homein").hide();			
		}
	});
	
	$("#list").on("click", function(event){
		event.preventDefault();	
		for (var defiles in addfile) {
			$.ajax({
				url: "deleteFile",
				type: "DELETE",
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE"
				},
				dataType: "text",
				data:JSON.stringify({filename:addfile[defiles]}),

				//data: {fileName:small.attr("data-src")},
				success: function(result) {
					if(result == "deleted") {
					}
					else return false;
				}
			});
		}
		var categoryCompare = "${criteria.category}";
		var dateCompare = "${criteria.dateState}";
		if(dateCompare==null) {dateCompare="all";}
		if(categoryCompare==null) {categoryCompare="allCategory";}
		$("<input type='hidden' name='page' value='${criteria.page }''>").appendTo(listFor)
		$("<input type='hidden' name='recordsPerPage' value='${criteria.recordsPerPage }'>").appendTo(listFor)
		$("<input type='hidden' name ='dateState' value='"+dateCompare+"'>").appendTo(listFor)
		$("<input type='hidden' name ='category' value='"+categoryCompare+"'>").appendTo(listFor);
		listFor.attr("action", "contestList");
		listFor.attr("method", "get");
		listFor.submit();
	});
	
	$(".stop").on("click", function(event){
		event.preventDefault();	
		for (var defiles in addfile) {
			$.ajax({
				url: "deleteFile",
				type: "DELETE",
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE"
				},
				dataType: "text",
				data:JSON.stringify({filename:addfile[defiles]}),

				//data: {fileName:small.attr("data-src")},
				success: function(result) {
					if(result == "deleted") {
					}
					else return false;
				}
			});
		}
		var categoryCompare = "${criteria.category}";
		var dateCompare = "${criteria.dateState}";
		if(dateCompare==null) {dateCompare="all";}
		if(categoryCompare==null) {categoryCompare="allCategory";}
		$("<input type='hidden' name='page' value='${criteria.page }''>").appendTo(listFor)
		$("<input type='hidden' name='recordsPerPage' value='${criteria.recordsPerPage }'>").appendTo(listFor)
		$("<input type='hidden' name ='dateState' value='"+dateCompare+"'>").appendTo(listFor)
		$("<input type='hidden' name ='category' value='"+categoryCompare+"'>").appendTo(listFor);
		$("<input type='hidden' name ='c_id' value='"+c_id+"'>").appendTo(listFor);
		listFor.attr("action", "contestRead");
		listFor.attr("method", "get");
		listFor.submit();
	});
	
		$.getJSON("getAttachContest/"+c_id, function(list){
			$(list).each(function(){
				var fileInfo = getFileInfo(this);
				var html = template(fileInfo);
				$(".uploadList").append(html);
			});
			var postType = '${contest.c_poster}';
			if(postType != 'undefined'){
				var fileInfo = getFileInfo(postType);
				var html = poster(fileInfo);
				$(".posterList").append(html);
			}
		});
		
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();	
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;  //배열로 반환
			
			for (var upfiles in files) {
				
				var file = files[upfiles];
				var formData = new FormData();
				formData.append("file", file);
				//console.log(typeof(file));
				
				if(typeof(file) == "number") break;
				$.ajax({
					url: "uploadAjax",
					data: formData,
					dataType:"text",
					processData: false,
					contentType: false,
					type:"POST",
					success: function(data){
						
						var fileInfo = getFileInfo(data);
						
						var html = template(fileInfo);
						
						$(".uploadList").append(html);
						
						var addFullName = $(".uploadList").find('li:last-child').attr("data-src");
						addfile.push(addFullName);
					}
				});
			}
		});
		
		$(".fileSelect").on("change", function(){
			var files = this.files
			
			for (var upfiles in files) {
				
				var file = files[upfiles];
				var formData = new FormData();
				formData.append("file", file);
				//console.log(typeof(file));
				
				if(typeof(file) == "number") break;
				$.ajax({
					url: "uploadAjax",
					data: formData,
					dataType:"text",
					processData: false,
					contentType: false,
					type:"POST",
					success: function(data){
						
						var fileInfo = getFileInfo(data);
						
						var html = template(fileInfo);
						
						$(".uploadList").append(html);
						
						var addFullName = $(".uploadList").find('li:last-child').attr("data-src");
						addfile.push(addFullName);
					}
				});
			}
		});
		

		$(".posterSelect").on("change", function(){
			var files = this.files;

			//console.log(files.length);
			if(files.length != 1) {
				alert("포스터 이미지를 1개만 선택하세요"); 
				return false;
			}
			
			var ext = $(".posterList").children("li").attr("data-src");
			//alert(ext);
			if (ext != null) {
				alert("등록된 포스터를 삭제 후 새로운 포스터를 등록하세요.");
				return false;
			}
			for (var upfiles in files) {
				
				var file = files[upfiles];
				var formData = new FormData();
				formData.append("file", file);
				//console.log(typeof(file));
				
				if(typeof(file) == "number") break;
				$.ajax({
					url: "uploadAjax",
					data: formData,
					dataType:"text",
					processData: false,
					contentType: false,
					type:"POST",
					success: function(data){
						
						var fileInfo = getFileInfo(data);
						
						var html = poster(fileInfo);
						
						$(".posterList").append(html);
						
						var addFullName = $(".posterList").find('li:last-child').attr("data-src");
						addfile.push(addFullName);
					}
				});
			}
		});

		$(".uploadList").on("click", ".delbtn", function(event){
			event.preventDefault();
			var r = $(this);
			r.parent("div").parent("li").remove();
			modifile.push($(this).attr("href"));
		});
		
		$(".posterList").on("click", ".delbtn", function(event){
			event.preventDefault();
			var r = $(this);
			r.parent("div").parent("li").remove();
			modifile.push($(this).attr("href"));
		});

		var categoryVal = '${contest.c_category}';
		var prizeVal = '${contest.c_prize}';
		$(".categoryCheck:checkbox").each(function() {
			if(categoryVal.match($(this).val()))
				$(this).attr("checked", true);
		});
		$(".prizeRadio:radio").each(function() {
			if(prizeVal.match($(this).val()))
				$(this).attr("checked", true);
		});

		$(".go").on("click", function(){
			var c_name = $("#c_name").val();
			var c_category = $('#c_category');
			var c_prize = $('#c_prize');
			var c_host = $("#c_host").val();
			var c_target = $("#c_target").val();
			var c_content = $("#content").val();
			var c_startdate = $("#c_start").val();
			var c_enddate = $("#c_end").val();
			if(c_name.trim() == "") {
				alert("제목을 입력하세요.");
				$("#c_name").focus();
				return false;
			}
			else if(c_host.trim() == "") {
				alert("주최/주관을 입력하세요.");
				$("#c_host").focus();
				return false;
			}
			else if(c_target.trim() == "") {
				alert("참가자격을 입력하세요.");
				$("#c_target").focus();
				return false;
			}
			else if(c_content.trim() == "") {
				alert("내용을 입력하세요.");
				return false;
			}			
			else if(c_startdate.trim() == "") {
				alert("시작일을 입력하세요.");
				return false;
			}
			else if(c_enddate.trim() == "") {
				alert("마감일을 입력하세요.");
				return false;
			}

			$(".categoryCheck:checked").each(function() {
				var test = $(this).val();
				if(c_category.val() == "") {
					c_category.val(test);
				}
				else c_category.val(c_category.val() + ", " + test);
			});
			
			if(!c_category.val()) {			
				$("#categoryGuide").text("해당하는 공모분야를 항목에서 선택하세요.")
				alert("개최할 공모전 관련분야를 선택해 주세요.");
				return false;
			}
			
			c_prize.val($(".prizeRadio:checked").val());
			if(!c_prize.val()) {
				if(!confirm("시상내역 공개하지 않겠습니까?")) return false;
			}
			
			for (var defiles in modifile) {
				$.ajax({
					url: "deleteFile",
					type: "DELETE",
					headers: {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "DELETE"
					},
					dataType: "text",
					data:JSON.stringify({filename:modifile[defiles]}),
					
					//data: {fileName:small.attr("data-src")},
					success: function(result) {
						if(result == "deleted") {
						}
						else return false;
					}
				});
			}
		});
		
		$("#modifyForm").submit(function(event){
			event.preventDefault();
			var form=$(this);
			var str="";
			
			$(".uploadList .delbtn").each(function(index){
				//drag drop 한 만큼 이미지 갯수가 있을텐데 그것만큼 똑같은 함수를 실행!  자동으로 인데스를 준다.
			    str+="<input type='hidden' name='f_name["+index+"]' value='"+$(this).attr("href")+"'> ";
			});	
			str+="<input type='hidden' name='c_poster' value='"+$(".posterList .delbtn").attr("href")+"'> ";
			form.append(str);
			form.get(0).submit();
		});

		$(".c_category").on("click", function(event){
			event.preventDefault();
			for (var defiles in addfile) {
				$.ajax({
					url: "deleteFile",
					type: "DELETE",
					headers: {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "DELETE"
					},
					dataType: "text",
					data:JSON.stringify({filename:addfile[defiles]}),

					//data: {fileName:small.attr("data-src")},
					success: function(result) {
						if(result == "deleted") {
						}
						else return false;
					}
				});
			}
			var category = $(this).attr("href")
			var dateCompare = "${criteria.dateState}";
			if(dateCompare==null) {dateCompare="all";}
			$("<input type='hidden' name ='category' value='"+category+"'>").appendTo(listFor);
			$("<input type='hidden' name ='dateState' value='"+dateCompare+"'>").appendTo(listFor);
			$("#page").val(1);
			listFor.attr("action", "contestList");
			listFor.attr("method", "get");
			listFor.submit();
		});
		
		//내용 에디터 툴
		$(document).ready(function() {
			$('#content').summernote({
				height : 300, // 에디터의 높이 	
				minHeight : null,
				maxHeight : null,
				focus : false,
				lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
			});
				
		});
				
		var postForm = function() {
			var contents =  $('textarea[name="content"]').text($('#content').code());
		}
	</script>
</body>
</html>