<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>안전보건경영시스템</title>
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
								href="sh-policy" class="c-lnb__link">안전보건경영</a></li>
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
							<li class="l-depth3__item l-depth3__item--active"><a
								href="sh-system.do" class="l-depth3__link">안전보건경영시스템</a></li>
							<li class="l-depth3__item"><a href="sh-certificate.do"
								class="l-depth3__link">인증서</a></li>
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
								class="breadcrumb__link">안전보건경영시스템</div></li>
						</ul>
					</div>
					<h4 class="c-h2">안전보건경영시스템</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="i-sh-system">
						<div class="i-sh-system__txt">
							(사)부산항시설관리센터는 다중이 이용하는 시설을 과학적이고 체계적인 자율안전보건경영관리를 위하여 항만시설관리법인
							최초로 안전보건경영시스템(KOSHA18001)을 취득하였습니다. <br /> (사)부산항시설관리센터는
							계획수립(P), 실행 및 운영(D), 시정조치 및 경영자검토(A)의 순으로 잠재적인 위험을 지속적으로
							발견&middot;개선을 통해 항만시설 이용고객에게 보다 높은 안전보건 서비스를 제공하겠습니다.
						</div>

						<div class="i-sh-system__boxs">
							<div class="i-sh-system__heading">지속적 개선</div>
							<div class="i-sh-system__list">
								<div class="i-sh-system__item i-sh-system__item-1">
									<div class="i-sh-system__box">안전보건방침</div>
								</div>
								<div class="i-sh-system__item i-sh-system__item-2">
									<div class="i-sh-system__box">
										계획수립
										<ul class="i-sh-system__steps">
											<li class="i-sh-system__step">1. 위험성평가</li>
											<li class="i-sh-system__step">2. 법규 등 검토</li>
											<li class="i-sh-system__step">3. 목표</li>
											<li class="i-sh-system__step">4. 안전보건활동추진계획</li>
										</ul>
									</div>
								</div>
								<div class="i-sh-system__item i-sh-system__item-3">
									<div class="i-sh-system__box">
										실행 및 운영
										<ul class="i-sh-system__steps">
											<li class="i-sh-system__step">1. 구조 및 책임</li>
											<li class="i-sh-system__step">2. 교육훈련 및 자격</li>
											<li class="i-sh-system__step">3. 의사소통 및 정보제공</li>
											<li class="i-sh-system__step">4. 문서화</li>
											<li class="i-sh-system__step">5. 문서관리</li>
											<li class="i-sh-system__step">6. 운영관리</li>
											<li class="i-sh-system__step">7. 비상시 대비 및 대응</li>
										</ul>
									</div>
								</div>
								<div class="i-sh-system__item i-sh-system__item-4">
									<div class="i-sh-system__box">
										점검 및 시정조치
										<ul class="i-sh-system__steps">
											<li class="i-sh-system__step">1. 성과측정 및 모니터링</li>
											<li class="i-sh-system__step">2. 시정조치 및 예방조치</li>
											<li class="i-sh-system__step">3. 기록</li>
											<li class="i-sh-system__step">4. 내부심사</li>
										</ul>
									</div>
								</div>
								<div class="i-sh-system__item i-sh-system__item-5">
									<div class="i-sh-system__box">경영자검토</div>
								</div>
							</div>
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