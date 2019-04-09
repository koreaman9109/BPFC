<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="nice_in.jsp"%>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>알림서비스</title>
<script type="text/javascript">
	function fnPopup() {
		window.name = "Parent_window";
		window
				.open(
						'nice_iframe2.do',
						'popupChk',
						'width=500, height=700, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	}
	function support_go_in() {
		document.nice_ac2.submit();
	}
</script>
<script type="text/javascript">
$(document).ready(function() {
	$('#recruit_na').parent().addClass('m-gnb__item--active');
});
</script>
</head>
<body>
	<!-- 배너방 -->
	<jsp:include page="../../banner.jsp"></jsp:include>
	<!-- end -->
	<div class="c-wrap">
		<!-- 상단메뉴 -->
		<jsp:include page="../../sub_topmenu.jsp"></jsp:include>
		<!-- end -->

		<div class="c-container">
			<div class="c-lnbs">
				<div class="c-lnb">
					<div class="c-lnb__aligner">
						<h2 class="c-lnb__heading">채용정보</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a href="public.do"
								class="c-lnb__link">채용공고</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="notice-service1.do" class="c-lnb__link">알림서비스</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="c-headings">
				<div class="c-aligner">
					<div class="breadcrumb">
						<ul class="breadcrumb__list">
							<li class="breadcrumb__item breadcrumb__item--home"><div
									class="breadcrumb__link">
									<a href="main.do" id="content">홈</a>
								</div></li>
							<li class="breadcrumb__item breadcrumb__item-1"><div
									class="breadcrumb__link">채용정보</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
									class="breadcrumb__link">알림서비스</div></li>
						</ul>
					</div>
					<h3 class="c-h2">알림서비스</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="r-service">
					<div class="r-service__txt">
						부산항시설관리센터에서 처리하는 모든SMS 알림 서비스를 받아 보실 수 있습니다.<br> 본 서비스는 핸드폰
						본인인증 완료 후 이용 가능합니다.
						<center>
							<button class="c-button c-button--middle c-button--blue" onclick="javascript:fnPopup();">인증하기</button>
						</center>
					</div>
				</div>
			</div>
		</div>
		<form action="nice_ac2.do" name="nice_ac2" method="post">
			<input type="hidden" value="" name="name2" id="name2" /> <input
				type="hidden" value="" name="mobileno2" id="mobileno2" />
		</form>
		<!-- // 내용-->

		<!-- 바로가기 및 맨위로 -->
		<jsp:include page="../../sub_quick.jsp"></jsp:include>
		<!-- end -->

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>
