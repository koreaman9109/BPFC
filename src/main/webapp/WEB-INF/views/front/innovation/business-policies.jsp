<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>경영방침</title>
</head>
<body>
	<jsp:include page="../../banner.jsp"></jsp:include>
	<div class="c-wrap">
		<jsp:include page="../../sub_topmenu.jsp"></jsp:include>

		<div class="c-container">
			<div class="c-lnbs">
				<div class="c-lnb">
					<div class="c-lnb__aligner">
						<h2 class="c-lnb__heading">경영혁신</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item c-lnb__item--active"><a
								href="business-policies.do" class="c-lnb__link">경영방침</a></li>
							<li class="c-lnb__item"><a href="sh-policy.do"
								class="c-lnb__link">안전보건경영</a></li>
							<li class="c-lnb__item"><a href="service.do"
								class="c-lnb__link">서비스헌장</a></li>
							<li class="c-lnb__item"><a href="disclosure.do"
								class="c-lnb__link">경영공시</a></li>
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
								class="breadcrumb__link">경영방침</div></li>
						</ul>
					</div>
					<h3 class="c-h2">경영방침</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="i-policy">
						<div class="i-policy__txt">
							"기본에 충실한경영으로 고객의 신뢰를 얻을 수 있는<br />경영을 하도록 노력 하겠습니다."
						</div>
						<div class="i-policy__aligner">
							<h3 class="i-policy__heading">
								<img src="images/innovation/i-policy__heading.png"
									alt="BPFC 경영방침" />
							</h3>
							<ul class="i-policy__list">
								<li class="i-policy__item i-policy__item-1">
									<div class="i-policy__key">안전확인</div>
									<div class="i-policy__value">
										항상 고객의 안전을 최우선으로 생각하며<br /> 지속적인 안전강화에 힘쓰겠습니다
									</div>
								</li>
								<li class="i-policy__item i-policy__item-2">
									<div class="i-policy__key">고객감동</div>
									<div class="i-policy__value">
										항상 고객의 마음을 미리 헤아려<br />최고의 서비스를 제공 하도록 노력하겠습니다
									</div>
								</li>
								<li class="i-policy__item i-policy__item-3">
									<div class="i-policy__key">협업&middot;소통</div>
									<div class="i-policy__value">
										언제나 열린 경영으로 여러분의 소리에<br />귀 기울이겠습니다
									</div>
								</li>
								<li class="i-policy__item i-policy__item-4">
									<div class="i-policy__key">역량강화</div>
									<div class="i-policy__value">
										BPFC의 시설 서비스를 한층 더 강화시켜 부산항을<br />세계 최고의 항만으로 성장하는데 기여하겠습니다
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- // 내용-->
		</div>

		<jsp:include page="../../sub_quick.jsp"></jsp:include>


		<script type="text/javascript">
			var scrollControll = $.superscrollorama({
				reverse : false
			});

			var policyItem = new TimelineLite({
				delay : .3
			});

			TweenMax.to('.i-policy__txt', 1, {
				delay : .4,
				top : 0,
				opacity : 1,
				ease : Circ.easeOut
			}, .2)
			scrollControll.addTween('.i-policy', policyItem.staggerTo(
					'.i-policy__item', .5, {
						opacity : 1
					}, .2));
		</script>
		<jsp:include page="../../footer.jsp"></jsp:include>

	</div>
</body>
</html>