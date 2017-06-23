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

#form {
	margin: 5% 10% 10% 20%;
	min-height: 300px;
}
</style>
   <script type="text/javascript">
   	$(document).ready(function(){
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
   
    var data = {"t_id":${t_id}};
				function drawVisualization() {
					$.ajax({
						url : "totalPro",
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
				               data1.addColumn('string', '진행상황');
				               data1.addColumn('number', '진행개수');
				               data1.addRows(data.length);
				               for(var i=0;i<data.length;i++){
				            	  data1.setCell(i, 0, data[i].u_id);  
				            	  data1.setCell(i, 1, data[i].allCnt); 
				               }
							var options = {
								title : '전체 평가 진행 상황',
								vAxis : {title : '',  
									viewWindowMode:'explicit',
			                          viewWindow: {
			                            max:${cnt_work},
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
</head>
<body>
	  
	<div id="form">
	전체 평가 진행 상황 ( ${total_cnt} / ${cnt_eval} )
	 <div id="chart_div" style="width:900px; height: 500px; border:1px solid black;border-radius:4px;"></div>
	
	나의 평가 진행 상황 ( ${cnt_work} / ${cnt_u_work} )
		<table class="table table-hover" style="width:900px;"> 
			<tr>
				<th>팀 이름</th>
				<th>작품명</th>
				<th>채점</th>
			</tr>

			<c:forEach items="${list}" var="pro">
				<tr>
					<td>${pro.t_name }</td>
					<td>${pro.w_name }</td>
					<c:if test="${pro.e_score == 0}">
					<td>미채점</td>
					</c:if>
					<c:if test="${pro.e_score == 1}">
					<td>Fail</td>
					</c:if>
					<c:if test="${pro.e_score == 100}">
					<td>Pass</td>
					</c:if>
				</tr>


			</c:forEach>
		</table>
	</div>
</body>
</html>