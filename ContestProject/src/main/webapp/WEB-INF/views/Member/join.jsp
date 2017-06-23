<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
  
 <script src="resources/js/jquery.js"></script>
 <script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="resources/js/additional-methods.min.js"></script>
<script type="text/javascript" src="resources/js/messages_ko.min.js"></script>



<script>

$(document).ready(function(){
	$(function(){
		$("#registerForm").validate({
            //validation이 끝난 이후의 submit 직전 추가 작업할 부분
            submitHandler: function() {
                var f = confirm("회원가입을 완료하겠습니까?");
                if(f){
                    return true;
                } else {
                    return false;
                }
            },
            //규칙
            rules: {
                u_id: {
                    required : true,
                    minlength : 6,
                    
                },
                u_pass: {
                    required : true,
                    minlength : 6
                },
                pass2: {
                    required : true,
                    minlength : 6,
                    equalTo : u_pass
                },
                u_name: {
                    required : true,
                    minlength : 2
                },u_email: {
                    required : true,
                    minlength : 2,
                    email : true
                },
                u_hp : {digits: true, minlength: 10, maxlength: 12},
            },messages : {
                u_id: {
                    required : "필수로입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    remote : "존재하는 아이디입니다"
                },
                u_pass: {
                    required : "필수로입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다"
                },
                pass2: {
                    required : "필수로입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    equalTo : "비밀번호가 일치하지 않습니다."
                },
                u_name: {
                    required : "필수로입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다"
                },
                u_email: {
                    required : "필수로입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    email : "메일규칙에 어긋납니다"
                },u_hp : { minlength: "휴대전화 번호는 10자 이상이어야 합니다.", maxlength: "휴대전화 번호는 12자 미만이어야 합니다.", digits:"휴대전화 번호는 숫자만 입력해주세요."},
                
                
                
                
            }
	       });
	})

	$("#m_idChk").click(function(){
	    $.ajax({
	    type: "POST",
	    url: "joinCheck",
	    data: ({id:$("#u_id").val()}),
	    success: function(data){
		    	if(jQuery.trim(data)=="true"){
		   			$("#checktext").html("<font color=green>가입이 가능합니다</font>");
		   			$("#checktext").show();
		    	}else{
		    		$("#checktext").html("<font color=red>가입된 아이디가 있습니다</font>");
		   			$("#checktext").show();
		   			$("input[name=u_id]").val("");
		   			$("input[name=u_id]").focus();
		    	}
	    	}
	    });
	});
	
	$(function(){
		  $('#u_pass').keyup(function(){
		   $('#checkPass').text('');
		  }); //#user_pass.keyup

		  $('#pass2').keyup(function(){
		   if($('#u_pass').val()!=$('#pass2').val() ){
		    $('#checkPass').text('');
		    $('#checkPass').html("암호가 틀림");
		   }else{
		    $('#checkPass').text('');
		    $('#checkPass').html("암호맞음");
		   }
		  }); //#chpass.keyup
		 
		 });
	
	













});

</script>
<jsp:include page="top.jsp"></jsp:include>

  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">

<h1>회원가입</h1>
	<br><br>
<br><br><br><br>
<form action="insertmember" name="registerForm" method="post"  id="registerForm" enctype="multipart/form-data">

						
							<div class="col-sm-5">
							<label class="col-sm-3 control-label" for="m_id">아이디</label>
								<input class="form-control" id="u_id"	name="u_id" placeholder="ID를 입력하세요" required >
								
								
								<input type="button" id="m_idChk" class="btn btn-danger" value="중복체크" size="2">
							<div id="checktext"></div>
<br>     

								<label class="col-sm-3 control-label" for="pass">비밀번호</label>
								<input class="form-control" type="password" id="u_pass" name="u_pass"  placeholder="비밀번호를 입력하세요">
					
						
				
							<label class="col-sm-3 control-label" for="pass2">비밀번호확인</label>
								<input class="form-control" type="password" id="pass2" name="pass2"	 placeholder="비밀번호를 한번 더 입력하세요">
								<div id="checkPass"></div>
							
			
							<label class="col-sm-3 control-label" for="u_name">이름</label>
								<input class="form-control" id="u_name"	name="u_name" placeholder="이름을 입력하세요" required >
								


핸프폰<input type="text" name="u_hp" required class="form-control"><br>
생년월일<input type="date" name="u_birthyear" class="form-control">
이메일<input type="text" name="u_email" id="email" class="form-control">

<br>
관심분야<select name="u_major" class="form-control" multiple="multiple">
<option value="논문/리포트">논문/리포트</option>
<option value="기획/아이디어">기획/아이디어</option>
<option value="네이밍/슬로건">네이밍/슬로건</option>
<option value="디자인/캐릭터/만화">디자인/캐릭터/만화</option>
<option value="광고/마케팅">광고/마케팅"</option>
<option value="영상/사진">영상/사진</option>
<option value="UCC/SOUND">UCC/SOUND</option>
<option value="예체능">예체능</option>
<option value="문학/수기">문학/수기</option>
<option value="과학/공학">과학/공학</option>
<option value="게임/소프트웨어">게임/소프트웨어</option>
<option value="건축/건설">건축/건설</option>
<option value="체험/참여">체험/참여</option>
<option value="취업/창업">취업/창업</option>
<option value="경품/이벤트">경품/이벤트</option>
<option value="전시/페스티벌">전시/페스티벌</option>
<option value="장학(금)재단">장학(금)재단</option>
<option value="봉사활동">봉사활동</option>
<option value="해외">해외</option>
<option value="서바이벌">서바이벌</option>

</select>
<label class="col-sm-3 control-label" for="u_postcode">주소</label>
<input type="text"  class="form-control"	id="u_postcode" placeholder="우편번호" name="u_postcode">
<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" class="form-control" id="u_address" placeholder="주소" name="u_address">
<input type="text" id="u_address2" class="form-control" placeholder="상세주소" name="u_address2">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('u_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('u_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('u_address2').focus();
            }
        }).open();
    }
    
</script>

<input type="file" name="photo" id="photo">
<input type="submit" value="가입하기" class="btn btn-primary"/>
<input type="reset" value="다시작성" class="btn btn-warning"/>
</form>
</article>
</div>
</body>
</html>