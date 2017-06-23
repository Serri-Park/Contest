<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
.hn {font-family: 'Hanna';}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   			<link href=" resources/css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
    
    		<script src="resources/js/fullcalendar.js"></script>
    
    	<link href=" resources/css/fullcalendar.css" rel="stylesheet">
    
    		<script src="resources/js/gcal.js"></script>
    		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
 		<link href=" resources/css/fullcalendar.print.css" rel="stylesheet" media='print'> 
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정수정</title>
</head>
<body>
	<%-- <table class="board_view">
		<colgroup>
			<col width="15%">
			<col width="*" />
		</colgroup> --%>
		<div class="modal-header" style="padding: 5px 20px;">
		<hr>
      	<h2 style="margin-left: 10px"><b class="glyphicon glyphicon-check" style="margin-right: 5px"></b>일정상세보기</h2>
     	 <hr>
		<div class="col-sm-10" >
			<div class="form-group">
				<label class="col-sm-3 control-label"><b class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>작성자</label>
				<div class="col-sm-7">
				<input class="form-control" class="form-control" value=${calendar.u_id } readonly="readonly">
				</div>
			</div><br><br>
		<c:if test="${calendar.s_title == '브레인 라이팅' }">
<a href="#">브레인라이팅 하러가기</a>
</c:if>	
			<div class="form-group">
				<label class="col-sm-3 control-label"><b class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>제목</label>
				<div class="col-sm-7">
				<input class="form-control" class="form-control" value=${calendar.s_title } readonly="readonly"	>
				</div>			
			</div><br><br>
			
			<div class="form-group">
				<label class="col-sm-3 control-label"><b class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>시작일정</label>
				<div class="col-xs-5">
				<input type="text" class="form-control" class="form-control" value=${calendar.s_start } name="s_start" id="s_start" readonly="readonly">				
				</div>
			</div><br><br>
		
			<div class="form-group">
				<label class="col-sm-3 control-label"><b class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>종료일정</label>
				<div class="col-sm-7">
				<input class="form-control" class="form-control" value=${calendar.s_end }   name="s_end" id="s_end" readonly="readonly">
				</div>
			</div><br><br>
			<br><br>
			<div class="form-group">
				<label class="col-sm-3 control-label"><b class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>내용</label>
				<div class="col-sm-7">
				<textarea class="form-control" rows="5" readonly="readonly">${calendar.s_content }</textarea>
				</div>	
			</div>
		<br><br>
			<div class="form-group">
				<label class="col-sm-3 control-label"><b class="glyphicon glyphicon-ok" style="margin-right: 5px" ></b>색상</label>
				<div class="form-group">
							<label>Color(일정 색상)</label> <label class="radio-inline"><input
								type="radio" name="s__color" class="radio-inline" value="red"<c:if test="${calendar.s_color eq 'red'}">checked="checked"</c:if>


								checked>빨강&nbsp;</label> <label class="radio-inline"><input
								type="radio" name="s_color" class="radio-inline" readonly
								value="blue"  readonly <c:if test="${calendar.s_color eq 'blue'}">checked="checked"</c:if>/>파랑&nbsp;</label> <label class="radio-inline"><input
								type="radio" name="s_color"   readonly  class="radio-inline"
								value="yellow"<c:if test="${calendar.s_color eq 'purple'}">checked="checked"</c:if>/>보라색</label>
 			</div>
			</div>
			<br><br>
				<div class="form-group">
				<label class="col-sm-3 control-label"><b class="glyphicon glyphicon-ok" style="margin-right: 5px" ></b>종류:</label>
				<div class="form-group">
				<c:if test="${calendar.s_category==1 }">개인일정</c:if>
				<c:if test="${calendar.s_category==2 }">팀일정</c:if>
							</div>
								<div class="form-group">
				<label class="col-sm-3 control-label"><b class="glyphicon glyphicon-ok" style="margin-right: 5px" ></b>진행사항:</label>
				<div class="form-group">
				<c:if test="${calendar.s_going==1 }">진행예정</c:if>
				<c:if test="${calendar.s_going==50 }">진행중</c:if>
				<c:if test="${calendar.s_going==100 }">완료</c:if>
							</div>
											<div class="form-group">

				<div class="form-group" align="center">
			<a href="eventUpdate?s_no=${calendar.s_id }">
	<input type="button" class="btn btn-success" value="수정"></a>
	<a href="deleteEvent?s_no=${calendar.s_id }" class="btn btn-danger"><!-- <input type="button"
		value="삭제"> -->삭제</a>
	<a href="ScheMain?m_id=${u_id }"><input type="button" class="btn btn-warning" value="돌아가기"></a>
	<br />
							</div>
							</div>
							</div>
							
			</div>
			
							
							
							<br><br>
		</div>
			<br><br>
		
ㄴ
	
	</div>
<script>
    $(document)
    .ready(
          function() {
             $('#s_start').datetimepicker({
                mask : '9999-19-39 29:59:59'
             });
             $('#s_end').datetimepicker({
                mask : '9999-19-39 29:59:59'
             });
          });
    </script>
</body>
</html>