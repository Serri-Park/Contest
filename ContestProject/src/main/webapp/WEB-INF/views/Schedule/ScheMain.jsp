<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>


<script>
window.opener.location.reload();
window.close();


</script>

<link type="text/css" href="resources/css/style1.css" rel="stylesheet" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="http://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<link href=" resources/css/jquery.datetimepicker.css" rel="stylesheet"
	type="text/css" />

<link rel='stylesheet' type='text/css' href='http://arshaw.com/css/main.css?6' />
<link rel='stylesheet' type='text/css' href='http://arshaw.com/css/fullcalendar.css?3' />

<link rel='stylesheet' type='text/css' href='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.css' />



<link rel="stylesheet"	
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link href=" resources/css/fullcalendar.print.css" rel="stylesheet"
	media='print'>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	
	<style>	
	
	.fc-day-header {
  background-color:skyblue;
	
	td .fc-day .fc-sat div .fc-day-number{
	color:blue; 
	}
	</style>
	<style type="text/css">
   

    #calendar {
        max-width: 900px;
        margin: 0 auto;
    }
    
    
</style>

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-1.10.2.min.js'></script>
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-ui-1.10.3.custom.min.js'></script>
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.min.js'></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	

<script src=" resources/js/moment.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<script src="resources/js/gcal.js"></script>

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {

	$(function(){
		var today=new Date();
	   var year=today.getFullYear();
		var month=today.getMonth()+1;
	   var day=today.getDate();
	   var todays=year+month+day;
	   if (("" + month).length == 1) { month = "0" + month; }
       if (("" + day).length   == 1) { day   = "0" + day;   }
	   console.log("zz", year + month + day);
		   
		
		});
		
		 
		$('#calendar').fullCalendar({
			customButtons: {
		        myCustomButton: { 
		            text: '일정 등록',
		            click: function() {
		            	$('#calendarwritemodal').modal("show");
		            }
		        }
		    },
		
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,list'
			},
			defaultDate: new Date(),
			navLinks: true, 
			selectable: true,
			selectHelper: true,
 			 select: function(start, end, allDay) {
		        
		            startDate = moment(start).format('YYYY-MM-DD');
		            endDate = moment(end).format('YYYY-MM-DD hh:mm');
		            
		           	var year = endDate.substr(0,4);
	            	  
            	   	var month = endDate.substr(5,2);
            	   	month = Number(month)-1;
            	   	var day = endDate.substr(8,2);
            	   	day = Number(day);
            	   	
            	    console.log('zz'+day);
            		
        		    
            	   
		             var now=new Date();
		             
            	   	var eDate = new Date(year,	month,day);
            	
            	   	endDate = moment(eDate).format('YYYY-MM-DD');
            	   	console.log(endDate);
		            $('#s_start').val(startDate);
		            $('#s_end').val(endDate);
		              $('#calendarwritemodal').modal("show");
		             
		       
		             
		          
		           $('#calendar').fullCalendar('unselect');  
		      },
		       
			      
			editable: true,
			eventLimit: true, 
		 	events: function(start, end, callback) {
				$.ajax({
				    url: 'event',
				    dataType: 'json',
				    success: function(data, text, request) {
				    	var newData = $.map(data, function (obj) {
				    		
				    		
				    		var today=new Date();
				    		if(today>end){
				    		 alert("z");	
				    		}
				    		
				    		
				    		return {
				    			// key값 적어주시면되여 켈린더에서 쓰실 값
				    			title: obj.s_title,
				    			start: obj.s_start,
				    			color: obj.s_color,
				    			end: obj.s_end,
				    			s_id:obj.s_id,
				    			c_id:obj.c_id,
				    			c_name:obj.c_name
				    			
				    		};
				    	
				    	});
				    	
				    	callback(newData);
				    	
				    }
				});
				
	        },
	       

	       
		
			
			buttonText: {
				prev: "prev",
				next: "next",
				prevYear: "prev year",
				nextYear: "next year",
				year: 'year', // TODO: locale files need to specify this
				today: 'today',
				month: 'month',
				week: 'week',
				day: 'day',
				add : "asdasd"
			
			},
			
		
			 

	
	         droppable: true, // this allows things to be dropped onto the calendar
	         drop: function(date) {            

	        	 var date1 = date.format("YYYY-MM-DD");
	 			var date2 = new Date(date);
	 			var result = new Date();
				
	 			
	 			var titles = $(this).text();
	 			

	            $.ajax({
	               url: 'insertScheduleDrop',
	               data:{
	                  title: titles,
	                  start: date1,
	                  end : moment(date2).format("YYYY-MM-DD"),
	                  
	               },
	               dataType:'text',
	               type: 'POST',
	               
	
	               success: function(data,start,end) {
	           
	            
	            	
		       		  
		            		   $('#calendarwritemodal').modal("show");
		            		
			            	   	startDate = moment(date).format('YYYY-MM-DD');
			            	   	
			            	   	var year = startDate.substr(0,4);
			            	  
			            	   	var month = startDate.substr(5,2);
			            	  
			            	   	month = Number(month)-1;
			            	   	var day = startDate.substr(8,2);
			            	   	//day = Number(day)-1;
			            		
			            	  
			            	   	
			            	   	var eDate = new Date(year,month,day);
			            	   
					     
			            	   	startDate = moment(eDate).format('YYYY-MM-DD');
					     
					  
					            
					          endDate = moment(end).format('YYYY-MM-DD ');
					            
					            $('#s_start').val(startDate);
					            $('#s_end').val(endDate);
			            	   var isrtTitle = $('#modal-input').val(titles);
		   		   
		   		           $('#calendar').fullCalendar('unselect');  
		   		   			 
	            	
	            	   
	            
	                 
	               },
	               error: function(data){
	            	                location.reload(); 
	               }

	            });  
	         },
	         loading: function(bool) {
	            if (bool) $('#loading').show();
	            else $('#loading').hide();
	         },
	      
		
			theme: true,
			themeButtonIcons: {
				prev: 'circle-triangle-w',
				next: 'circle-triangle-e',
				prevYear: 'seek-prev',
				nextYear: 'seek-next'
			},
		       eventClick: function(event, element) {
	               
		           $.ajax({
		                    
		                    success: function(json) {
		                    
		                      window.open("eventDetail?title="+event.title+"&s_id="+event.s_id,"팝업", "toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=600,width=800,left=0,top=0");
		                     
		                }
		          });
		       }
		});
		
	});

</script>

</head>


	<input type="hidden" value="${sessionScope.u_id}">
	
	<aside>

	</aside>
<jsp:include page="../Member/top.jsp"></jsp:include>

	
	<div id='calendar'></div>


		
		
	<div class="modal fade" id="calendarwritemodal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">일정 등록</h4>
				</div>
				<div class="modal-body">

					<form id="frm" name="frm" method="post" action="ScheMain">

						<table class="board_view">
							<colgroup>
								<col width="15%">
								<col width="*" />
							</colgroup>
							<tbody>


								<tr>
									<td>&nbsp;</td>
								</tr>

								<tr>
									<th scope="row">제목</th>
									<td><input type="text" name="s_title"
										class="form-control" class="wdp_90" placeholder="제목을 입력하세요" " id="modal-input">></input></td>
								</tr>

<tr>
									<th scope="row">종류</th>
									<td><select name="s_category" >
								
									<option value="1" selected="selected">개인일정</option>
									<option value="2">팀일정</option>
									</select></td>
								</tr>

								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th scope="row">일정 기간</th>
									<td>
										<div class="col-xs-5">
											<input type="date" id="s_start" name="s_start"
												class="form-control" id="ex5">
										</div>

										<div class="col-xs-1">
											<span class="glyphicon glyphicon-minus"></span>&nbsp;&nbsp;
										</div>

										<div class="col-xs-5">
											<input type="date" id="s_end" name="s_end"
												class="form-control" id="ex5" />
										</div>
									</td>	
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td colspan="2" class="view_text"><textarea rows="10"
											cols="40" name="s_content" class="form-control"
											placeholder="내용을 입력하세요"></textarea></td>
								</tr>







								<tr>
									<th scope="row">아이디</th>
									<td><input type="text" class="form-control" id="u_id"
										name="u_id" value=" ${u_id}"></input></td>
								</tr>
							</tbody>
						</table>
						<br> <br> sche_color
						<div class="form-group">
							<label>Color(일정 색상)</label> <label class="radio-inline"><input
								type="radio" name="s_color" class="radio-inline" value="red"
								checked>빨강&nbsp;</label> <label class="radio-inline"><input
								type="radio" name="s_color" class="radio-inline"
								value="blue">파랑&nbsp;</label> <label class="radio-inline"><input
								type="radio" name="s_color" class="radio-inline"
								value="purple">보라색</label>

						</div>	
						
						<input type="submit" value="작성" class="form-control">
<input type="hidden" class="t_id" name="t_id" value="${tid}">
					</form>
				</div>

			</div>


		</div>

	</div>

</body>
</html>
