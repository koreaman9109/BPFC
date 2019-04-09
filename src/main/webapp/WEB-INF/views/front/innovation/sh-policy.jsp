<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>안전보건경영</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#innovation_na').parent().addClass('m-gnb__item--active');
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
						<h2 class="c-lnb__heading">정보공시</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a href="policy.do"
								class="c-lnb__link">정관</a></li>
							<li class="c-lnb__item"><a href="licensing.do"
								class="c-lnb__link">인허가사항</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="sh-policy.do" class="c-lnb__link">안전보건경영</a></li>
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
								class="breadcrumb__link">정보공시</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">안전보건경영</div></li>
						</ul>
					</div>
					<h4 class="c-h2">안전보건경영</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="i-sh-certificate">
					<div class="i-sh-certificate__images">
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
				<div class="i-sh-policy">
					<div class="c-aligner">
						<div class="i-sh-policy__heading">(사)부산항시설관리센터는</div>
						<div class="i-sh-policy__box">
							<div class="i-sh-policy__txts">
								<div class="i-sh-policy__txt">
									인간존중의 기업이념 하에 <em class="i-sh-policy__em">안전보건을 최우선</em> 과제로
									설정, <br />직원의 건강을 보호하고 행복을 영위하기 위한 안전하고<br /> 쾌적한 근무환경을 조성하는데
									최선을 다 한다.
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="i-sh-policy__steps">
					<div class="c-aligner">
						<div class="i-sh-policy__step">이를 위하여 전 임직원은</div>
						<ul class="i-sh-policy__list">
							<li class="i-sh-policy__item i-sh-policy__item-1">
								<div class="i-sh-policy__num">1</div>
								<div class="i-sh-policy__cont">직원 및 고객의 안전보건 유지&middot;증진을
									최우선 목표로 선전하고 실천한다.</div>
							</li>
							<li class="i-sh-policy__item i-sh-policy__item-2">
								<div class="i-sh-policy__num">2</div>
								<div class="i-sh-policy__cont">
									안전보건에 <br />관한 법규와 회사규정을 철저히 준수한다.
								</div>
							</li>
							<li class="i-sh-policy__item i-sh-policy__item-3">
								<div class="i-sh-policy__num">3</div>
								<div class="i-sh-policy__cont">
									안전보건경영 체제를 효과적으로 실행하기 위하여 <br />지속적인 개선을<br />통한 불안전요소를 <br />최소화한다.
								</div>
							</li>
							<li class="i-sh-policy__item i-sh-policy__item-4">
								<div class="i-sh-policy__num">4</div>
								<div class="i-sh-policy__cont">안전보건경영방침을 당사의 최우선가치로 인식하며
									실천한다.</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="i-sh-system">
					<div class="c-aligner">
						<div class="i-sh-system__txt">
							(사)부산항시설관리센터는 다중이 이용하는 시설을 과학적이고 체계적인 자율안전보건경영관리를 위하여 항만시설관리법인
							최초로 안전보건경영시스템(KOSHA18001)을 취득하였습니다. (사)부산항시설관리센터는
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

			TweenMax.to('.i-sh-policy__box', 1, {
				delay : .4,
				opacity : 1,
				ease : Circ.easeOut
			}, .5)
			scrollControll.addTween('.i-sh-policy__steps', policyStep
					.staggerTo('.i-sh-policy__item', .5, {
						opacity : 1,
						scale : 1
					}, .2), -200);
			
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