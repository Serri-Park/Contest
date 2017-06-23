<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link href="resources/css/multi-select.css" rel="stylesheet">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery.multi-select.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<title>Insert title here</title>




</head>
<body>

    <!-- Modal content-->
   
   
      <div class="modal-body">
        
    <form id="frm" name="frm" method="post" action="ScheMain">
      
                  <table class="board_view">
                     <colgroup>
                        <col width="15%">
                        <col width="*" />
                     </colgroup>
                     <tbody>
                        <tr>
                         	<th scope="row">아이디</th>
                           <td><input type="text" class="form-control" id="id" name="id"
                              value="${id}"></input></td>
                        </tr>
                        
                       <tr>
                           <td>&nbsp;</td>
                        </tr>
             
                        <tr>
                           <th scope="row">제목</th>
                           <td><input type="text" name="schetitle" class="form-control" class="wdp_90" placeholder="제목을 입력하세요"></input></td>
                        </tr>
                        
                      
                      
                         <tr>
                           <td>&nbsp;</td>
                        </tr>
                        <tr>
                           <th scope="row">일정 기간</th>                       
                           <td>            
						 <div class="col-xs-5">
       					 <input type="text" id="schestart" name="schestart" class="form-control" id="ex5">
     					 </div>
     					 
     					 <div class="col-xs-1">
     					 <span class="glyphicon glyphicon-minus"></span>&nbsp;&nbsp;
   						 </div>
   						 
            			<div class="col-xs-5">
            			<input type="text" id="scheend" name="scheend" class="form-control" id="ex5" />
      					</div>
                           </td>                   
                        </tr>
               <tr>
                           <th scope="row">내용</th>
                           <td colspan="2" class="view_text">
                           <textarea rows="10"   cols="40" name="schecontent" class="form-control"placeholder="내용을 입력하세요"></textarea></td>
                        </tr>
                     </tbody>
                  </table>

                  <br>
                  <br>
                  

                  색상 :<input type="color" name="sche_color" class="form-control"><br>
                  

 
            
                  <input type="submit" value="작성" class="form-control">
                  
                  </form>
                  </div>	
                  				
						</div>
						

        				</div>
		
    </div>
</body>
</html>