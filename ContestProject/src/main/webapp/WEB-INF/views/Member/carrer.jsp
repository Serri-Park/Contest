<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
</head>
<body>
        <script src="resources/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if('${param.chks[1]}' == "13") $("input:checkbox[id='chks']").prop("checked", true);
	$(".checkvalued").hide();
 var rowTag = $("table tbody").html();
 $(".tbtd_caption").data("rowTag", rowTag);  //키값 rowTag로 테이블의 기본 row 값의 Html태그 저장
//체크 박스 모두 체크
	$("#checkAll").click(function() {
		$("input[class=chk]:checkbox").each(function() {
			  $("input[name=chk]").prop("checked",true);

		});
	});

	// 체크 박스 모두 해제
	$("#uncheckAll").click(function() {	
		$("input[name=chk]:checkbox").each(function() {
			$(this).prop("checked", false);
		});
		 $(".isornot").change(function(){
		        if($(".isornot").is(":checked")){
		        	$("table").hide();
		        }else{
		         	
		        }
	});
	});
});
/* 테이블 삭제버튼 */
function rowDelete(obj){
 $(obj).parent().parent().remove();
}
/* 체크박스 선택 삭제 기능 */
function rowCheDel(){
 var $obj = $("input[name='chk']");
 var checkCount = $obj.size();
 for (var i=0; i<checkCount; i++){
  if($obj.eq(i).is(":checked")){
   $obj.eq(i).parent().parent().remove();
  }
 }
}
/* row 추가 기능 */
function rowAdd(){
 $("table tbody").append($(".tbtd_caption").data("rowTag")); //rowTag의 키값으로 저장된 Html값 호출하여 테이블에 추가
}

function checkDisable(frm)
{
    if( registerForm.chks.checked == true ){
    $(".checkvalued").show();
	} else 
		$(".checkvalued").hide();
	{
		
	}
}
</script>
<form action="carrer" name="registerForm" method="post" >
<label for="career">경력사항</label>
  <td>경력있음
  <input type="checkbox" name="chks" class=" is" onclick="checkDisable(this.form)"/ value="1"></td>
<div class="checkvalued">
<table border="1px" width="500px" class="tbtd_caption" name="tbtd_caption"	>
  <thead>
   <tr name="tables">
    <td>선택</td>
    <td>경력사항</td>
    <td>내용</td>
    <td>날짜</td>
    <td>기타</td>
   </tr>
</thead>
  <tbody>
   <tr>
      <input type="button" value="추가" onClick="rowAdd();" />
 <input type="button" value="선택삭제" onClick="rowCheDel();" />
 <input type="button" id="checkAll" value="전체 선택" />
 	<input type="button" id="uncheckAll" value="전체 해제" />
    <td><input type="checkbox" name="chk" class="chk" /></td>
    <td><input type="text" name="txtbox" /></td>
        <td><input type="text" name="Carrer_Name" /></td>
         <td><input type="text" name="Carrer_Content" /></td>
           <td><input type="text" name="Carrer_Role" /></td>
     <td><input type="date" name="joindate" /></td>
    <td><input type="button" value="삭제" onClick="rowDelete(this)"/></td>
   </tr>
  </tbody>
 </table>
 <input type="hidden" name="id" value="${sessionScope.id}">
 <input type="submit" value="가입하기" class="btn btn-primary">
<input type="reset" value="다시작성" class="btn btn-warning">
</form>

</div>

</body>
</html>