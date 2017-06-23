<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<%@include file="./bwnav.jsp"%>
<div class="container">
  <h2>주제선정</h2>
  <form method="post" style="margin:10% 10%">
  
    <div class="bw_sub">
      <label for="bw_sub">브레인라이팅 주제:</label>
      <input type="text" class="form-control" id="bw_sub" name="bw_sub">
    </div>
    <div class="bw_timer">
      <label for="bw_timer">타이머 설정</label>
      <select name="bw_timer" id="bw_timer" class="form-control">
      <option value="7">7분</option>
      <option value="6">6분</option>
      <option value="5" selected>5분</option>
      <option value="4">4분</option>
      <option value="3">3분</option>
      </select>
    </div>
    <div class="bw_pagenum">
      <label for="bw_pagenum">참가 인원 수</label>
      <input type="text" class="form-control" id="bw_pagenum" name="bw_pagenum">
    </div>
   	<input type="hidden" value="${t_id}" name="t_id">
    <input type="submit" class="btn btn-default">
  </form>

</div>
</body>
</html>