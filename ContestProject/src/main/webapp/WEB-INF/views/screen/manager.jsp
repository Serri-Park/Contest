<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,500">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/popModal.css">
<script
	src="${pageContext.request.contextPath }/resources/js/popModal.js"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="../screen/top.jsp" flush="false" />
<jsp:include page="../screen/mAside.jsp" flush="false" />
<style>
* {
	padding: 0;
	margin: 0;
}
.btn-glyphicon {
    padding:8px;
    background:#ffffff;
    margin-right:4px;
	
}
.icon-btn {
    padding: 9px 15px 10px 2px;
    border-radius:50px;
}
#pre {
	min-height: 300px;
	text-align: center;
	float: left;
	position: reative;
	height: 50%;
	width: 10%;
	box-shadow:3px 3px 10px gray;
	margin-top:25px;
}

#viewer {
	text-align: center;
	min-height: 350px;
	max-height: 350px;
	float: left;
	position: reative;
	height: 50%;
	width: 50%;

}

#next {
	min-height: 300px;
	text-align: center; 
	float: left;
	position: reative;
	height: 50%;
	width: 10%;
	text-align: center;
	box-shadow:3px 3px 10px gray;
	margin-top:25px;  
}

#grandeBox {
	text-align: center;
	margin: 3% 9%;
	float: left;
	height: 5%;
	width: 50%;
	position: reative;
}
#grandeBox1 {
	text-align: center;
	margin: 2%;
	
	height: 5%;
	position: reative;
}   

#modify {
	text-align: center;
	margin: 0% 10%;
	float: left;
	height: 80px;
	width: 79%;
}

#form {    
	margin: 3% 0% 10% 23%;
	min-height: 300px;
}
#btn_pass{
	
}

#btn_fail{

}
</style>
</head>
<body>
		<div id="confirm_content" style="display: none">
			<div class="confirmModal_content">
				현재 단계의 평가가 완료 되었습니다.<br>다음 평가를 진행하시겠습니까?
			</div>
			<div class="confirmModal_footer">
				<button type="button" class="btn btn-primary"
					data-confirmmodal-but="ok">Ok</button>
				<button type="button" class="btn btn-default"
					data-confirmmodal-but="cancel">Cancel</button>
			</div>
		</div>
	<form>
		<input type='hidden' name='r_id' id='r_id' value='${r_id}'> 
		<input type="hidden" name="t_id" id="t_id" value="${t_id}">
	</form>

	<div id="form">
		<h3>작품명 : ${work.w_name }</h3>
		<div id="contain">
			<button class="btn btn-default" id="pre">
				<span class="glyphicon glyphicon-chevron-left" id="btn_pre"></span>
			</button>
			<div id="viewer">
				<img src="displayFile?fileName=${work.f_name }"
					style="max-height: 320px;margin-top:15px;width:90%;	box-shadow:3px 3px 10px #000; min-height: 320px;" onclick="onClick(this)" class="w3-hover-opacity">
			</div>
			<button class="btn btn-default" id="next">
				<span class="glyphicon glyphicon-chevron-right" id="btn_next"></span>
			</button>
		</div>

	<c:if test="${m.ep_how == 'Pass or Fail 방법' }">
		<c:if test="${get_id==null}">
			<div id="grandeBox">
				<a class="btn icon-btn btn-primary" id="btn_pass" data-btn="pass" href="#">
				<span class="btn-glyphicon img-circle" ><img alt="Pass" src="${pageContext.request.contextPath }/resources/upload/black-letter-p-20.png"></span>
				Pass
				</a>
				<a class="btn icon-btn btn-warning" id="btn_fail" data-btn="fail" href="#">
				<span class="btn-glyphicon img-circle" ><img alt="Fail" src="${pageContext.request.contextPath }/resources/upload/black-letter-f-20.png"></span>
				Fail
				</a>
				<div id="modify" style="display: none">
					<button class="btn btn-default" id="btn_Modify">Modify</button>
				</div>
			</div>
		</c:if>
		<c:if test="${get_id!=null}">
			<div id="grandeBox">
				<div id="modify">
					<button class="btn btn-default" id="btn_Modify">Modify</button>
				</div>
			</div>
		</c:if>
	</c:if>
	<c:if test="${m.ep_how == '상세채점 방법' }">
	<div id="grandeBox1">
	<table class="table table-hover" style="width:70%;"> 
			<tr>
				<th>번호</th>
				<th>평가항목</th>
				<th>채점</th>
			</tr>
		<c:forEach items="${list}" var="el">
				<tr>
					<td class="cnt"></td>
					<td>${el.el_name }(배점 : ${el.el_score})</td>
					<td class="form-inline cover">
						<input type="number" class="form-control score" max="${el.el_score}" maxlength="3" oninput="maxLengthCheck(this)"
						style="width:50%;" value=""/>
						<button class="ten btn btn-default" data-btn="10" style="position: reative;">10</button>
						<button class="one btn btn-default" data-btn="1" style="position: reative;">1</button>
						<button class="one btn btn-default" data-btn="0" style="position: reative;">0</button>
					</td>
				</tr>
			</c:forEach>
	</table>
				<button class="btn btn-default" id="commit" data-btn="commit" style="margin-left:-33%;">확인</button>
				<div id="modify" style="display: none">
					<button class="btn btn-default" id="btn_Modify">Modify</button>
				</div>
			</div>
	</c:if>
	</div>
	<div id="modal01" class="w3-modal" onclick="this.style.display='none'">
		<span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
		<div class="w3-modal-content w3-animate-zoom">
			<img id="img01" style="width: 100%; max-height: 600px;">
		</div>
	</div>

	<script>
	function onClick(element) {
 		 document.getElementById("img01").src = element.src;
		  document.getElementById("modal01").style.display = "block";
			}
	 function maxLengthCheck(object){
		   if (object.value.length > object.maxLength){
		    object.value = object.value.slice(0, object.maxLength);
		   }    
		  }
	 
	
	 $("#commit").on("click",function(){
		 $.ajax({
			url: "getEp", 
			type: "POST",  
			data :JSON.stringify({
			   "t_id":${t_id}
			}),
			headers:{
		       "Content-Type":"application/json",
		       "X-HTTP-Method-Override":"POST"
		    },
			dataType: "json",
			success: function(data){
				var check=true;
				for(var i = 0; i<data.list.length;i++){
					console.log(data.list[i].el_score);
					var x = $(".score").eq(i).val();
					if(data.list[i].el_score < x || x ==""){
						
						check=false;
					}
				}
				if(check){
					var str = "[";
					var stageNum = $(".score").length;
					var count =0;
					var setting = new Array();
				  	for(count;count<stageNum;count++){
				  		setting[count] = new Array();
				  		//alert($(".el_name").eq(count).val());
				  	
				  			setting[count][0] = data.list[count].el_id;
				  			setting[count][1] = $(".score").eq(count).val();
				  			setting[count][2] = "${work.w_id}";
				  			setting[count][3] = "${sessionScope.u_id}";
				  		
				  		if(count+1!=stageNum){
				  			str += "{\"el_id\":"
				  			str += setting[count][0]+","
				  			str += "\"e_score\":";
				  			str += setting[count][1]+",";
				  			str += "\"w_id\":";
				  			str += "\""+setting[count][2]+"\",";
				  			str += "\"u_id\":";
				  			str += setting[count][3]+"},";
				  		}
				  		else{
				  			str += "{\"el_id\":"
					  			str += setting[count][0]+","
					  			str += "\"e_score\":";
					  			str += setting[count][1]+",";
					  			str += "\"w_id\":";
					  			str += "\""+setting[count][2]+"\",";
					  			str += "\"u_id\":";
					  			str += setting[count][3]+"}]";
				  		}
				  	}
				  //	str += "}";
				  	
				  	
				  	alert(str);
				}else{
					alert("점수를 다시 설정해주세요");
					location.reload();
				}
			},
			error:function(data){
			   alert("error:"+data);
			}
			  });
		});
	var check = ${b};
	if(check==true){  
	$(document).ready(function(){ 
		var dd = $(".cnt").indexOf;
		console.log(dd)
		$('#confirm_content').confirmModal({
		topOffset : 0,
		onOkBut : function() {
			$.ajax({
				url: 'stageModify?t_id='+${t_id},
				type: 'GET',
			    dataType: "text", 
			    success: function(data) {
			       location.reload();
			    },
			    error: function(data) {
			        alert("error");
			    }
			      
				});
		},
		onCancelBut : function() {},
		onLoad : function() {},
		onClose : function() {}
		}); 
	});
	}	
		$(".cover").on("click","button",function(){
			var s =$(this).attr("data-btn");
			console.log($(this).prev().val());
			
			if(10 == s){
				var result = $(this).prev();
				s = Number(result.val()) + Number(s);
				result.val(s);   
			}    
			else if(1 == s){
				var result = $(this).prev().prev();
				s = Number(result.val()) + Number(s);
				result.val(s);   
			} else if(0 == s){
				var result = $(this).prev().prev().prev();
				s =Number(s);
				result.val(s);   
				
			}
		});
		$("#next").on("click", function() {
			$("form").attr("action", "next");
			$("form").attr("method", "get");
			$("form").submit();
		});
		$("#pre").on("click", function() {
			$("form").attr("action", "pre");
			$("form").attr("method", "get");
			$("form").submit();
		});
		$("#btn_pass").on("click",function(){
			var button = $("#btn_pass").attr("data-btn");
			var data = {"w_id":${work.w_id},"grande":button,"u_id":"${sessionScope.u_id}","t_id":${t_id}};
			 
			$.ajax({
			url: 'grande',
			type: 'POST',
		      dataType: "text", 
		      data:JSON.stringify(data),
		      headers:{
		            "Content-Type":"application/json",
		            "X-HTTP-Method-Override":"POST"
		         },
		      success: function(data) {
		        alert("평가입력되었습니다");
		        $("form").attr("action", "next");
				$("form").attr("method", "get");
				$("form").submit();
		      },
		      error: function(data) {
		        alert("error");
		      }
		      
			});
		});
		$("#btn_fail").on("click",function(){
			var button = $("#btn_fail").attr("data-btn");
			var data = {"w_id":${work.w_id},"grande":button,"u_id":"${sessionScope.u_id}","t_id":${t_id}};
			 
			$.ajax({
			url: 'grande',
		      type: 'POST',
		      dataType: "text", 
		      data:JSON.stringify(data),
		      headers:{
		            "Content-Type":"application/json",
		            "X-HTTP-Method-Override":"POST"
		         },
		      success: function(data) {
		        alert("평가입력되었습니다");
		        $("form").attr("action", "next");
				$("form").attr("method", "get");
				$("form").submit();
		      },
		      error: function(data) {
		        alert("error");
		      }
		      
			});
		});
		$("#btn_Modify").on("click",function(){
			var data = {"w_id":${work.w_id}};
			$.ajax({
				url: 'del_grande',
			      type: 'POST',
			      dataType: "text", 
			      data:JSON.stringify(data),
			      headers:{
			            "Content-Type":"application/json",
			            "X-HTTP-Method-Override":"POST"
			         },
			      success: function(data) {
			        alert("다시 재평가바랍니다.");
			        $("#modify").hide();
			        $("#grandeBox").show();
			        location.reload();
			      },
			      error: function(data) {
			        alert("error");
			      }
			      
				});
		});
		
	</script>
</body>
</html>