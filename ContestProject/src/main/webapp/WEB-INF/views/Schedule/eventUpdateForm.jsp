<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src=" resources/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src=" resources/js/moment.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src=" resources/js/jquery.datetimepicker.js"></script>

<link href=" resources/css/jquery.datetimepicker.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src=" resources/js/jquery.datetimepicker.js"></script>

<link href=" resources/css/jquery.datetimepicker.css" rel="stylesheet"
	type="text/css" />
</head>
<script>
	$(document).ready(function() {
		$("#save").on("click", function() {
			formObj.attr("action", "eventUpdate");
			formObj.submit();
		});
	});
</script>
<body>

	<form action="eventUpdate" method="post">
		<input type="hidden" value="${calendar.s_id }" name="s_id">
		<input type="hidden" value="${calendar.u_id }" name="u_id">

		<div class="modal-header" style="padding: 5px 20px;">
			<hr>
			<h2 style="margin-left: 10px">
				<b class="glyphicon glyphicon-check" style="margin-right: 5px"></b>일정수정
			</h2>
			<hr>
			<div class="col-sm-10">
				<div class="form-group">
					<label class="col-sm-3 control-label"><b
						class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>작성자</label>
					<div class="col-sm-7">
						<input class="form-control" class="form-control"
							value=${calendar.u_id } readonly="readonly">
					</div>
				</div>
				<br> <br>

				<div class="form-group">
					<label class="col-sm-3 control-label"><b
						class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>제목</label>
					<div class="col-sm-7">
						<input class="form-control" class="form-control"
							value=${calendar.s_title } name="s_title">
					</div>
				</div>
				<br> <br>

				<div class="form-group">
					<label class="col-sm-3 control-label"><b
						class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>시작일정</label>
					<div class="col-sm-7">
						<input type="date" class="form-control"
							value=${calendar.s_start } name="s_start">
						<!-- <input type="text" id="s_start" name="s_start" class="form-control" id="ex5">		 -->
					</div>
				</div>
				<br> <br>

				<div class="form-group">
					<label class="col-sm-3 control-label"><b
						class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>종료일정</label>
					<div class="col-sm-7">
						<input type="date" class="form-control" value=${calendar.s_end }
							name="s_end">
						<!-- <input type="text" id="s_end" name="s_end" class="form-control" id="ex5"> -->
					</div>
				</div>
				<br> <br>

				<div class="form-group">
					<label class="col-sm-3 control-label"><b
						class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>내용</label>
					<div class="col-sm-7">
						<textarea id="summernote" name="p_Content"></textarea>
					</div>
				</div>
				<br> <br>

				<div class="form-group">
					<label class="col-sm-3 control-label"><b
						class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>색상</label> <label>Color(일정
						색상)</label> <label class="radio-inline"><input type="radio"
						name="s_color" class="radio-inline" value="red"
						<c:if test="${calendar.s_color eq 'red'}">checked="checked"</c:if>/


								checked>빨강&nbsp;</label>
					<label class="radio-inline"><input type="radio"
						name="s_color" class="radio-inline" readonly value="blue"
						readonly
						<c:if test="${calendar.s_color eq 'blue'}">checked="checked"</c:if> />파랑&nbsp;</label>
					<label class="radio-inline"><input type="radio"
						name="s_color" readonly class="radio-inline" value="purple"
						<c:if test="${calendar.s_color eq 'purple'}">checked="checked"</c:if> />보라색</label>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"><b
						class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>종류:</label>
					<div class="form-group">
						<select name="s_category">
							<option value="1"
								<c:out value="${calendar.s_category eq '1'?'selected':''}"/>>
								개인일정</option>

						<option value="2"
								<c:out value="${calendar.s_category eq '2'?'selected':''}"/>>
								팀일정</option>

						
						</select>
						
					</div>
					<br> <br>
					<div class="form-group">
						<label class="col-sm-3 control-label"><b
							class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>진행사항:</label>
						<div class="form-group"></div>
						<select name="s_going">
							<option value="1"
								<c:out value="${calendar.s_going eq '0'?'selected':''}"/>>
								진행지연</option>

						<option value="50"
								<c:out value="${calendar.s_going eq '50'?'selected':''}"/>>
								진행중</option>
<option value="100"
								<c:out value="${calendar.s_going eq '100'?'selected':''}"/>>
								완료</option>
						
						</select>
					</div>
				</div>

			</div>
		</div>
		</div>
		<br> <br>

		<%-- <table class="board_view">
		<colgroup>
			<col width="15%">
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">작성자</th>
				<td>${calendar.m_id }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<input type="text" name="s_title" value="${calendar.s_title} ">
			</tr>
			<tr>
				<th scope="row">일정 기간</th>
				<input type="text" id="s_start" name="s_start" class="form-control" id="ex5">
				<input type="text" id="s_end" name="s_end" class="form-control" id="ex5">
			
				<br/>
			</tr>

			<tr>
				<input type="color" name="s_color" value="${calendar.s_color }">
			</tr>
		</tbody>
	</table>
 --%>
		<div class="form-group" style="margin-left: 200px">
			<div class="col-sm-12 text center">
				<button class="btn btn-success" type="submit" id="save">수정완료</button>
				<button class="btn btn-danger" type="reset" id="reset">수정취소</button>
				<a href="s_Main"><button class="btn btn-warning" type="button">리스트</buteton></a>
			</div>
		</div>


	</form>


	<script>
		$(document).ready(function() {
			$('#s_start').datetimepicker({
				mask : '9999-19-39'
			});
			$('#s_end').datetimepicker({
				mask : '9999-19-39'
			});
		});
	</script>
</body>
</html>