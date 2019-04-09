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
<title>문의사항 등록 알림설정</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	function admin_sms_bt() {
		var con_test = confirm("저장하시겠습니까?"); 
		var checkedValue = $("input[type=radio][name=USE_YN]:checked").val();
		
		
		if(con_test == true){
			
			
			if (checkedValue == "N") {
				$("#phone1").val('010');
				$("#phone2").val('1234');
				$("#phone3").val('1234');
				document.admin_sms_save.submit();
			  	alert("알림 받을 휴대폰번호가 초기화 되었습니다.");
			}else{
				if (document.admin_sms_save.phone1.value == "") {
		            alert("휴대폰번호 앞자리를 입력해주세요.")
		            document.admin_sms_save.phone1.focus()

		            return false;

		        }
				if (document.admin_sms_save.phone2.value == "") {
		            alert("휴대폰번호 가운데 자리를 입력해주세요.")
		            document.admin_sms_save.phone2.focus()

		            return false;

		        }
				if (document.admin_sms_save.phone3.value == "") {
		            alert("휴대폰번호 끝 자리를 입력해주세요.")
		            document.admin_sms_save.phone3.focus()

		            return false;

		        }
				document.admin_sms_save.submit();
			  	alert("입력하신 번호가 저장 되었습니다.");
			} 
				
			}else if(con_test == false){
			  alert("저장이 취소 되었습니다.");
			  location.href = "admin_sms.do";	  
			}
	}
	$(document).ready(function() {
		var i = $("#insert_update").val();
		if (i == 1) {
			$("#insert_update").val("U");
		} else {
			$("#insert_update").val("I");
		}
		var j = $("#USE_YN_hidden").val();
		if (j == "Y") {
			$("#USE_YN_ch_Y").attr("checked", true);
		} else {
			$("#USE_YN_ch_N").attr("checked", true);
		}
	});
</script>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<div class="left" style="height: 100%;">
		<jsp:include page="../setting_submenu.jsp"></jsp:include>
	</div>
	<div align="center"
		style="padding-top: 100px; padding-left: 200px; width: auto;">
		<h1>문의사항 등록 알림설정</h1>

		<br /> <br />
		<form action="admin_sms_save.do" name="admin_sms_save" method="post">

			문의사항 새 글 알림을 sms로 받아보시겠습니까? <br /> <br /> <input type="radio"
				value="Y" name="USE_YN" id="USE_YN_ch_Y" />예 &nbsp; <input
				type="radio" value="N" name="USE_YN" id="USE_YN_ch_N" />아니오 <br />
			<br /> <input type="text" value="" placeholder="${dddddddddddd.phone1 }" name="phone1" id="phone1" />
			- <input type="text" value="" name="phone2" id="phone2" placeholder="${dddddddddddd.phone2 }" />
			- <input type="text" value="" name="phone3" id="phone3" placeholder="${dddddddddddd.phone3 }" />
			<br /> <br /> <input type="hidden" value="${dddddddddddd.no }"
				id="insert_update" name="insert_update" /> <input type="hidden"
				value="${dddddddddddd.USE_YN }" id="USE_YN_hidden" />

		</form>
		<br /> <br /> <input type="button" value="저장" class="btn btn-primary"
			onclick="admin_sms_bt();">
	</div>

</body>
</html>