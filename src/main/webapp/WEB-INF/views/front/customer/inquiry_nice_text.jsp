<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html lang="ko">
<head>
<%@ include file="inquiry_nice_su.jsp"%>
<%@ include file="../../home_include.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>popupChk</title>
<script type="text/javascript">

	function chk_ok() {
		var i = $("#name").val();
		var j = $("#mobileno").val();
		$("#name2", parent.opener.document).val(i);
		$("#mobileno2", parent.opener.document).val(j);
		window.parent.opener.inquiry_go_in();
		window.parent.init();
	}

</script>
<style type="text/css">
.c-form__input{
	padding-left: 50px;
	width: 250px;
}
</style>
</head>
<body onload="chk_ok();">
	<div class="c-box">
		<div class="c-table2">
			<div class="c-table2__item">
				<div class="c-table2__key">이름</div>
				<div class="c-table2__value">
					<div class="c-form--middle c-form">
						<label for="c-name" class="c-form__label">이름</label> <input
							type="text" id="name" value="<%=sName%>" class="c-form__input" />
					</div>
				</div>
			</div>
			<div class="c-table2__item">
				<div class="c-table2__key">번호</div>
				<div class="c-table2__value">
					<div class="c-form--middle c-form">
						<label for="c-name" class="c-form__label">번호</label> <input
							type="text" id="mobileno" value="<%=sMobileNo%>"
							class="c-form__input" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>