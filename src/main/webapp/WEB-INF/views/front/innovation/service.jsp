<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>서비스헌장</title>
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
							<li class="c-lnb__item"><a href="sh-policy.do"
								class="c-lnb__link">안전보건경영</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="service.do" class="c-lnb__link">서비스헌장</a></li>
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
								class="breadcrumb__link">서비스헌장</div></li>
						</ul>
					</div>
					<h3 class="c-h2">서비스헌장</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="i-service">
						<h3 class="i-service__heading">잘못된서비스에대한시정</h3>
						<ul class="i-service__list">
							<li class="i-service__item">
								<div class="i-service__key">즉각 시정하겠습니다. 연락 주십시오.</div>
								<div class="i-service__value">1. 전화 불친절, 민원업무 소홀, 업무 고의지연,
									복장용모자세불량, 서비스 불만족, 금품요구 등은 연락 주시면 조치하겠습니다.</div>
							</li>
							<li class="i-service__item">
								<div class="i-service__key">서비스 질이 만족하지 못하면 연락 주십시오.</div>
								<div class="i-service__value">1. 업무분야별로 서비스에 만족을 느낄 수 없을
									때에는 상세히 기록 주시면 시정하겠습니다.</div>
							</li>
							<li class="i-service__item">
								<div class="i-service__key">중대한 과실은 조치하겠습니다. 연락 주십시오.</div>
								<div class="i-service__value">1. 부두나 터미널 이용 과정에서 불미스러운 사례가
									누적된 경우에는 즉각 조사하여 신분상 불이익 처분하고 조치 결과를 알려 드리겠습니다.</div>
							</li>
							<li class="i-service__item">
								<div class="i-service__key">연락주실 곳</div>
								<div class="i-service__value">운영지원부장 400-3112, FAX,
									464-6154.</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- // 내용-->
		</div>
		<!-- 바로가기 및 맨위로 -->
		<jsp:include page="../../sub_quick.jsp"></jsp:include>
		<!-- end -->
		<script type="text/javascript">
			var policyItem = new TimelineLite({
				delay : .2
			});
			policyItem.staggerTo('.i-service__item', .5, {
				top : 0,
				opacity : 1
			}, .4);
		</script>
		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>