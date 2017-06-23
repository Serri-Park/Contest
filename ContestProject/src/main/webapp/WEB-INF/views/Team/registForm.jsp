<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
$(document).ready(function(){
	$("#nameChk").click(function(){
		
	    $.ajax({
	    type: "POST",
	    url: "nameCheck",
	    data: ({teamname:$("#t_name").val()}),
	    success: function(data){
		    	if(jQuery.trim(data)=="true"){
		   			$("#checktext").html("<font color=green>생성이 가능합니다</font>");
		   			$("#checktext").show();
		    	}else{
		    		$("#checktext").html("<font color=red>이미 같은 이름의 팀이 있습니다</font>");
		   			$("#checktext").show();
		   			$("input[name=id]").val("");
		   			$("input[name=id]").focus();
		    	}
	    	}
	    });
	});
	
});
</script>
<!-- <style>

 .container{
	border: 1px solid #ffffff;
	width: 40%;
	margin-top: 50px;
	padding: 30px 0;
	background-color: #EAEAEA;
}
 
.form-control{
	width: 90%;
}

#formid{
	width: 70%;
	margin: auto;
}

#t_content{
	width: 500px; !important;
	height: 300px;!important;
}
.cssinput{
	height: 35px;
	margin: 0 10px;
}
.cssdiv{
	display: inline-block;
	margin-top: 10px;"
}
</style> -->
<jsp:include page="../Member/top.jsp"></jsp:include>
</head>
<body>
<section class="container">
	<form action="registTeam" method="POST" id="formid" enctype="multipart/form-data">
		<input type="hidden" name="m_rights" value=${teamDate.conlist}>
		<div class="cssdiv">
			<label>팀 이름</label>
			<input type="text" name="t_name" id="t_name" placeholder="팀 이름을 입력하세요" required class="cssinput">
			<input type="button" id="nameChk" value="중복체크" class="btn btn-default" size="2"> 
		</div>
		
		<p id="checktext"></p>
		<br>
			
		<div class="cssdiv">
			<label>활동지역</label>
			<select name="t_areas" class="cssinput">
				<option value="대구">대구</option>
				<option value="서울">서울</option>
				<option value="광주">광주 </option>
				<option value="부산">부산</option>
				<option value="울산">울산</option>
				<option value="대전">대전</option>
				<option value="제주">제주</option>
			</select>
		</div>
		<br>
		
		<div class="cssdiv">
			<label>활동분야</label>
				<select name="t_filed" class="cssinput">
				<option value="논문/리포트">논문/리포트</option>
				<option value="기획/아이디어">기획/아이디어</option>
				<option value="네이밍/슬로건">네이밍/슬로건</option>
				<option value="디자인/캐릭터/만화">디자인/캐릭터/만화</option>
				<option value="광고/마케팅">광고/마케팅</option>
				<option value="영상/사진">영상/사진</option>
				<option value="UCC/SOUND">UCC/SOUND</option>
				<option value="예체능">예체능</option>
				<option value="문학/수기">문학/수기</option>
				<option value="과학/공학">과학/공학</option>
				<option value="게임/소프트웨어">게임/소프트웨어</option>
				<option value="건축/건설">건축/건설</option>
				<option value="체험/참여">체험/참여</option>
				<option value="취업/창업">취업/창업</option>
				<option value="경품/이벤트">경품/이벤트</option>
				<option value="전시/페스티벌">전시/페스티벌</option>
				<option value="장학(금)재단">장학(금)재단</option>
				<option value="봉사활동">봉사활동</option>
				<option value="해외">해외</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<br>
		
		<div class="cssdiv">
			<label>기타내용</label>
			<textarea name="t_content" id="t_content" class="form-control">
			팀원 모집시 상세내용들을 적어주세요
			ex) 팀에 대한 간략한 소개
				모집 대상에 대한 요약
			</textarea>
		</div>
		<br>
		
		<input type="hidden" name="t_permit" value="1">
		<label>팀 로고</label>
		<input type="file" name="file"><br>
		<input id="submBtn" type="submit" class="btn btn-danger" value="생성">
		<button id="cancell" class="btn btn-warning">취소</button>
	</form>
</section>

<script>
var formid = $("#formid");
$("#cancell").on("click",function(){
		event.preventDefault();
		window.location.href="AllTeamList?Conlist="+${teamDate.conlist};
	});
	
$("#logout").on("click",function(){
	event.preventDefault();
	window.location.href="logout";
});

$("#t_content").on("click",function(){
	event.preventDefault();
	$("#t_content").empty();
})



</script>

</body>
</html>