<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${u_id !='admin'}"> 
 	<script>
     alert("로그인 후 이용하실 수 있습니다.");
      location.href = "/contest/home";
<!--    </script> -->
 </c:if> -
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->

	

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
	<script src="resources/summernote/lang/summernote-ko-KR.js"></script>
<style>
	
	

</style>

  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLOBQVtSKaOFA3azizG1X-lU5QolxGnLU"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id='template' type='text/x-handlebars-template'>
	<li data-src="{{fullName}}">
		<span class='mailbox-attachment-icon has-img'>
			<img src='{{imgsrc}}' alt='Attachment'style="width: 150px;">
		</span>
		<div class='mailbox-attachment-info' style='background-color:rgba(178,235,244,0.3);'>
			<a href='{{downloadLink}}' class='mailbox-attachment-name'>{{fileName}}</a>
			<a href='{{fullName}}' class='btn btn-default btn-xs pull-right delbtn' style="font-weight:bolder;">X</a>
		</div>
	</li>
</script>

<script id='poster' type='text/x-handlebars-template'>
	<li data-src="{{fullName}}">
		<span class='mailbox-attachment-icon has-img'><img src='{{imgsrc}}' alt='Attachment' style="height:300px; width:200px"></span>
		<div class='mailbox-attachment-info' style='background-color:rgba(178,235,244,0.3);'>
			<a href='{{downloadLink}}' class='mailbox-attachment-name'>{{fileName}}</a>
			<a href='{{fullName}}' class='btn btn-default btn-xs pull-right delbtn' style="font-weight:bolder;">X</a>
		</div>
	</li>
</script>
</head>
<script type="text/javascript">

   $(function() {
	  
      $("#getBtn").on("click", function(){
         var geocoder = new google.maps.Geocoder();
         var address = $("#address").val();
         geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
            	 var lat = document.getElementById("p_lat").value=results[0].geometry.location.lat();
            	 var lng = document.getElementById("p_lng").value=results[0].geometry.location.lng();
               //var latLng = results[0].geometry.location;
              
               $("#p_lat").html(lat);
               $("#p_lng").html(lng);
            }
         });
      });
   });
  



	var listFor = $("#contestList");

	$("#homepage").on("click", function(event){
		event.preventDefault();
		$(".homein").show();			
	});  
	$("#homeclose").on("click", function(event){
		event.preventDefault();
		$(".homein").hide();			
	});  
	$("#hurlc").keyup(function(event){
		var hurlc = $('#hurlc').val();
		var hurl = $('#hurl').val();
		if(hurlc != "" && hurl != ""){
			$("#linkAddBtn").attr('disabled', false);
		}else {
			$("#linkAddBtn").attr('disabled', true);
		}
	});
	$("#hurl").keyup(function(event){
		var hurlc = $('#hurlc').val();
		var hurl = $('#hurl').val();
		if(hurlc != "" && hurl != ""){
			$("#linkAddBtn").attr('disabled', false);
		}else {
			$("#linkAddBtn").attr('disabled', true);
		}
	});
	
	$("#linkAddBtn").on("click", function(event){
		event.preventDefault();
		var hurlc = $('#hurlc').val();
		var hurl = $('#hurl').val();
		var newWindow = $("#newWindow")
		var url 
		if(newWindow.is(":checked")){
			url = "<a href='" + hurl +"' target='_blank' >"+hurlc+"</a>";
			$("#homepage").val("입력완료")
			$("#c_homepage").val(url)
			$(".homein").hide();			
		}
		else {
			url = "<a href='" + hurl +"' target='_self' >"+hurlc+"</a>";
			$("#homepage").val("입력완료")
			$("#c_homepage").val(url)
			$(".homein").hide();			
		}
	});
	
		$("#list").on("click", function(event){
			event.preventDefault();	
			var arr = [];
	   		$(".posterList li").each(function(index){
	   			arr.push($(this).attr("data-src"));
	   		});
	   		$(".uploadList li").each(function(index){
	   			arr.push($(this).attr("data-src"));
	   		});
			for (var defiles in arr) {
				$.ajax({
					url: "deleteFile",
					type: "DELETE",
					headers: {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "DELETE"
					},
					dataType: "text",
					data:JSON.stringify({filename:arr[defiles]}),

					//data: {fileName:small.attr("data-src")},
					success: function(result) {
						if(result == "deleted") {
						}
						else return false;
					}
				});
			}
			var categoryCompare = "${criteria.category}";
			var dateCompare = "${criteria.dateState}";
			if(dateCompare==null) {dateCompare="all";}
			if(categoryCompare==null) {categoryCompare="allCategory";}
			$("<input type='hidden' name='page' value='${criteria.page }''>").appendTo(listFor)
			$("<input type='hidden' name='recordsPerPage' value='${criteria.recordsPerPage }'>").appendTo(listFor)
			$("<input type='hidden' name ='dateState' value='"+dateCompare+"'>").appendTo(listFor)
			$("<input type='hidden' name ='category' value='"+categoryCompare+"'>").appendTo(listFor);
			listFor.attr("action", "contestList");
			listFor.attr("method", "get");
			listFor.submit();
		});
		
		var template = Handlebars.compile($("#template").html());
		
		var poster = Handlebars.compile($("#poster").html());
	  	
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();	
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;  //배열로 반환
			
			for (var upfiles in files) {
				
				var file = files[upfiles];
				var formData = new FormData();
				formData.append("file", file);
				//console.log(typeof(file));
				
				if(typeof(file) == "number") break;
				$.ajax({
					url: "uploadAjax",
					data: formData,
					dataType:"text",
					processData: false,
					contentType: false,
					type:"POST",
					success: function(data){
						
						var fileInfo = getFileInfo(data);
						
						var html = template(fileInfo);
						
						$(".uploadList").append(html);
						
					}
				});
			}
		});
		
		$(".fileSelect").on("change", function(){
			var files = this.files
			
			for (var upfiles in files) {
				
				var file = files[upfiles];
				var formData = new FormData();
				formData.append("file", file);
				//console.log(typeof(file));
				
				if(typeof(file) == "number") break;
				$.ajax({
					url: "uploadAjax",
					data: formData,
					dataType:"text",
					processData: false,
					contentType: false,
					type:"POST",
					success: function(data){
						
						var fileInfo = getFileInfo(data);
						
						var html = template(fileInfo);
						
						$(".uploadList").append(html);
						
					}
				});
			}
		});
		

		$(".posterSelect").on("change", function(){
			var files = this.files;

			//console.log(files.length);
			if(files.length != 1) {
				alert("포스터 이미지를 1개만 선택하세요"); 
				return false;
			}
			
			var ext = $(".posterList").children("li").attr("data-src");
			//alert(ext);
			if (ext != null) {
				alert("등록된 포스터를 삭제 후 새로운 포스터를 등록하세요.");
				return false;
			}
			for (var upfiles in files) {
				
				var file = files[upfiles];
				var formData = new FormData();
				formData.append("file", file);
				//console.log(typeof(file));
				
				if(typeof(file) == "number") break;
				$.ajax({
					url: "uploadAjax",
					data: formData,
					dataType:"text",
					processData: false,
					contentType: false,
					type:"POST",
					success: function(data){
						
						var fileInfo = getFileInfo(data);
						
						var html = poster(fileInfo);
						
						$(".posterList").append(html);
						
					}
				});
			}
		});
		
		$(".uploadList").on("click", ".delbtn", function(event){
			event.preventDefault();
			var r = $(this);
			$.ajax({
				url: "deleteFile",
				type: "DELETE",
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE"
				},
				dataType: "text",
				data:JSON.stringify({filename:$(this).attr("href")}),

				//data: {fileName:small.attr("data-src")},
				success: function(result) {
					if(result == "deleted") {
						r.parent("div").parent("li").remove();
					}
				}
				
			});
		});
		
		$(".posterList").on("click", ".delbtn", function(event){
			event.preventDefault();
			var r = $(this);
			$.ajax({
				url: "deleteFile",
				type: "DELETE",
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE"
				},
				dataType: "text",
				data:JSON.stringify({filename:$(this).attr("href")}),

				//data: {fileName:small.attr("data-src")},
				success: function(result) {
					if(result == "deleted") {
						r.parent("div").parent("li").remove();
					}
				}
				
			});
		});
		

		
		$("#registerForm").submit(function(event){
			event.preventDefault();
			var form=$(this);
			var str="";
			
			$(".uploadList .delbtn").each(function(index){
				//drag drop 한 만큼 이미지 갯수가 있을텐데 그것만큼 똑같은 함수를 실행!  자동으로 인데스를 준다.
			    str+="<input type='hidden' name='f_name["+index+"]' value='"+$(this).attr("href")+"'> ";
			});	
			str+="<input type='hidden' name='c_poster' value='"+$(".posterList .delbtn").attr("href")+"'> ";
			form.append(str);
			form.get(0).submit();
		});

		$(".c_category").on("click", function(event){
			event.preventDefault();
			var arr = [];
	   		$(".posterList li").each(function(index){
	   			arr.push($(this).attr("data-src"));
	   		});
	   		$(".uploadList li").each(function(index){
	   			arr.push($(this).attr("data-src"));
	   		});
			for (var defiles in arr) {
				$.ajax({
					url: "deleteFile",
					type: "DELETE",
					headers: {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "DELETE"
					},
					dataType: "text",
					data:JSON.stringify({filename:arr[defiles]}),

					//data: {fileName:small.attr("data-src")},
					success: function(result) {
						if(result == "deleted") {
						}
						else return false;
					}
				});
			}
			var category = $(this).attr("href")
			var dateCompare = "${criteria.dateState}";
			if(dateCompare==null) {dateCompare="all";}
			$("<input type='hidden' name ='category' value='"+category+"'>").appendTo(listFor);
			$("<input type='hidden' name ='dateState' value='"+dateCompare+"'>").appendTo(listFor);
			$("#page").val(1);
			listFor.attr("action", "contestList");
			listFor.attr("method", "get");
			listFor.submit();
		});
		</script>
<script>

     $(document).ready(function() {
    	 function sendFile(file, editor, welEditable) {
    		    data = new FormData();
    		    data.append("uploadFile", file);
    		    $.ajax({
    		        data : data,
    		        type : "POST",
    		        url : "/imageUpload",
    		        cache : false,
    		        contentType : false,
    		        processData : false,
    		        success : function(data) {
    		            editor.insertImage(welEditable, data.url);
    		        }
    		    });
    		}


    	

         $('#summernote').summernote({
        	 
              onImageUpload : function(files, editor, welEditable) {
                  sendFile(files[0], editor, welEditable);

              },

    height : 300, // 에디터의 높이 

    minHeight : null,

    maxHeight : null,

    focus : true,

    lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경

         });

     });




     var postForm = function() {

      var contents =  $('textarea[name="content"]').text($('#summernote').code());

  }

 

</script>
 
	


</head>
<body>

<form action="place" id="postForm" method="post"
			class="form-horizontal" onsubmit="return postForm()"	enctype="multipart/form-data">
			
	<div class="container">

	

			
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="p_name">장소명</label>
				<div class="col-sm-10">
					<input type="text" name="p_name" id="p_name" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="id">등록자</label>
				<div class="col-sm-10">
					<input type="text" name="u_id" id="u_id" class="form-control"
						value="${sessionScope.u_id }">
				</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label" for="place_content">장소설명</label>
			<div class="col-sm-10">
			<textarea id="summernote" name="p_Content"></textarea>
</div>

</div>
<div class="form-group">
				<label class="col-sm-2 control-label" for="place_Kind">장소종류</label>
				<div class="col-sm-10">
					<select  name="p_Kind" id="place_Kind" class="form-control" multiple="multiple">
					<option value="" >==========</option>
					<option value="카페" >카페</option>
					<option value="회의실" >회의실</option>
					<option value="스터디룸" >스터디룸</option>
					
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="place_cost">금액</label>
				<div class="col-sm-10">
					<input type="number"  step="1000" min="0" max="any" name="p_cost" id="place_cost" class="form-control">
					
				</div>	
			</div>
<div class="form-group">
				<label class="col-sm-2 control-label" for="place_cost">주소</label>
				<div class="col-sm-10">
					<input type="text" name="p_address" id="p_address" class="form-control">
					
				</div>
			</div>
			<div>
			
   <input type="text" id="address"/><input type="button" value="get Lat,Lng" id="getBtn" />
</div>
<div>
   lat : <input id="p_lat"  name="p_lat">
</div>
<div>
   lng : <input id="p_lng" name="p_lng"></div>

			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="p_option">세부옵션</label>
				  	<div class="col-sm-10">
				  	<select  name="p_option" id="p_option" class="form-control" multiple>
					<option value="" >==========</option>
					<option value="와이파이" >와이파이</option>
					<option value="빔프로젝트" >빔프로젝트</option>
					<option value="마이크" >마이크</option>
					
					</select>
					
				</div>
		</div>
=
						<span class="tit">
							파일첨부
						</span>
						<span class="ipt">
							<input class="posterSelect" type="file" name="photo" multiple/>		
						</span>
						<div></div>
				
  <div class="form-group" align="center">  
  <div class="col-sm-20">
<input type="submit" value="장소 등록" class="btn btn-success">
&nbsp;
<input type="reset" value="다시 작성" class="btn btn-warning">

</div>

</div>
	</div>
		</form>	







</body>
</html>