<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>

<style>
#formBox{
	border: 1px solid #2d2d2d;
	height: 500px;
	width: 400px;
	/* margin-top: 100px; */
	margin-top: 50px;
	margin-right: 45px;
	margin-left: 40px;
}
#serch{
	border: 1px solid #2d2d2d;
	height: 50px;
	width: 398px;
}

#idserch{
	border: 1px solid #2d2d2d;
	width: 100px;
	height: 32px;
	float:right;
	margin-right: 30px;
	text-align: center;
	margin-top: 8px;
}

#rc_id{
	height: 30px;
	width: 160px;
	margin-left: 10px;
	margin-top: 8px;
}

#titleid{
	margin-top:30px;
	margin-left: 40px;
}
#ms_name{
	width: 300px;
	height: 50px;
}

#contentid{
	margin-top:30px;
	margin-left: 40px;
}
#ms_content{
width: 300px;
height: 170px;
}

#formBtn{
	
	height: 50px;
	width: 398px;
	margin-top: 50px;
}

#subBtn{
	width: 100px;
	height: 32px;
	margin-left: 150px;
}

#cancell{
width: 100px;
	height: 32px;
	float: right;
	margin-right: 30px;
	
}

/* #t_id{
	display: none;
} */
</style>

</head>
<body>
<div id="formBox">
	
<form id="formid">

<div id = "serch">
	<input type="hidden" name="t_id" id="t_id" value="${MakeDate.t_id}">
	<input type="hidden" name="m_rights" id="m_rights" value="${MakeDate.m_rights}">
	<input type="hidden" name="t_filed" id="t_filed" value="${MakeDate.t_filed}">
	<label>받는 사람</label>
	<input type="text" name="rc_id" id="rc_id" value="${rc_id}">
</div>

<div id="titleid">
	<label>제목</label>
	<br>
	<input type="text" name="ms_name" id="ms_name" value="제목">
</div>

<div id="contentid">
	<label>내용</label>
	<br>
	<textarea name="ms_content" id="ms_content"></textarea>
</div>
</form>

<div id="formBtn">
	<button id="subBtn">전송</button>
	<button id="cancell">취소</button>
</div>
</div>

<script>
var t_id = $("#t_id").val();
var m_rights = $("#m_rights").val();
var t_filed = $("#t_filed").val();

$("#subBtn").on("click",function(){
	event.preventDefault();
		if (confirm("초대하시겠습니까?") == true){ 
		$("#formid").attr("action", "InvitationMake");
		$("#formid").attr("method","post");
		$("#formid").submit();
		}else{   //취소
		    return;
		}
});


$("#cancell").on("click",function(){
	event.preventDefault();
	if (confirm("작성을 취소하실겁니까??") == true){    //확인
		location.href="claimant?t_id="+t_id+"&m_rights="+m_rights+"&t_filed="+t_filed;
	}else{   //취소
	    return;
	}
	
});
</script>
</body>
</html>