<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
div{

}



#conttop{
	height: 60px;
	width: 400px;
	margin-top: 40px;
	margin-right: 45px;
	margin-left: 40px;
	border: 1px solid #2d2d2d;
	
}

#sand_id_name{
	width:198px;
	height: 28px;
	float:left;
	border: 1px solid #2d2d2d;
}

#ms_date{
	width:198px;
	height: 28px;
	float:right;
	border: 1px solid #2d2d2d;
}

#ms_name{
	width: 399px;
	height: 28px;
	margin-top: 30px;
	border: 1px solid #2d2d2d;
}

#mess{
	
	height: 400px;
	width: 400px;
	/* margin-top: 100px; */
	margin-top: 10px;
	margin-right: 45px;
	margin-left: 40px;
	border: 1px solid #2d2d2d;
}

#masBtn{
	
	width: 400px;
	height: 30px;
	margin-top: 10px;
	margin-right: 45px;
	margin-left: 40px;
	
}

#messList{
	width: 100px;
	height: 28px;
	border: 1px solid #2d2d2d;
	margin-left: 150px;
	text-align: center;
}
#messDele{
	width: 100px;
	height: 28px;
	border: 1px solid #2d2d2d;
	float: right;
	margin-right: 25px;
	margin-top: -30px;
	text-align: center;
}


#Remess{
	width: 100px;
	height: 28px;
	border: 1px solid #2d2d2d;
	float: right;
	margin-right: 25px;
	margin-top: -30px;
	text-align: center;
}


#answer{
	width: 100px;
	height: 28px;
	border: 1px solid #2d2d2d;
	float: left;
	margin-left: 25px;
	text-align: center;
}


.hidens{
	display: none;
}

</style>
</head>
<body>
<form id="formId" class="hidens">

</form>
<div id="conttop">
<span id="t_id" class="hidens">${Inteam.t_id}</span>
<span id="m_rights" class="hidens">${Inteam.m_rights}</span>
<span id="Rrc_id" class="hidens">${content.rc_id}</span>
<span id="Rms_id" class="hidens">${content.ms_id}</span>
<span id="Rsend_id" class="hidens">${content.send_id}</span>
<div id="sand_id_name">
<span>보낸사람 :</span>
${content.u_name}
</div>

<div id="ms_date">
<span>받은 날짜 :</span>
${content.ms_date}
</div>

<div id="ms_name">
<span>제목 :</span>
${content.ms_name}
</div>

</div>
<div id="mess">
${content.ms_content}
</div>

<diV id="masBtn">

<c:if test="${content.send_id != u_id}">
<div id="Ok">승락</div>
</c:if>

<div id="messList">목록으로</div>

<c:if test="${content.send_id != u_id}">
<div id="No">거절</div>
</c:if>

</diV>

<script>
	var t_id = $("#t_id").text();
	var m_rights = $("#m_rights").text();
	$("#Ok").on("click",function(){
		//승락
		if (confirm("승락 하십니까?") == true){    //확인
			event.preventDefault();
			//신청서가 들어가는 팀
			 $.ajax({
				type:'post',
				url:'userOk',
				data: {u_id:u_id,t_id:t_id},
				success : function(result){
					console.log("result: "+result);
					if(result == 'SUCCESS'){
						alert("수락하셨습니다.");
						window.location.href="post?ppctor="+ppctor;
					}
				}
			});
			
			
		}else{   //취소
		    return;
		}
	});
	
	
	//거절
	$("#No").on("click",function(){
		if(confirm("거절하실겁니까?") == true){
			//가입신청취소
			$(".cancell").on("click", function(){
				event.preventDefault();
				if (confirm("정말 거절하시겠습니까??") == true){  
					$.ajax({
					type:'post',
					url:'userNo',
					data: {t_id:t_id},
					success : function(result){
						console.log("result: "+result);
						if(result == 'SUCCESS'){
							alert("거절하셨습니다.");
							window.location.href="post?ppctor="+ppctor;
						}
					}
					});
				}else{   //취소
				    return;
				}
			});

		}else{
			return;
		}
	});
	
	
	//목록으로
	$("#messList").on("click",function(){
		var ppctor = ${ppctor};
		window.location.href="post?ppctor="+ppctor;
	});

</script>

</body>
</html>