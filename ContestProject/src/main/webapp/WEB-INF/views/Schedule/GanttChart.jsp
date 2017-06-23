<!-- Styles -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script type="text/javascript" 
  src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['gantt']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
     var jsonData=$.ajax({
    	 url:"GanttChart",
    	 type:"post",
    	 dataType:"json",
         success:function(obj){
        	 json=obj;
        	 var data = new google.visualization.DataTable();
             data.addColumn('string', 'Task ID');
             data.addColumn('string', 'Task Name');
             data.addColumn('string', 'Resource');
             data.addColumn('date', 'Start Date');
             data.addColumn('date', 'End Date');
             data.addColumn('number', 'Duration');
             data.addColumn('number', 'Percent Complete');
             data.addColumn('string', 'Dependencies');
              for(var i=0;i<json.length;i++){
           	   data.addRow(json[i].s_title,json.color,json[i].u_id,json[i].s_start,json[i].s_end
           	   ,null,json[i].s_going,null)
              } 
        	 
              var options = {
            	        height: 400,
            	        gantt: {
            	          trackHeight: 30
            	        }
            	      };
              var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

              chart.draw(data, options);
         }
     })
     

    

      
    }
  </script>
</head>
<body>
  <div id="chart_div"></div>
</body>
</html>