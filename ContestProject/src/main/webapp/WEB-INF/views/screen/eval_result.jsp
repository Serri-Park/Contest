<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<jsp:include page="../screen/top.jsp" flush="false" />
<jsp:include page="../screen/mAside.jsp" flush="false" />
<style>
	#form {    
	margin: 5% 0% 10% 20%;
	min-height: 300px;
	}
</style>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
   
    var data = {"t_id":${t_id}};
				function drawVisualization() {
					$.ajax({
						url : "pfgraph",
						dataType:"json",
						data:JSON.stringify(data),  
						type: "POST",  
						 headers:{
					            "Content-Type":"application/json",
					            "X-HTTP-Method-Override":"POST"
					         },
						success:function(data) {
							var data1;
							console.log(data);
							 data1 = new google.visualization.DataTable();
				               data1.addColumn('string', '팀이름');
				               data1.addColumn('number', 'Pass받은 개수');
				               data1.addRows(data.list.length);
				               for(var i=0;i<data.list.length;i++){
				            	  data1.setCell(i, 0, data.list[i].w_name);  
				            	  data1.setCell(i, 1, data.list[i].w_result); 
				               }
							var options = {
								title : 'Pass or Fail 평가 결과',
								vAxis : {title : '',  
									viewWindowMode:'explicit',
			                          viewWindow: {
			                            max:${m_count},
			                            min:0     }  
			                            },
								
								hAxis : {title : '총 작품개수 : '+data.length},
								seriesType : 'bars',
								series : {1 : {type : 'line'}}
							};  
							console.log(data1);
							var chart = new google.visualization.ComboChart(
									document.getElementById('chart_div'));
							chart.draw(data1, options);
						},
						erorr:function(data){
							alert("실패:"+data);
						}
					});
				}
   	});
	</script>
	<div id="form">
	 <div id="chart_div" style="width:79%;position: reative;float: left; height: 350px; border:1px solid black;border-radius:4px;"></div>
		<table class="table table-hover" style="width:80%;"> 
			<tr>
				<th>팀 이름</th>
				<th>작품명</th>
				<th>결과</th>
			</tr>

			<c:forEach items="${m}" var="m">
				<tr>
					<td>${m.t_name }</td>
					<td>${m.w_name }</td>
					<c:if test="${m.w_result == 0}">
					<td>-</td>
					</c:if>
					<c:if test="${m.w_result != 0}">
					<td>${m.w_result}차 통과</td>
					</c:if>
				</tr>


			</c:forEach>
		</table>
	</div>
</body>
</html>