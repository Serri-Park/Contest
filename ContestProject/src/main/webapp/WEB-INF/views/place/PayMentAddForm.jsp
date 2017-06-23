<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
           <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<form action="payment" method="post">
<input type="hidden" value="${reservation.pr_id}" name="pr_id">
장소명:${reservation.p_name}<br><br>
예약번호:${reservation.pr_id}<br>
<br>

예약자:${sessionScope.u_id}
<br>
<br>
결제종류:<select name="pay_kind">
<option value="1">체크 카드</option>
<option value="2">신용 카드</option>
<option value="3">계좌이체</option>
<option value="4">휴대폰 결제</option>
</select>

<br>
<input type="submit" value="결제"  onclick="return confirm('결제하시겠습니까?')"><input type="reset" value="리셋" >




</form>
</body>
</html>