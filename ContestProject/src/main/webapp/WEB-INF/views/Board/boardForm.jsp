<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/dist/css/AdminLTE.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="./resources/bootstrap/js/bootstrap.min.js"></script>
   
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
<script src="./resources/summernote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript" src="./resources/js/upload.js"></script>
   
<title>Insert title here</title>
<style>
	.fileDrop{
		width: 90%;
		height: 100px;
		border: 1px dotted gray;
		background-color:rgba(77,88,99,0.3);
		margin: auto;
	}
	
	#fs {
		margin-top: 30px;
		display: inline-block;
	}
	
	#fd {
		margin-top: 10px;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id='template' type='text/x-handlebars-template'>
	<li data-src="{{fullName}}">
		<span class='mailbox-attachment-icon has-img'><img src='{{imgsrc}}' alt='Attachment'style="height:100px;"></span>
		<div class='mailbox-attachment-info' style='background-color:rgba(178,235,244,0.3);'>
			<a href='{{downloadLink}}' class='mailbox-attachment-name'>{{fileName}}</a>
			<a href='{{fullName}}' class='btn btn-default btn-xs pull-right delbtn' style="font-weight:bolder;">X</a>
		</div>
	</li>
</script>
</head>
<body>
<jsp:include page="../Member/top.jsp"></jsp:include>
<div class="container">
<br>
		
	
	<form name="seok" id="registerForm" method="post" style="margin:10% 10%">
	<!-- create 가 get방식으로 불리면 이 페이지가 뜬다 action 이 지정안되있으면 다시 create로 보낸다 같은 create요청인데 방법이 포스트임으로 action에 아무것도 써줄필요 없음!! -->
		<input type="hidden" name="page" value="${criteria.page }">
		<input type="hidden" name="recordsPerPage" value="${criteria.recordsPerPage }">
		<input type="hidden" name="searchType" value="${criteria.searchType}">
		<input type="hidden" name="menuType" value="${criteria.menuType}">
		<input type="hidden" name="keyword" value="${criteria.keyword}">
	
		<button class="btn btn-default" id="list" style="float: right;">목록보기</button>
		
		<div class="form-group">
			<label for="gid">게시판 유형</label> 
			<select class="form-control" id="gid" name="bg_id" style="width: 200px;">
				<option value="0"<c:out value="${criteria.menuType==null?'selected':''}"/>>
					--------------------------
				</option>
				<option value="10"<c:out value="${criteria.menuType eq '10'?'selected':''}"/>>공지사항</option>
				<option value="20"<c:out value="${criteria.menuType eq '20'?'selected':''}"/>>자유게시판</option>
				<option value="30"<c:out value="${criteria.menuType eq '30'?'selected':''}"/>>수기</option>
				<option value="40"<c:out value="${criteria.menuType eq '40'?'selected':''}"/>>Q&A</option>
			</select>	
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" id="title" name="b_title" >
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" id="content" name="b_content"></textarea>
		</div>
		<div class="writer">
			<label for="writer">작성자</label>
			<input type="text" class="form-control" id="writer" name="u_id" value=${u_id }> 
		</div>
		 
		<div class="form-group" id="fs">
			<label for="fileSelect">파일첨부 ( FILE SELECT )</label>
			<input class="fileSelect" type="file" name="file" multiple>		
		</div>
		
		<div class="form-group" id="fd">
		 	<center><label for="fileDrop">파일첨부 ( FILE DROP HERE )</label></center>
			<div class="fileDrop"></div>
		</div>
		  
		<div class="box-footer">
			<ul class="mailbox-attachments clearfix uploadList"></ul>
		</div>
	   
		<center><input type="submit" class="btn btn-default go" value="확인"></center>
	</form>
</div>
	
	<script>
		$(".go").on("click", function(){
			var gid = $("#gid").val();
			var title = $("#title").val();
			var content = $("#content").val();
			if(gid == 0) {
				alert("게사판 유형을 선택하세요.");
				$("#gid").focus();
				return false;
			}
			else if(title.trim() == "") {
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			}
			else if(content.trim() == "") {
				alert("내용을 입력하세요.");
				$("#content").focus();
				return false;
			}
		});

		$("#list").on("click", function(){
				var arr = [];
		   		$(".uploadList li").each(function(index){
		   			arr.push($(this).attr("data-src"));
		   		});
		   		
				for (var defiles in arr) {
					$.ajax({
						url: "deleteFile",
						type: "DELETE",
						headers: {
							"Content-Type": "application/json",
							"X-HTTP-Method-Override": "DELETE"
						},
						dataType: "text",
						data:JSON.stringify({filename:arr[defiles]}),
	
						//data: {fileName:small.attr("data-src")},
						success: function(result) {
							if(result == "deleted") {
							}
							else return false;
						}
					});
				}
				$("form").attr("action", "listPage");
				$("form").attr("method", "get");
				$("form").submit();
		});
	  	
		var template = Handlebars.compile($("#template").html());
	  	
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
						
					}
				});
			}
		});
		
		$(".fileSelect").on("change", function(){
			var files = this.files;
			
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
						
					}
				});
			}
		});
		
		$(".uploadList").on("click", ".delbtn", function(event){
			event.preventDefault();
			var r = $(this);
			$.ajax({
				url: "deleteFile",
				type: "DELETE",
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE"
				},
				dataType: "text",
				data:JSON.stringify({filename:$(this).attr("href")}),

				//data: {fileName:small.attr("data-src")},
				success: function(result) {
					if(result == "deleted") {
						r.parent("div").parent("li").remove();
					}
				}
				
			});
		});
		
		$("#registerForm").submit(function(event){
			event.preventDefault();
			
			var form=$(this);
			var str="";
			
			$(".uploadList .delbtn").each(function(index){
				//drag drop 한 만큼 이미지 갯수가 있을텐데 그것만큼 똑같은 함수를 실행!  자동으로 인데스를 준다.
			    str+="<input type='hidden' name='f_name["+index+"]' value='"+$(this).attr("href")+"'> ";
			});	
			form.append(str);
			form.get(0).submit();
		});
		
		
		//내용 에디터 툴
		$(document).ready(function() {
			$('#content').summernote({
				height : 300, // 에디터의 높이 	
				minHeight : null,
				maxHeight : null,
				focus : true,
				lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
			});
				
		});
				
		var postForm = function() {
			var contents =  $('textarea[name="content"]').text($('#content').code());
		}
	</script>
</body>
</html>