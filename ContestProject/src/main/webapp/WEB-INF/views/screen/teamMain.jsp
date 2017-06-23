<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<jsp:include page="../Member/top.jsp" flush="false" />
</head>
<body>
	<form>
		<input type="hidden" name="t_id" value="${t_id}">
	</form>
	<div style="margin:10% 10%">
	<c:if test="${manage.ep_how==null}">
	<button class="btn btn-default" id="evalPage">평가단계설정</button>
	</c:if>
	<c:if test="${manage.ep_how!=null}">
	<button class="btn btn-default" id="ePageModify">평가단계수정</button>
	<button class="btn btn-default" id="evallist">평가지작성</button> 

	<button class="btn btn-default" id="manager">평가매니저</button>
		</c:if>
	</div>
	<script>
		$("#manager").on("click", function() {
			var str ="<input type='hidden' name='r_id' value='0'>";
			$("form").append(str);
			$("form").attr("action", "manager");
			$("form").attr("method", "get");
			$("form").submit();
		});
		$("#ePageModify").on("click", function() {
			$("form").attr("action", "ePageModify");
			$("form").attr("method", "get");
			$("form").submit();
		});
		$("#evalPage").on("click", function(){
			$("form").attr("action", "evalPage");
			$("form").attr("method", "get");
			$("form").submit();
		})
	</script>
</body>
</html>