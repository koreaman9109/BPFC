<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="inquiry_nice_in.jsp"%>
<%@ include file="../../home_include.jsp"%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function goNice() {
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.submit();
	}
</script>
<style type="text/css">
</style>
</head>
<body class="popgo">
	<form name="form_chk" method="post">
		<input type="hidden" name="m" value="checkplusSerivce"> <input
			type="hidden" name="EncodeData" value="<%=sEncData%>">
	</form>
	<div class="s-phone">
		<div class="s-phone__aligner">
			<div class="s-phone__txt">휴대폰 본인 인증</div>
			<div class="s-phone__button">
				<div class="c-buttons c-buttons--center">
					<button class="c-button c-button--full c-button--blue" onclick="goNice()">인증하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>