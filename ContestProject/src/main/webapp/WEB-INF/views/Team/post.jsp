<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 메세지 함</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>

#messTitle{
	border: 1px solid #ffffff;
	width: 480px;
	height: 45px;
	margin-top: 20px;
	margin-right: 45px;
	margin-left: 40px;
	text-align: center;
	font-size: 30px;
}
#mess{
	border: 1px solid #2d2d2d;
	height: 450px;
	width: 500px;
	/* margin-top: 100px; */
	margin-top: 10px;
	margin-right: 45px;
	margin-left: 40px;
}

.ht_id{
	display: none;
}



#messListBtn{
	border: 1px solid #ffffff;
	width: 480px;
	margin-top:-20px;
	margin-left: 10em;
	
}

#transmit{
	width: 100px;
	height: 28px;
	border: 1px solid #2d2d2d;
	float:left;
	margin-left: 175px;
	text-align: center;
}

#reception{
	width: 100px;
	height: 28px;
	border: 1px solid #2d2d2d;
	float:right;
	margin-right: 10px;
	text-align: center;
}

#MMakeBox{
	border: 1px solid #2d2d2d;
	height: 30px;
	width: 480px;
	margin-top: 5px;
	margin-right: 45px;
	margin-left: 40px;
}

#MassageMake{
	width: 100px;
	height: 28px;
	border: 1px solid #2d2d2d;
	float:right;
	margin-right: 10px;
	text-align: center;
}

#cancell{
	width: 100px;
	height: 32px;
	margin: auto;
}

#paraBoxnone{
	display: none;
}
</style>

</head>
<body>

<div id="messTitle">
메시지List
</div>

<div id="messListBtn">
	<c:if test="${ppctor ==0}">
		<div><h3>나를 초대한 팀</h3></div>
	</c:if>
	
	<c:if test="${ppctor !=0}">
		<div><h3>내가 초대한 회원</h3></div>
	</c:if>
</div>

<div id="mess">

<!--  -->
<!--  -->
<!--  -->
<c:if test="${ppctor ==0}">
<h4>초대한 팀</h4>
</c:if>
<c:if test="${ppctor !=0}">
<h4>초대장 받은 사람</h4>
</c:if>
<c:if test="${count == 0}">
현재 도착한 메시지가 없습니다.
</c:if>
<c:if test="${count > 0}">
<!-- 받은 메시지함 -->
<table class="table table-hover">
	<tr>
	<th></th>
	<th class="ht_id"></th>
	
	<c:if test="${ppctor ==0}">
		<th>보낸 팀장</th>
	</c:if>
	
	<c:if test="${ppctor !=0}">
		<th>받는 회원</th>
	</c:if>
	
	<th>제목</th>
	
	<c:if test="${ppctor ==0}">
		<th>받은 날</th>
	</c:if>
	
	<c:if test="${ppctor !=0}">
		<th>보낸 날</th>
	</c:if>

	<th>읽은 날</th>

	<th>상태</th>
	
	
	</tr>
<c:forEach items="${list}" var="MessageVo">
	<tr>
		<td class="ht_id">
			<input type="text" name="t_id" class="t_id" value="${MessageVo.t_id}">
		</td>
		<td class="hid">${MessageVo.ms_id}</td>
		<td>${MessageVo.u_name}</td>
		<td class="messageRead">${MessageVo.ms_name}</td>
		<td>
		<fmt:formatDate pattern="yyyy-MM-dd" value="${MessageVo.ms_date}"/>
		</td>
		<td class="redacheck">
			<c:if test="${MessageVo.rc_date == null}">
				읽지 않음
			</c:if>
			<c:if test="${MessageVo.rc_date != null}">
				읽음
				<fmt:formatDate pattern="yyyy-MM-dd" value="${MessageVo.rc_date}"/>
			</c:if>	
		</td>
		<td>
			 <c:if test="${MessageVo.rc_date != null}">
				<c:if test="${TeamSize > 0}">
						<c:set var="number" value="0"/>	
						<c:forEach items="${TeamList}" var="TeamList" varStatus="index">
							<c:if test="${MessageVo.t_id == TeamList.t_id}">
								<c:if test="${TeamList.m_rights == 11}">
									보류
									<c:set var="number" value="${number+1}"/>
								</c:if>
								<c:if test="${TeamList.m_rights == 2 || TeamList.m_rights == 4}">
									가입완료
									<c:set var="number" value="${number+1}"/>
								</c:if>
								
								<c:if test="${index.last}">
									<c:if test="${number == 0}">
										<td>거절</td>
									</c:if>
								</c:if>
							</c:if>	
							
						</c:forEach>	
				</c:if>
			 </c:if>
			 <c:if test="${MessageVo.rc_date == null}">
			 	읽지않음
			 </c:if>
		</td>
		
	</tr>
</c:forEach>
</table>
</c:if>


</div>

<div id="paraBoxnone">
	<input type="text" name="returnt_id" class="returnt_id" value="${TeamDate.t_id}">
	<input type="text" name="returnm_rights" class="m_rights" value="${TeamDate.m_rights}">
	<input type="text" name="returnt_filed" class="t_filed" value="${TeamDate.t_filed}">
	
</div>


<div id="cancell">
	<c:if test="${TeamDate.t_id == 0}">
		<button id="exit2" class="btn btn-warning">닫기</button>
	</c:if>
	
	<c:if test="${TeamDate.t_id != 0}">
		<button id="claimant" class="btn btn-warning">돌아가기</button>
	</c:if>
</div>

<script>
var ppctor = ${ppctor};
$(".messageRead").on("click",function(){

	//postPageContorller;
	
	var t_id = $(this).prevAll(".ht_id").children(".t_id").val();
	var ms_id = $(this).prevAll(".hid").text();
	var redacheck = $(this).nextAll(".redacheck").text();
	var i;
	
	redacheck = redacheck.trim();

	console.log(redacheck);
	//rc_date 컨트롤러
	//i = 0 == no read
	//1 = 1 == yes read
	if(redacheck === "읽지 않음")
	{
		//rc_date 컨트롤러
		i = 0; 
	}else{
		i = 1;
	}

	window.location.href="messageRead?ms_id="+ms_id+"&i="+i+"&t_id="+t_id+"&ppctor="+ppctor;
});

$("#claimant").on("click",function(){
	
	 var t_filed = $(".t_filed").val();
	 var m_rights = $(".m_rights").val();
	 var t_id = $(".returnt_id").val();
	 //window.open("post?ppctor="+ppctor,"메세지창","width=500,height=600 scrollbars=yes,")
		location.href="claimant?t_id="+t_id+"&m_rights="+m_rights+"&t_filed="+t_filed;
});

$("#exit2").on("click",function(){
	  window.close();
});

</script>

</body>
</html>