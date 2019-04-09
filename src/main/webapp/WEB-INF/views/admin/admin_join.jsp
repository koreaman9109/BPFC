<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link href="css/board.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 등록</title>
<script type="text/javascript">
 

	$(document).ready(function() {

		$("#list").click(function() {
			if (confirm("목록으로 돌아가시겠습니까? 작성중인 내용은 저장되지 않습니다.") == true) {
				location.href = "admin_list.do";
			} else {
				return;
			}
		});
		

	});
	
	//이중폼 보내는 방법
	 function submit(index) {
			
		    if (index == 1) {
		    	
					if(confirm("사용자를 등록 하시겠습니까?") == true) {
					var email = document.form1.admin_email.value;
					var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
					var msg, ss, cc;
					//비밀번호 입력여부 체크
					if (document.form1.admin_nickname.value == "") {
			            alert("별칭이 입력하지 않았습니다.")
			            document.form1.admin_nickname.focus()

			            return false;

			        }
					//별칠 자릿수 검사
					if (document.form1.admin_nickname.value.length<2 || document.form1.admin_nickname.value.length>12) {
						alert("별칭을 2~12자까지 입력해주세요.")
						document.form1.admin_nickname.focus()
						document.form1.admin_nickname.select()

			            return false;

			        }
					//이메일 입력여부 검사
			        if (document.form1.admin_email.value == "") {
						alert("이메일을 입력하지 않았습니다.");
						document.form1.admin_email.focus()

			            return false;

			        }
					//이메일 유효성 검사
			        if (regex.test(email) === false) {
						alert("잘못된 이메일 형식입니다.");
						document.form1.admin_email.value=""
						document.form1.admin_email.focus()

			            return false;

   			        }
				
			      	//접속권한 체크 여부 확인
					if($('input:checkbox[name="board_id"]').is(":checked") == false)  {
			          
						alert("접속권한을 체크하여 주십시오.");
			            return false;
			          }
			      	
					document.form1.action='admin_insert.do';
					alert("사용자 등록이 완료되었습니다. \n※초기 패스워드는 사번과 동일합니다.");
			      	
					}else{
						alert("취소 되었습니다.");
						return false;
					}
		    	}
		    if (index == 2) {
			      document.form1.action='#';
			}
			    document.form1.submit();
		 };

</script>
<script type="text/javascript">
  /* function employeePopup() { window.open("employee_serach.do", "employeePop", "width=600, height=800, left=100, top=50"); } */
  function employeePopup1() {
	//userid 를 param.
      var admin_id =  $("#admin_id").val(); 

      
      
      $.ajax({
          async: true,
          type : 'POST',
          data : admin_id,
          url : "nocheck.do",
          dataType : "json",
          contentType: "application/json; charset=UTF-8",
          success : function(data) {
          	
          	if (data.cnt > 0) {
          		 $.ajax({
          	          async: true,
          	          type : 'POST',
          	          data : admin_id,
          	          url : "idcheck.do",
          	          dataType : "json",
          	          contentType: "application/json; charset=UTF-8",
          	          success : function(data) {

          	          	if (data.cnt > 0) {
          	       		alert("이미 계정이 생성된 사번입니다.");
          	     		$("#admin_id").focus();
          				}else{
          					if(confirm("신규 사용자로 등록가능한 사번 입니다. 신규 사용자등록을 하시겠습니까?") == true) {	
          					location.href = "admin_join.do?board_id=10&board_id2=7&bpfc_no="+ admin_id;
          					}else{
          					return false;
          					}
          				}
          	          },
          	          error : function(error) {
          	              
          	              alert("error : " + error);
          	          }
          	      });  
          		      
              }else{

                  alert("등록된 사번이 아닙니다."); 
          		  $("#admin_id").focus();
                  
                  
              }
          	
          	
          	
          },
          error : function(error) {
              
              alert("error : " + error);
          }
      });
      

     

	  }
  function 	searchAlert() {
	  alert("조회를 통해 입력해주세요.");
	  }
  function 	reset() {
	  if(confirm("다시 작성 하시겠습니까? 기존 작성된 내용은 사라집니다.") == true) {
	  location.href = "admin_join.do?board_id=10&board_id2=7";  
	  }else{
	  return false;	  
	  }}
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
 
 $(document).ready(function(){
	   $("#customCheck1").change(function(){
	        if($("#customCheck1").is(":checked")){
			    $('#radio1').append('<label >실명&ensp;</label><input type="radio" name="radio1" value="1" checked="checked" onclick="radio_1();"/>&ensp;&ensp;&ensp;'+
	    					'<label >부서&ensp;</label><input type="radio" name="radio1" value="2" onclick="radio_1();" />&ensp;&ensp;&ensp;'+
	    					'<label >별칭&ensp;</label><input type="radio" name="radio1" value="3" onclick="radio_1();" />' +
	    					'<input type="hidden" name="view_name" id="view_name1" value="1" />' );

	        }else{
	            $('#radio1').append($("#radio1").empty())
	        }
	    });
	    $("#customCheck2").change(function(){
	        if($("#customCheck2").is(":checked")){
			    $('#radio2').append('<label >실명&ensp;</label><input type="radio" name="radio2" value="1" checked="checked" onclick="radio_2();" />&ensp;&ensp;&ensp;'+
	    					'<label >부서&ensp;</label><input type="radio" name="radio2" value="2" onclick="radio_2();" />&ensp;&ensp;&ensp;'+
	    					'<label >별칭&ensp;</label><input type="radio" name="radio2" value="3" onclick="radio_2();" />' +
	    					'<input type="hidden" name="view_name" id="view_name2" value="1" />' );
	        }else{
	            $('#radio2').append($("#radio2").empty())
	        }
	    });
	    $("#customCheck3").change(function(){
	        if($("#customCheck3").is(":checked")){
			    $('#radio3').append('<label >실명&ensp;</label><input type="radio" name="radio3" value="1" checked="checked" onclick="radio_3();" />&ensp;&ensp;&ensp;'+
	    					'<label >부서&ensp;</label><input type="radio" name="radio3" value="2" onclick="radio_3();" />&ensp;&ensp;&ensp;'+
	    					'<label >별칭&ensp;</label><input type="radio" name="radio3" value="3" onclick="radio_3();" />' +
	    					'<input type="hidden" name="view_name" id="view_name3" value="1" />' );
	        }else{
	            $('#radio3').append($("#radio3").empty())
	        }
	    });
	    $("#customCheck4").change(function(){
	        if($("#customCheck4").is(":checked")){
			    $('#radio4').append('<label >실명&ensp;</label><input type="radio" name="radio4" value="1" checked="checked" onclick="radio_4();" />&ensp;&ensp;&ensp;'+
	    					'<label >부서&ensp;</label><input type="radio" name="radio4" value="2" onclick="radio_4();" />&ensp;&ensp;&ensp;'+
	    					'<label >별칭&ensp;</label><input type="radio" name="radio4" value="3" onclick="radio_4();" />' +
	    					'<input type="hidden" name="view_name" id="view_name4" value="1" />' );
	        }else{
	            $('#radio4').append($("#radio4").empty())
	        }
	    });
	    $("#customCheck5").change(function(){
	        if($("#customCheck5").is(":checked")){
			    $('#radio5').append('<label >실명&ensp;</label><input type="radio" name="radio5" value="1" checked="checked" onclick="radio_5();" />&ensp;&ensp;&ensp;'+
	    					'<label >부서&ensp;</label><input type="radio" name="radio5" value="2" onclick="radio_5();" />&ensp;&ensp;&ensp;'+
	    					'<label >별칭&ensp;</label><input type="radio" name="radio5" value="3" onclick="radio_5();" />' +
	    					'<input type="hidden" name="view_name" id="view_name5" value="1" />' );
	        }else{
	            $('#radio5').append($("#radio5").empty())
	        }
	    });
	    $("#customCheck6").change(function(){
	        if($("#customCheck6").is(":checked")){
			    $('#radio6').append('<label >실명&ensp;</label><input type="radio" name="radio6" value="1" checked="checked" onclick="radio_6();" />&ensp;&ensp;&ensp;'+
	    					'<label >부서&ensp;</label><input type="radio" name="radio6" value="2" onclick="radio_6();" />&ensp;&ensp;&ensp;'+
	    					'<label >별칭&ensp;</label><input type="radio" name="radio6" value="3" onclick="radio_6();" />' +
							'<input type="hidden" name="view_name" id="view_name6" value="1" />' );
	        }else{
	            $('#radio6').append($("#radio6").empty())
	        }
	    });
	    $("#customCheck7").change(function(){
	        if($("#customCheck7").is(":checked")){
			    $('#radio7').append('<label >실명&ensp;</label><input type="radio" name="radio7" value="1" checked="checked" onclick="radio_7();"  />&ensp;&ensp;&ensp;'+
	    					'<label >부서&ensp;</label><input type="radio" name="radio7" value="2" onclick="radio_7();" />&ensp;&ensp;&ensp;'+
	    					'<label >별칭&ensp;</label><input type="radio" name="radio7" value="3" onclick="radio_7();" />' +
							'<input type="hidden" name="view_name" id="view_name7" value="1" />' );
	        }else{
	            $('#radio7').append($("#radio7").empty())
	        }
	    });
	    $("#customCheck8").change(function(){
	        if($("#customCheck8").is(":checked")){
			    $('#radio8').append('<label >실명&ensp;</label><input type="radio" name="radio8" value="1" checked="checked" onclick="radio_8();" />&ensp;&ensp;&ensp;'+
	    					'<label >부서&ensp;</label><input type="radio" name="radio8" value="2" onclick="radio_8();" />&ensp;&ensp;&ensp;'+
	    					'<label >별칭&ensp;</label><input type="radio" name="radio8" value="3" onclick="radio_8();" />' +
							'<input type="hidden" name="view_name" id="view_name8" value="1" />' );
	        }else{
	            $('#radio8').append($("#radio8").empty())
	        }
	    });
	    $("#customCheck9").change(function(){
	        if($("#customCheck9").is(":checked")){
			    $('#radio9').append('<label >실명&ensp;</label><input type="radio" name="radio9" value="1" checked="checked" onclick="radio_9();" />&ensp;&ensp;&ensp;'+
	    					'<label >부서&ensp;</label><input type="radio" name="radio9" value="2" onclick="radio_9();" />&ensp;&ensp;&ensp;'+
	    					'<label >별칭&ensp;</label><input type="radio" name="radio9" value="3" onclick="radio_9();" />' +
							'<input type="hidden" name="view_name" id="view_name9" value="1" />' );
	        }else{
	            $('#radio9').append($("#radio9").empty())
	        }
	    });
	});




 </script>
</head>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	
	<jsp:include page="../setting_submenu.jsp"></jsp:include>
	<form name="form1" method="post">
		<div align="center" style="margin: 0 auto; width: 500px; padding-top: 100px; ">
			
				<div>
				<c:if test="${employeeView.bpfc_no eq null}">
				<br /><br /><br /><br /><br /><br /><br />
				<h1>신규 사용자 등록</h1>
				<br />
				<table style="border: 0;">
				<tr>
				  <td style="width: 80px;"><label style="font-size: large;" class="col-form-label" for="admin_id">사번</label></td>	  
				  <td><input type="text"  style="width: 350px;" placeholder="  사번을 입력해주세요." id="admin_id" name="admin_id"></td><td>&ensp;<input type="button" class="btn btn-primary" onclick="employeePopup1();" value="조&ensp;회" /></td>
				</tr>
				</table>
				</c:if>
		<!--    <button id="idck" type="button" class="btn btn-default">중복확인</button> -->  
				<c:if test="${employeeView.bpfc_no ne null}">
				<h1>신규 사용자 등록</h1>
				<br>
				<table border="1" style="border-color: gray; width: 500px" >
				<tr style="font-size: large;">
				  <td style="width: 150px; " class="table-info">&ensp;&ensp;<label class="col-form-label" for="admin_id">사번(*)</label></td>	  
				  <td>&ensp;&ensp;<input type="text"  style="width: 200px; border: 0;" placeholder="사번 입력해주세요" id="admin_id" name="admin_id" readonly value="${employeeView.bpfc_no}"></td>
				</tr>
				<tr style="font-size: large;">
				  <td style="width: 150px;" class="table-info">&ensp;&ensp;<label class="col-form-label" for="admin_name">성명</label></td>
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0;" placeholder="성명을 입력해주세요" id="admin_name" name="admin_name" readonly value="${employeeView.bpfc_name}"></td>
				</tr>
				<tr style="font-size: large;">
				   <td style="width: 150px;" class="table-info">&ensp;&ensp;<label class="col-form-label" for="admin_rank">직급</label></td> 
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0;" placeholder="직급을 입력해주세요" id="admin_rank" name="admin_rank" readonly value="${employeeView.bpfc_rank}"></td>
				</tr>
				<tr style="font-size: large;">
				  <td style="width: 150px;" class="table-info">&ensp;&ensp;<label class="col-form-label" for="admin_department">부서</label></td>
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0;" placeholder="담당 부서를 입력해주세요" id="admin_department" name="admin_department" readonly value="${employeeView.bpfc_department}"></td>
				</tr>
				<tr style="font-size: large;">
				  <td style="width: 150px;" class="table-info">&ensp;&ensp;<label class="col-form-label" for="admin_task">업무</label></td>
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0;" id="admin_task" name="admin_task" readonly value="${employeeView.bpfc_task}"></td>
				</tr>
				<tr style="font-size: large;">
				   <td style="width: 150px;" class="table-info">&ensp;&ensp;<label class="col-form-label" for="admin_nickname">별칭(*)</label></td> 
				  <td>&ensp;&ensp;<input type="text" style="width: 200px; border: 0;" placeholder="ex)관리자, 운영자" id="admin_nickname" name="admin_nickname"></td>
				</tr>
				<tr style="font-size: large;">
				  <td style="width: 150px;" class="table-info">&ensp;&ensp;<label class="col-form-label" for="admin_email">E-Mail(*)</label></td>
				  <td>&ensp;&ensp;<input type="email" style="width: 200px; border: 0;" placeholder="이메일을 입력해주세요" id="admin_email" name="admin_email"><br />
				  		<input type="hidden" style="width: 200px; border: 0;" placeholder="비밀번호를 입력해주세요" id="admin_passwd" name="admin_passwd" value="${employeeView.bpfc_no}">
				  </td>
				</tr>
				</table>
				<br />  
				</c:if>
				<c:if test="${employeeView.bpfc_no ne null}">
				<table class="form-group" border="1"   style="width: 500px; border-color: gray;">
				<thead>
				  <tr style="font-size: large;">
				  <td align="center" class="table-info">권한</td>
				  <td align="center" class="table-info">목록에서 보여질 항목</td>
				  </tr>
				  </thead>
				  <tr style="font-size: large;">
				    <td colspan="1" style="width: 150px;">&ensp;<input type="checkbox" name="board_id" id="customCheck1" value="1" ><label>&ensp;공지사항</label></td>
				    <td align="center" id="radio1">
				    </td>
				  </tr>
 				  <tr style="font-size: large;">
				    <td colspan="1">&ensp;<input type="checkbox" name="board_id" id="customCheck2" value="2"><label>&ensp;BPFC 소식지</label></td>
				    <td align="center" id="radio2">
				    </td>
				  </tr>
 				  <tr style="font-size: large;">
				    <td colspan="1">&ensp;<input type="checkbox" name="board_id" id="customCheck3" value="3"><label>&ensp;포토갤러리</label></td>
				    <td align="center" id="radio3">
				    </td>
				  </tr>
				  <tr style="font-size: large;">
				    <td colspan="1">&ensp;<input type="checkbox" name="board_id" id="customCheck4" value="4"><label>&ensp;입찰안내</label></td>
				    <td align="center" id="radio4">
				    </td>
				  </tr>
				  <tr style="font-size: large;">
				    <td colspan="1">&ensp;<input type="checkbox" name="board_id" id="customCheck5" value="5"><label>&ensp;문의사항</label></td>
				    <td align="center" id="radio5">
				    </td>
				  </tr>
				  <tr style="font-size: large;">
				    <td colspan="1">&ensp;<input type="checkbox" name="board_id" id="customCheck6" value="6"><label>&ensp;분실물안내</label></td>
				    <td align="center" id="radio6">
				    </td>
				  </tr>
				  <tr style="font-size: large;">
				    <td colspan="1">&ensp;<input type="checkbox" name="board_id" id="customCheck7" value="7"><label>&ensp;채용안내</label></td>
				    <td align="center" id="radio7">
				    </td>
				  </tr>
				  <tr style="font-size: large;">
				    <td colspan="1">&ensp;<input type="checkbox" name="board_id" id="customCheck8" value="8"><label>&ensp;컨벤션센터</label></td>
				    <td align="center" id="radio8">
				    </td>
				  </tr>
				  <tr style="font-size: large;">
				    <td colspan="1">&ensp;<input type="checkbox" name="board_id" id="customCheck9" value="9"><label>&ensp;자료실</label></td>
				    <td align="center" id="radio9">
				    </td>
				  </tr>
				  <tr style="font-size: large;">
				    <td colspan="1">&ensp;<input type="checkbox" name="board_id" id="customCheck10" value="10"><label>&ensp;단문메시지</label></td>
				    <td align="center" id="radio10">
				    <input type="hidden" name="view_name" id="view_name10" value="0" />
				    </td>
				  </tr>
				</table>
				</c:if>

				</div>
			</div>
			</form>
		<br>
		<div>
			<table style="margin: 0 auto; width: 500px;">
			<tr>
			<c:if test="${employeeView.bpfc_no ne null}">
			<td align="left">
			<button type="button" class="btn btn-primary" id="list" name="list">목록</button>
			<button type="button" class="btn btn-warning" id="btnSave" onclick="reset()">다시 작성</button>
			</td>
			<td align="right">
			<button type="button" class="btn btn-primary" id="btnSave" onclick="submit(1)">저장</button>
			</td>
			</c:if>
			<tr>
			</table>
		</div>
		<br /><br /><br /><br /><br />
</body>
</html>