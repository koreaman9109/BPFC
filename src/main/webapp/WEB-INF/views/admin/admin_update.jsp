<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 수정</title>
<script>
$(document).ready(function(){
     
    $("#list").click(function() {
		if (confirm("메인으로 돌아가시겠습니까? 작성중인 내용은 저장되지 않습니다.") == true){
		location.href = "cms_main.do";
	}else{
		return;
		}
			});
     
    $("#btnSave").click(function(){

        if($("#admin_id").val().trim() == ""){
            alert("작성자를 입력하세요.");
            $("admin_id").focus();
            return false;
        }
        
        
       /*  var password = $("#admin_passwd").val()
        if(password == ""){
            alert("패스워드를를 입력하세요.");
            $("#admin_passwd").focus();
            return;
        } */

         
         
    });
     
});

//이중폼 보내는 방법
function detailSubmit(index) {
	    if (index == 1) {
	    	
	    	var email = document.listForm.admin_email.value;
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			var msg, ss, cc;
			
			if(confirm("정말로 수정 하시겠습니까?")) {
				
				//이름 입력여부 검사
		        if (document.listForm.admin_name.value == "") {
					alert("이름(실명)을 입력하지 않았습니다.");
					document.listForm.admin_name.focus()

		            return false;

		        }
				//이름 유효성 검사
		        if (document.listForm.admin_name.value.length<2){
					alert("이름(실명)을 2자 이상 입력해주십시오.");
					document.listForm.admin_name.focus()

		            return false;

		        }
		      	//부서 입력여부 검사
		        if (document.listForm.admin_department.value == "") {
					alert("업무부서를 입력하지 않았습니다.");
					document.listForm.admin_department.focus()

		            return false;

		        }
				//이메일 입력여부 검사
		        if (document.listForm.admin_email.value == "") {
					alert("이메일을 입력하지 않았습니다.")
					document.listForm.admin_email.focus()

		            return false;

		        }
				//이메일 유효성 검사
		        if (regex.test(email) === false) {
					alert("잘못된 이메일 형식입니다.");
					document.listForm.admin_email.value=""
					document.listForm.admin_email.focus()

		            return false;

		        }
		      //비밀번호 입력여부 체크
				if (document.listForm.admin_passwd.value == "") {
		            alert("비밀번호를 입력하지 않았습니다.")
		            document.listForm.admin_passwd.focus()

		            return false;

		        }
				//비밀번호와 비밀번호 확인 일치여부 체크
				if (document.listForm.admin_passwd.value != document.listForm.admin_passwdchk.value) {
		            alert("비밀번호가 일치하지 않습니다")
		            document.listForm.admin_passwdchk.value = ""
		            document.listForm.admin_passwdchk.focus()
		            

		            return false;
		        }
			if(document.listForm.session_id.value != "interlink" && document.listForm.session_id.value !=  "bpfcadmin"){
				
				if (listForm.admin_passwd.value == listForm.admin_id.value) {
		            alert("아이디와 비밀번호가 같습니다.")
		            document.listForm.admin_passwd.focus()

		            return false;

		        }
				var ObjAdminPassword = document.listForm.admin_passwd;
				//비밀번호 길이 체크(6~14자 까지 허용)
				 if(ObjAdminPassword.value.length<6) {
					 alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 혼합사용하여 6~16자까지, 영문은 대소문자를 구분합니다.");
					return false;
					}				
				
				if(!ObjAdminPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
				    alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 혼합6~14자까지, 영문은 대소문자를 구분합니다.");
				    return false;
				 }
				
				var SamePass_0 = 0; //동일문자 카운트
				var SamePass_1 = 0; //연속성(+) 카운드
				var SamePass_2 = 0; //연속성(-) 카운드
				
				for(var i=0; i < ObjAdminPassword.value.length; i++) {
				    var chr_pass_0 = ObjAdminPassword.value.charAt(i);
				    var chr_pass_1 = ObjAdminPassword.value.charAt(i+1);
				    
				    //동일문자 카운트
				    if(chr_pass_0 == chr_pass_1) {
				      SamePass_0 = SamePass_0 + 1
				    }
				    
				    var chr_pass_2 = ObjAdminPassword.value.charAt(i+2);

				    //연속성(+) 카운드
				    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
				      SamePass_1 = SamePass_1 + 1
				    }
				    
				    //연속성(-) 카운드
				    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
				      SamePass_2 = SamePass_2 + 1
				    }
				    }
				  if(SamePass_0 > 1) {
				    alert("동일문자를 3번 이상 사용할 수 없습니다.");
				    return false;
				  }
				 
				  if(SamePass_1 > 1 || SamePass_2 > 1 ) {
				    alert("연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.");
				    return false;
				  }
			}
				
				
				
		      
			if(document.listForm.session_id.value == "interlink" || document.listForm.session_id.value ==  "bpfcadmin"){
				//접속권한 체크 여부 확인
				if($('input:checkbox[name="board_id"]').is(":checked") == false)  {
		          
					alert("접속권한을 체크하여 주십시오.")
		            return false;
		          }
			}
				// 폼에 입력한 데이터를 서버로 전송
				document.listForm.action='adminUpdate.do';

					alert("수정 되었습니다.");
						
				}else{
					alert("취소 되었습니다.");
					return false;
				}	
	    }
	    if (index == 2) {
	      document.listForm.action='#';
	    }
	    document.listForm.submit();
	  };
</script>
<script type="text/javascript">
function employeePopup() { window.open("employee_serach.do", "employeePop", "width=600, height=800, left=100, top=50"); }
function 	searchAlert() {
	  alert("직원검색을 통해 입력해주세요.")
	  }
	  
</script>
<script type="text/javascript">
function radio_1(){
	 var access = $("input[type=radio][name=radio1]:checked").val();
	 $('#view_name1').val(access);
	 };
function radio_2(){
	 var access = $("input[type=radio][name=radio2]:checked").val();
	 $('#view_name2').val(access);
	 };
function radio_3(){
	 var access = $("input[type=radio][name=radio3]:checked").val();
	 $('#view_name3').val(access);
	 };
function radio_4(){
	 var access = $("input[type=radio][name=radio4]:checked").val();
	 $('#view_name4').val(access);
	 };
function radio_5(){
	 var access = $("input[type=radio][name=radio5]:checked").val();
	 $('#view_name5').val(access);
	 };
function radio_6(){
	 var access = $("input[type=radio][name=radio6]:checked").val();
	 $('#view_name6').val(access);
	 };
function radio_7(){
	 var access = $("input[type=radio][name=radio7]:checked").val();
	 $('#view_name7').val(access);
	 };
function radio_8(){
	 var access = $("input[type=radio][name=radio8]:checked").val();
	 $('#view_name8').val(access);
	 };
function radio_9(){
	 var access = $("input[type=radio][name=radio9]:checked").val();
	 $('#view_name9').val(access);
	 };
function radio_10(){
	 var access = $("input[type=radio][name=radio10]:checked").val();
 	 $('#view_name10').val(access);
	 };	 	 

	 
	 
$(document).ready(function(){
	
if ($("input:checkbox[id='customCheck1']").is(":checked") == true){	
	$("#radio1").show(); // display 속성을 none 으로 바꾼다.
	}else{
		 $('#radio1').hide();
		 $('#view_name1').remove();
		 $("#obj1").append('<td id="border1"></td>');
		} 
if ($("input:checkbox[id='customCheck2']").is(":checked") == true){
	$("#radio2").show(); // display 속성을 none 으로 바꾼다.
	}else{
		$('#radio2').hide();    
		$('#view_name2').remove();
		$("#obj2").append('<td id="border2"></td>');
	}
if ($("input:checkbox[id='customCheck3']").is(":checked") == true){
	$("#radio3").show(); // display 속성을 none 으로 바꾼다.
	}else{
		$('#radio3').hide();
		$('#view_name3').remove();
		$("#obj3").append('<td id="border3"></td>');
	}	
if ($("input:checkbox[id='customCheck4']").is(":checked") == true){
	$("#radio4").show(); // display 속성을 none 으로 바꾼다.
	}else{
		$('#radio4').hide();
		$('#view_name4').remove();
		$("#obj4").append('<td id="border4"></td>');
	}	
if ($("input:checkbox[id='customCheck5']").is(":checked") == true){
	$("#radio5").show(); // display 속성을 none 으로 바꾼다.
	}else{
		$('#radio5').hide(); 
		$('#view_name5').remove();
		$("#obj5").append('<td id="border5"></td>');
	}	
if ($("input:checkbox[id='customCheck6']").is(":checked") == true){
	$("#radio6").show(); // display 속성을 none 으로 바꾼다.
	}else{
		$('#radio6').hide();
		$('#view_name6').remove();
		$("#obj6").append('<td id="border6"></td>');
	}	
if ($("input:checkbox[id='customCheck7']").is(":checked") == true){
	$("#radio7").show(); // display 속성을 none 으로 바꾼다.
	}else{
		$('#radio7').hide(); 
		$('#view_name7').remove();
		$("#obj7").append('<td id="border7"></td>');
	}	
if ($("input:checkbox[id='customCheck8']").is(":checked") == true){
	$("#radio8").show(); // display 속성을 none 으로 바꾼다.
	}else{
		$('#radio8').hide();
		$('#view_name8').remove();
		$("#obj8").append('<td id="border8"></td>');
	}	
if ($("input:checkbox[id='customCheck9']").is(":checked") == true){
	$("#radio9").show(); // display 속성을 none 으로 바꾼다.
	}else{
		$('#radio9').hide();
		$('#view_name9').remove();
		$("#obj9").append('<td id="border9"></td>');
	}
if ($("input:checkbox[id='customCheck10']").is(":checked") == true){
	$("#radio10").show(); // display 속성을 none 으로 바꾼다.
	}else{
		$('#radio10').hide();
		$('#view_name10').remove();
		$("#obj10").append('<td id="border10"></td>');
	}


	    $("#customCheck1").change(function(){
	    	var access = $("input[type=radio][name=radio1]:checked").val();
	        if($("#customCheck1").is(":checked")){
			    $('#radio1').show();
			    $('#border1').remove();
			    $("#radio1").append('<input type="hidden" name="view_name" id="view_name1" value="'+access+'" />');
	        }else{
	            $('#radio1').hide();
	   		 	$('#view_name1').remove();
			    $("#obj1").append('<td id="border1"></td>');
	        }
	    });
	    $("#customCheck2").change(function(){
	    	var access = $("input[type=radio][name=radio2]:checked").val();
	        if($("#customCheck2").is(":checked")){
	        	$('#radio2').show();
	        	$('#border2').remove();
	        	$("#radio2").append('<input type="hidden" name="view_name" id="view_name2" value="'+access+'" />');
			}else{
	            $('#radio2').hide();
	            $('#view_name2').remove();
	        	$("#obj2").append('<td id="border2"></td>');
	        }
	    });
	    $("#customCheck3").change(function(){
	    	var access = $("input[type=radio][name=radio3]:checked").val();
	        if($("#customCheck3").is(":checked")){
	        	$('#radio3').show();
	        	$('#border3').remove();
	        	$("#radio3").append('<input type="hidden" name="view_name" id="view_name3" value="'+access+'" />');
	        }else{
	            $('#radio3').hide();
	            $('#view_name3').remove();
	        	$("#obj3").append('<td id="border3"></td>');
	        }
	    });
	    $("#customCheck4").change(function(){
	    	var access = $("input[type=radio][name=radio4]:checked").val();
	        if($("#customCheck4").is(":checked")){
	        	$('#radio4').show();
	        	$('#border4').remove();
	        	$("#radio4").append('<input type="hidden" name="view_name" id="view_name4" value="'+access+'" />');
	        }else{
	            $('#radio4').hide();
	            $('#view_name4').remove();
	        	$("#obj4").append('<td id="border4"></td>');
	        }
	    });
	    $("#customCheck5").change(function(){
	    	var access = $("input[type=radio][name=radio5]:checked").val();
	        if($("#customCheck5").is(":checked")){
	        	$('#radio5').show();
	        	$('#border5').remove();
	        	$("#radio5").append('<input type="hidden" name="view_name" id="view_name5" value="'+access+'" />');
	        }else{
	            $('#radio5').hide();
	            $('#view_name5').remove();
	        	$("#obj5").append('<td id="border5"></td>');
	        }
	    });
	    $("#customCheck6").change(function(){
	    	var access = $("input[type=radio][name=radio6]:checked").val();
	        if($("#customCheck6").is(":checked")){
	        	$('#radio6').show();
	        	$('#border6').remove();
	        	$("#radio6").append('<input type="hidden" name="view_name" id="view_name6" value="'+access+'" />');
	        }else{
	            $('#radio6').hide();
	            $('#view_name6').remove();
	        	$("#obj6").append('<td id="border6"></td>');
	        }
	    });
	    $("#customCheck7").change(function(){
	    	var access = $("input[type=radio][name=radio7]:checked").val();
	        if($("#customCheck7").is(":checked")){
	        	$('#radio7').show();
	        	$('#border7').remove();
	        	$("#radio7").append('<input type="hidden" name="view_name" id="view_name7" value="'+access+'" />');
	        }else{
	            $('#radio7').hide();
	            $('#view_name7').remove();
	        	$("#obj7").append('<td id="border7"></td>');
	        }
	    });
	    $("#customCheck8").change(function(){
	    	var access = $("input[type=radio][name=radio8]:checked").val();
	        if($("#customCheck8").is(":checked")){
	        	$('#radio8').show();
	        	$('#border8').remove();
	        	$("#radio8").append('<input type="hidden" name="view_name" id="view_name8" value="'+access+'" />');
	        }else{
	            $('#radio8').hide();
	            $('#view_name8').remove();
	        	$("#obj8").append('<td id="border8"></td>');
	        }
	    });
	    $("#customCheck9").change(function(){
	    	var access = $("input[type=radio][name=radio9]:checked").val();
	        if($("#customCheck9").is(":checked")){
	        	$('#radio9').show();
	        	$('#border9').remove();
	        	$("#radio9").append('<input type="hidden" name="view_name" id="view_name9" value="'+access+'" />');
	        }else{
	            $('#radio9').hide();
	            $('#view_name9').remove();
	        	$("#obj9").append('<td id="border9"></td>');
	        }
	    });
	    $("#customCheck10").change(function(){
	        if($("#customCheck10").is(":checked")){
	        	$('#radio10').show();
	        	$('#border10').remove();
	        	$("#radio10").append('<input type="hidden" name="view_name" id="view_name10" value="0" />');
	        }else{
	            $('#radio10').hide();
	            $('#view_name10').remove();
	        	$("#obj10").append('<td id="border10"></td>');
	        }
	    });
	});
</script>

</head>
<body>

	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
<jsp:include page="../setting_submenu.jsp"></jsp:include>

			<br>
			 <br>
		<form name="listForm"  method="post">
		<input type="hidden" id="admin_num" name="admin_num" value="${admin_view.admin_num}">
		<input type="hidden" id="session_id" name="session_id" value="${sessionScope.admin_id}">
		<div align="center" style="margin: 0 auto; width: 500px; padding-top: 100px; ">
			<h1>정보 수정</h1>
			<br>
				<table border="1" style="border-color: darkgray; width: 500px;">
				<tr>
				  <td style="width: 180px;" class="table-info"><label class="col-form-label" for="admin_id" style="font-size: large;">&ensp;&ensp;사번(*)</label></td>	  
				  <td>&ensp;&ensp;<input type="text"  style="width: 200px; border: 0; font-size: large;" placeholder="사번 입력해주세요" id="admin_id" name="admin_id" readonly value="${admin_view.admin_id}"><input type="hidden" id="authority" name="authority" value="${admin_view.authority}"></td>
				</tr>
				<tr>
				  <td style="width: 150px;" class="table-info"><label class="col-form-label" for="admin_name" style="font-size: large;">&ensp;&ensp;성명</label></td>
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0; font-size: large;" placeholder="성명을 입력해주세요" id="admin_name" name="admin_name" readonly value="${admin_view.admin_name}"></td>
				</tr>
				<tr>
				   <td style="width: 150px;" class="table-info"><label class="col-form-label" for="admin_rank" style="font-size: large;">&ensp;&ensp;직급</label></td> 
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0; font-size: large;" placeholder="직급을 입력해주세요" id="admin_rank" name="admin_rank" readonly value="${admin_view.admin_rank}"></td>
				</tr>
				<tr>
				  <td style="width: 150px;" class="table-info"><label class="col-form-label" for="admin_department" style="font-size: large;">&ensp;&ensp;부서</label></td>
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0; font-size: large;" placeholder="담당 부서를 입력해주세요" id="admin_department" name="admin_department" readonly value="${admin_view.admin_department}"></td>
				</tr>
				<tr>
				  <td style="width: 150px;" class="table-info"><label class="col-form-label" for="admin_task" style="font-size: large;">&ensp;&ensp;업무</label></td>
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0; font-size: large;" id="admin_task" name="admin_task" readonly value="${admin_view.admin_task}"></td>
				</tr>
				<tr>
				   <td style="width: 150px;" class="table-info"><label class="col-form-label" for="admin_nickname" style="font-size: large;">&ensp;&ensp;별칭(*)</label></td> 
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0; font-size: large;" placeholder="ex)관리자, 운영자" id="admin_nickname" name="admin_nickname" value="${admin_view.admin_nickname}"></td>
				</tr>
				<tr>
				  <td style="width: 150px;" class="table-info"><label class="col-form-label" for="admin_email" style="font-size: large;">&ensp;&ensp;E-Mail(*)</label></td>
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0; font-size: large;" placeholder="이메일을 입력해주세요" id="admin_email" name="admin_email" value="${admin_view.admin_email}"></td>
				</tr>
 				<tr>
				  <td style="width: 150px;" class="table-info"><label class="col-form-label" for="admin_passwd" style="font-size: large;">&ensp;&ensp;비밀번호(*)</label></td>
				  <td>&ensp;&ensp;<input type="password" style="width: 200px; border: 0; font-size: large;" placeholder="비밀번호를 입력해주세요" id="admin_passwd" name="admin_passwd" value="${admin_view.admin_passwd}"></td>
				</tr>
				<tr>
				  <td style="width: 150px;" class="table-info"><label class="col-form-label" for="admin_passwdchk" style="font-size: large;">&ensp;&ensp;비밀번호 확인(*)</label></td>
				  <td>&ensp;&ensp;<input type="password" style="width: 200px; border: 0; font-size: large;" placeholder="비밀번호 확인을 입력해주세요" id="admin_passwdchk" value="${admin_view.admin_passwd}"></td>
				</tr> 
				</table> 
				<br />
				<c:set var="superuser" value="${sessionScope.admin_id}" />
				<c:if test="${superuser eq 'bpfcadmin' || superuser eq 'interlink'}">
				<table class="form-group" border="1" style="width: 500px;">
				<thead>
				  <tr>
				  <td align="center" class="table-info" style="font-size: large;">
				  <label class="col-form-label" style="font-size: large;">권한</label>
				  </td>
				  <td align="center" class="table-info" style="font-size: large;" >목록에서 보여질 항목</td>
				  </tr>
				  </thead>
				  <tr id="obj1">
				    <td colspan="1" width="150px;" style="font-size: large;">&ensp;<input type="checkbox" name="board_id" id="customCheck1" value="1" ><label>&ensp;공지사항</label></td>
				    <td align="center" id="radio1" style="font-size: large;">
					<label >실명&ensp;</label><input type="radio" name="radio1" value="1" onclick="radio_1();" checked="checked" />&ensp;&ensp;&ensp;
					<label >부서&ensp;</label><input type="radio" name="radio1" value="2" onclick="radio_1();" />&ensp;&ensp;&ensp;
					<label >별칭&ensp;</label><input type="radio" name="radio1" value="3" onclick="radio_1();" /> 
					<input type="hidden" name="view_name" id="view_name1" value="1" /> 
					</td>
				  </tr>
 				  <tr id="obj2">
				    <td colspan="1" style="font-size: large;">&ensp;<input type="checkbox" name="board_id" id="customCheck2" value="2"><label>&ensp;BPFC 소식지</label></td>
				    <td align="center" id="radio2" style="font-size: large;">
				    <label >실명&ensp;</label><input type="radio" name="radio2" value="1" onclick="radio_2();" checked="checked" />&ensp;&ensp;&ensp;
					<label >부서&ensp;</label><input type="radio" name="radio2" value="2" onclick="radio_2();" />&ensp;&ensp;&ensp;
					<label >별칭&ensp;</label><input type="radio" name="radio2" value="3" onclick="radio_2();" />
					<input type="hidden" name="view_name" id="view_name2" value="1" /> 
				    </td>
				  </tr>
 				  <tr id="obj3">
				    <td colspan="1" style="font-size: large;">&ensp;<input type="checkbox" name="board_id" id="customCheck3" value="3"><label>&ensp;포토갤러리</label></td>
				    <td align="center" id="radio3" style="font-size: large;">
				    <label >실명&ensp;</label><input type="radio" name="radio3" value="1" onclick="radio_3();" checked="checked" />&ensp;&ensp;&ensp;
					<label >부서&ensp;</label><input type="radio" name="radio3" value="2" onclick="radio_3();" />&ensp;&ensp;&ensp;
					<label >별칭&ensp;</label><input type="radio" name="radio3" value="3" onclick="radio_3();" />
					<input type="hidden" name="view_name" id="view_name3" value="1" />
				    </td>
				  </tr>
				  <tr id="obj4">
				    <td colspan="1" style="font-size: large;">&ensp;<input type="checkbox" name="board_id" id="customCheck4" value="4"><label>&ensp;입찰안내</label></td>
				    <td align="center" id="radio4" style="font-size: large;">
				    <label >실명&ensp;</label><input type="radio" name="radio4" value="1" onclick="radio_4();" checked="checked" />&ensp;&ensp;&ensp;
					<label >부서&ensp;</label><input type="radio" name="radio4" value="2" onclick="radio_4();" />&ensp;&ensp;&ensp;
					<label >별칭&ensp;</label><input type="radio" name="radio4" value="3" onclick="radio_4();" />
					<input type="hidden" name="view_name" id="view_name4" value="1" />
				    </td>
				  </tr>
				  <tr id="obj5">
				    <td colspan="1" style="font-size: large;">&ensp;<input type="checkbox" name="board_id" id="customCheck5" value="5"><label>&ensp;문의사항</label></td>
				    <td align="center" id="radio5" style="font-size: large;">
				    <label >실명&ensp;</label><input type="radio" name="radio5" value="1" onclick="radio_5();" checked="checked" />&ensp;&ensp;&ensp;
					<label >부서&ensp;</label><input type="radio" name="radio5" value="2" onclick="radio_5();" />&ensp;&ensp;&ensp;
					<label >별칭&ensp;</label><input type="radio" name="radio5" value="3" onclick="radio_5();" />
					<input type="hidden" name="view_name" id="view_name5" value="1" />
				    </td>
				  </tr>
				  <tr id="obj6">
				    <td colspan="1" style="font-size: large;">&ensp;<input type="checkbox" name="board_id" id="customCheck6" value="6"><label>&ensp;분실물안내</label></td>
				    <td align="center" id="radio6" style="font-size: large;">
				    <label >실명&ensp;</label><input type="radio" name="radio6" value="1" onclick="radio_6();" checked="checked" />&ensp;&ensp;&ensp;
					<label >부서&ensp;</label><input type="radio" name="radio6" value="2" onclick="radio_6();" />&ensp;&ensp;&ensp;
					<label >별칭&ensp;</label><input type="radio" name="radio6" value="3" onclick="radio_6();" />
					<input type="hidden" name="view_name" id="view_name6" value="1" />
				    </td>
				  </tr>
				  <tr id="obj7">
				    <td colspan="1" style="font-size: large;">&ensp;<input type="checkbox" name="board_id" id="customCheck7" value="7"><label>&ensp;채용안내</label></td>
				    <td align="center" id="radio7" style="font-size: large;">
				    <label >실명&ensp;</label><input type="radio" name="radio7" value="1" onclick="radio_7();" checked="checked" />&ensp;&ensp;&ensp;
					<label >부서&ensp;</label><input type="radio" name="radio7" value="2" onclick="radio_7();" />&ensp;&ensp;&ensp;
					<label >별칭&ensp;</label><input type="radio" name="radio7" value="3" onclick="radio_7();" />
					<input type="hidden" name="view_name" id="view_name7" value="1" />
				    </td>
				  </tr>
				  <tr id="obj8">
				    <td colspan="1" style="font-size: large;">&ensp;<input type="checkbox" name="board_id" id="customCheck8" value="8"><label>&ensp;컨벤션센터</label></td>
				    <td align="center" id="radio8" style="font-size: large;">
				    <label >실명&ensp;</label><input type="radio" name="radio8" value="1" onclick="radio_8();" checked="checked" />&ensp;&ensp;&ensp;
					<label >부서&ensp;</label><input type="radio" name="radio8" value="2" onclick="radio_8();" />&ensp;&ensp;&ensp;
					<label >별칭&ensp;</label><input type="radio" name="radio8" value="3" onclick="radio_8();" />
					<input type="hidden" name="view_name" id="view_name8" value="1" />
				    </td>
				  </tr>
				  <tr id="obj9">
				    <td colspan="1" style="font-size: large;">&ensp;<input type="checkbox" name="board_id" id="customCheck9" value="9"><label>&ensp;자료실</label></td>
				    <td align="center" id="radio9" style="font-size: large;">
				    <label >실명&ensp;</label><input type="radio" name="radio9" value="1" onclick="radio_9();" checked="checked" />&ensp;&ensp;&ensp;
					<label >부서&ensp;</label><input type="radio" name="radio9" value="2" onclick="radio_9();" />&ensp;&ensp;&ensp;
					<label >별칭&ensp;</label><input type="radio" name="radio9" value="3" onclick="radio_9();" />
					<input type="hidden" name="view_name" id="view_name9" value="1" />
				    </td>
				  </tr>
				  <tr id="obj10">
				    <td colspan="1" style="font-size: large;">&ensp;<input type="checkbox" name="board_id" id="customCheck10" value="10"><label>&ensp;단문메시지</label></td>
				    <td align="center" id="radio10" style="font-size: large;" >
					<label style="display: none;">sms</label><input style="display: none;" type="radio" name="radio10" value="0" onclick="radio_10();" checked="checked" />&ensp;&ensp;&ensp;
				    <input type="hidden" name="view_name" id="view_name10" value="0" />
				    </td>
				  </tr>
				</table>
				</c:if>
		</div>
	</form>
	
		<script>
	<c:forEach var="item" items="${authority}" varStatus="status">

    	$("input[name='board_id'][value='${item.board_id}']").attr("checked", "checked");
		
    	$("input[name='radio${item.board_id}'][value='${item.view_name}']").attr("checked", "checked");
    	var chk_val = $("input:radio[name='radio${item.board_id}']:checked").val();
    	$("#view_name${item.board_id}").val(chk_val);
	</c:forEach>
	</script>
			
	<br>
	<div>
	<table style="margin: 0 auto; width: 500px;">
	<tr>
		<td align="left"><button class="btn btn-primary" id="list" name="list">취소</button></td>
		<%-- <c:if test="${admin_id eq null }"> --%>
		<td align="right"><button class="btn btn-primary" id="btnSave" name="btnSave" onclick="detailSubmit(1)">저장</button></td>
		<%-- </c:if> --%>
		</tr>
		</table>
	</div>
	<br />
	<br />
	<br />

</body>
</html>