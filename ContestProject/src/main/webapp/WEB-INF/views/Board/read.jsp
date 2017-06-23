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
#replyContainer{
	position: relative;
}
#modDiv {
	width: 300px;
	height: 100px;
	background-color: lightgray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 100;
	box-shadow: 2px 2px 3px black;
	display: none;
}
.reply {
	display: inline-block;
	float: left;
}
.replyNum {
	width: 3em;
}
.replyWriter, .date {
	width: 10em;
}
.replyText{
	width: 20em;
	height: 5em;
	overflow: auto;
	margin-right: 10px;
}
.replyLI {
	margin-bottom: 2em;
	list-style-type: none;
	clear: both;
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
	float: right;
	color: gray;
}
</style>
<script>
   $(document).ready(function(){
      var formObj = $("form[role='form']");
      

		$(".newBtn").on("click", function(){
			formObj.attr("action", "create");
			formObj.attr("method", "get");
			formObj.submit();
		})
		
      $(".btn-warning").on("click",function(){
         formObj.attr("action","modify");
         formObj.attr("method","get");
         formObj.submit();
      });
      
      $(".btn-danger").on("click",function(){
    	  if(confirm("삭제하시겠습니까?")){
    		 var arr = [];
    		 $(".uploadList li").each(function(index){
    			 arr.push($(this).attr("data-src"));
    		 });
    		 
    		 if(arr.length > 0){
    			 $.post("deleteAllFiles",{files:arr}, function(){
    				 
    			 });
    		 }
  	        formObj.attr("action","remove");
  	        formObj.submit();
    	  }
    	  else return false;
      });
      
      $(".list-btn-primary").on("click",function(){
         //self.location = "listAll";
         
         formObj.attr("action","listPage");
         formObj.attr("method","get");
         formObj.submit();
         
        // self.location="listPage?page=${criteria.page}&recordsPerPage=${criteria.recordsPerPage}";
      });
   });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id='templateAttach' type='text/x-handlebars-template'>
	<li data-src="{{fullName}}">
		<a href='{{getLink}}' class="imgClick" style='align=center;'><span class='mailbox-attachment-icon has-img'>
			<img src='{{imgsrc}}' alt='Attachment'style="height:100px;">
		</span></a>
		<div class='mailbox-attachment-info' style='background-color:rgba(178,235,244,0.3);'>
			<a href='{{downloadLink}}' class='mailbox-attachment-name'>{{fileName}}</a>
		</div>
	</li>
</script>
</head>
<body>
<form role="form" method="post">
   <input type="hidden" name="b_id" value="${board.b_id}">
   <input type="hidden" name="page" value="${criteria.page}">
   <input type="hidden" name="recordsPerPage" value="${criteria.recordsPerPage}">
   <input type="hidden" name="menuType" value="${criteria.menuType}">
   <input type="hidden" name="searchType" value="${criteria.searchType}">
   <input type="hidden" name="keyword" value="${criteria.keyword}">
</form>

<div class="popup back" style="display:none;"></div>
<div id="popup_front" class="popup front" style="display:none">
	<img id="popup_img">
</div>

<div style="margin: 10% 15%">

	
	<div class="form-group">
	   ${board.b_title} &nbsp; | &nbsp; ${board.bg_name}
	   <i class="bdate"></a><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.b_regdate}" /></i>
	   
	</div>

	<hr>
	<div class="form-group">
		${board.u_id} &nbsp;&nbsp;&nbsp;&nbsp; 회원등급정보
	</div>
   
	
   <div class="form-group cp" style="padding-bottom: 50px;">
   ${board.b_content}
   </div>
   

    <div class="box-footer">
    	<div>
			<center><label>첨부파일</label></center>
    		<hr style="margin-top: 5px;">
    	</div>
		<ul class="mailbox-attachments clearfix uploadList"></ul>
	</div>

	<span style="float: right">
		<button class="newBtn">글쓰기</button>
		<button class="btn-warning">수정</button>
		<button class="btn-danger">삭제</button>
		<button type="submit" class="list-btn-primary">목록</button>
	</span>

	<div>
		<div class="box-footer">
			댓글 목록 | 조회수 ${board.b_hits }
		</div>
		<div class="box-body">
			<label>작성자: </label>
			<input type="text" name="u_id" id="newReplier" value="${sessionScope.u_id}">
			
			<label>댓글: </label>
			<input type="text" name="bc_content" id="newReplyText">
			<button id="replyAddBtn" class="btn btn-primary">댓글 등록</button>
		</div>
	</div>
	
	<div id="replyContainer">
		<ul class="timeline">
			<li>
			</li>
		</ul>
		
		<div id="modDiv">
			<div class="modal-title"></div>
			<div>
				<input type="text" id="replyText">
			</div>
			<div>
				<button id="replyModBtn">수정</button>
				<button id="replyDelBtn">삭제</button>
				<button id="closeBtn">닫기</button>
			</div>
		</div>
		
		<div class="container">
			<ul class="pagination pagination-sm no-margin">
			</ul>
		</div>
	</div>
</div>
	<script>
	var b_id = ${board.b_id};
	//getAllReplies();
	getPageReplyList(1);
	
	var currentPage = 1;
	
	var template = Handlebars.compile($("#templateAttach").html());

	
	$.getJSON("getAttach/"+b_id, function(list){
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
	
	
	$(".pagination").on("click", "li a", function(){
		event.preventDefault();
		var replyPage = $(this).attr("href");
		getPageReplyList(replyPage);
	});
	
	function getPageReplyList(page) {
		currentPage = page;
		$.getJSON("replies/"+b_id+"/"+page, function(data){
			var str = "";
			$(data.list).each(function(){
				str += "<li data-cid='"+this.bc_id+"' class='replyLI'>"+
				"<span class='reply replyNum'>"+this.bc_id+":</span>"+
				"<span class='reply replyText'>"+this.bc_content+"</span>"+
				"&nbsp;&nbsp;<span class='reply replyWriter'>작성자:"+this.u_id+"&nbsp;&nbsp;&nbsp;</span>"+
				"<span class='reply data'>작성일:"+this.bc_regdate+"</span>"+
				"<button class='btn'>변경</button></li>";
			});
			$(".timeline").html(str);
			printPaging(data.criteria);
		});
	}
	
	function printPaging(criteria) {
		var str = "";
		
		if(criteria.prev) {
			str += "<li><a href='" + (criteria.startPage-1) + "'>" + "<<" + "</a></li>";
		}
		
		for(var i = criteria.startPage; i<=criteria.endPage; i++) {
			var strClass = criteria.page==i ? "class='active'":"";
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}
		if(criteria.next) {
			str += "<li><a href='" + (criteria.startPage-1) + "'>" + ">>" + "</a></li>";
		}
		
		$(".pagination").html(str);
	}
	
	$("#replyModBtn").on("click", function(){
		var cid = $(".modal-title").html();
		var bc_content = $("#replyText").val();
		
		$.ajax({
			type: "put",
			url: "replies/"+cid,
			headers: {
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"
			},
			dataType: "text",
			data: JSON.stringify({
				"bc_content":bc_content
			}),
			success: function(reslut) {
				if(reslut=="SUCCESS"){
					alert("수정되었습니다");
					$("#modDiv").hide("slow");
					//getAllReplies();
					getPageReplyList(currentPage);
				}
			}
		});
	});
	
	$("#closeBtn").on("click", function(){
		$("#modDiv").hide("slow");
	});
	
	$("#replyDelBtn").on("click", function(){
		var ans = confirm("댓글을 삭제하시겠습니까?");
		if (ans == false) return;
		
		var cid = $(".modal-title").html();
		$.ajax({
			type: "delete",
			url: "replies/"+cid,
			success: function(result){
				if(result == "SUCCESS")
					//alert("삭제되었습니다.");
				$("#modDiv").hide("slow");
				//getAllReplies();
				getPageReplyList(currentPage);
			}
		});
	});
	
	$(".timeline").on("click", ".replyLI button", function(){
		var li = $(this).parent();
		var cid = li.attr("data-cid");
		//var replyText = li.text();
		var bc_content = li.find(".replyText").text();
		//alert(cid+":"+replyText);
		$(".modal-title").html(cid);
		$("#replyText").val(bc_content);
		$("#modDiv").show("slow");
		
	});
	
	$("#replyAddBtn").on("click", function(){
		var u_id = $("#newReplier").val();
		var bc_content = $("#newReplyText").val();
		if(u_id.trim() == "") {
			alert("작성자를 입력하세요.");
			return;
		}
		
		if(bc_content.trim() == "") {
			alert("댓글을 입력하세요.");
			return;
		}
		
		$.ajax({
			type:'post',
			url:'replies',
			headers: {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType:'text',
			data:JSON.stringify({
				b_id: b_id,
				u_id: u_id,
				bc_content: bc_content
			}),
			success:function(result, status){
				//alert("HTTP STATUS:"+status);
				//alert("result:"+result);
				if(result == "SUCCESS") {
					//getAllReplies();
					getPageReplyList(1);
				}
			}
		});
	});
	
	</script>
</body>
</html>