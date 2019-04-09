<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>인증서</title>
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
						<h2 class="c-lnb__heading">경영혁신</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a href="business-policies.do"
								class="c-lnb__link">경영방침</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="sh-policy.do" class="c-lnb__link">안전보건경영</a></li>
							<li class="c-lnb__item"><a href="service.do"
								class="c-lnb__link">서비스헌장</a></li>
							<li class="c-lnb__item"><a href="disclosure.do"
								class="c-lnb__link">경영공시</a></li>
						</ul>
					</div>
				</div>
				<div class="l-depth3">
					<div class="l-depth3__aligner">
						<h3 class="is-hidden">안전보건경영</h3>
						<ul class="l-depth3__list">
							<li class="l-depth3__item"><a href="sh-policy.do"
								class="l-depth3__link">안전보건경영방침</a></li>
							<li class="l-depth3__item"><a href="sh-system.do"
								class="l-depth3__link">안전보건경영시스템</a></li>
							<li class="l-depth3__item l-depth3__item--active"><a
								href="sh-certificate.do" class="l-depth3__link">인증서</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="c-headings">
				<div class="c-aligner">
					<div class="breadcrumb">
						<ul class="breadcrumb__list">
							<li class="breadcrumb__item breadcrumb__item--home"><div class="breadcrumb__link"><a href="main.do" id="content">홈</a></div></li>
							<li class="breadcrumb__item breadcrumb__item-1"><div
								class="breadcrumb__link">경영혁신</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">안전보건경영</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">인증서</div></li>
						</ul>
					</div>
					<h4 class="c-h2">인증서</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="i-sh-certificate">
						<div class="i-sh-certificate__image">
							<img src="images/innovation/i-sh-certificate__image-1.png"
								alt="안전보건경영시스템 인증서" />
						</div>
						<div class="i-sh-certificate__image">
							<img src="images/innovation/i-sh-certificate__image-2.png"
								alt="CERTIFICATE for KOSHA 18001" />
						</div>
					</div>
				</div>
			</div>
			<!-- // 내용-->
		</div>

		<!-- 바로가기 및 맨위로 -->
		<jsp:include page="../../sub_quick.jsp"></jsp:include>
		<!-- end -->

		<script type="text/javascript">
			var scrollControll = $.superscrollorama({
				reverse : false
			});

			var policyStep = new TimelineLite({
				delay : .1
			});

			scrollControll.addTween('.i-sh-system__boxs', TweenMax.to(
					'.i-sh-system__heading', .5, {
						opacity : 1,
						scale : 1
					}, .2), -200);
			scrollControll.addTween('.i-sh-system__boxs', policyStep.staggerTo(
					'.i-sh-system__item', .5, {
						opacity : 1,
						scale : 1
					}, .2), -200);
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->

	</div>
</body>
</html>