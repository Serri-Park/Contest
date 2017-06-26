<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>Insert title here</title>
<jsp:include page="../screen/top.jsp" flush="false" />
<jsp:include page="../screen/mAside.jsp" flush="false" />
<style>
* {
	margin: 0;
	padding: 0;
}
@media only screen and (max-width: 1000px) {
    #media {
        display:none;
    }
}
#form {
	margin: 5% 10% 10% 20%;
	min-height: 300px;
}
</style>
   <script type="text/javascript">
  	   google.charts.load('current', {
	      'packages' : [ 'corechart' ]
	   });
	   google.charts.setOnLoadCallback(drawChart);
	   function drawChart() {
	       var data = google.visualization.arrayToDataTable([
        	['�������', '���� �ܰ� �� ���� ����'],
         	['��ǰ ���� ����',   ${cha_cnt}],
        	['�� ������ ����',   ${cnt_eval}],
       	]);
	        var options = {
	               title: '���� �ܰ� �� ���� ����'
	              };
	                   
	                     var chart = new google.visualization.PieChart(document.getElementById('piechart'));

	                     chart.draw(data, options);
	          } 
   </script>    
</head>
<body>
	  
	<div id="form"> 
	 <div id="piechart" style="width:600px;position: reative;float: left; height: 350px; border:1px solid black;border-radius:4px;"></div>
	<div id ="media" style="padding:8% 3%;width:250px; height: 350px;position: reative;float: left;border:1px solid black;border-radius:4px;">
	��ü �� ���� ��Ȳ ( ${cnt_eval} / ${total_cnt} )<br><br>
	�ɻ����� �� �����Ȳ<br>
		<div style="margin-left:20px;height: 350px; font-size:20px;position: reative;float: left; ">
		<c:forEach items="${member}" var="m">
				${m.u_id}<br>
		</c:forEach>
		</div>
		<div style="height: 350px; font-size:20px;position: reative;float: left; ">	
			<c:forEach items="${allCnt}" var="allCnt">
					 : ( ${allCnt.allCnt} / ${cnt_work} )<br>
				</c:forEach>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
		<table class="table table-hover" style="width:80%;"> 
		���� �� ���� ��Ȳ ( ${cnt_u_work} / ${cnt_work} )
			<tr>
				<th>�� �̸�</th>
				<th>��ǰ��</th>
				<th>ä��</th>
			</tr>

			<c:forEach items="${list}" var="pro">
				<tr>
					<td>${pro.t_name }</td>
					<td>${pro.w_name }</td>
						<c:if test="${ep_how == 'Pass or Fail ���' }">
							<c:if test="${pro.e_score == 0}">
								<td>��ä��</td>
								</c:if>
								<c:if test="${pro.e_score == 1}">
								<td>Fail</td>
								</c:if>
								<c:if test="${pro.e_score == 100}">
								<td>Pass</td>
							</c:if>
						</c:if>
						<c:if test="${ep_how == '��ä�� ���' }">
								<c:if test="${pro.e_score == 0}">
								<td>��ä��</td>
								</c:if>
								<c:if test="${pro.e_score != 0}">
							<td>���� : ${pro.te_score}</td>
							</c:if>
						</c:if>
				</tr>


			</c:forEach>
		</table>
	</div>
</body>
</html>