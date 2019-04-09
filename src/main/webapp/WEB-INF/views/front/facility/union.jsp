<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>공용부두 화물관리 소개</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#facility_na').parent().addClass('m-gnb__item--active');
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
						<h2 class="c-lnb__heading">주요관리시설</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a
								href="international.do" class="c-lnb__link">부산항 여객터미널</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="union.do"
								class="c-lnb__link">공용부두 화물관리</a></li>
							<li class="c-lnb__item"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설관리</a></li>
							<li class="c-lnb__item"><a href="convention.do"
								class="c-lnb__link">부산항국제전시컨벤션센터</a></li>
							<li class="c-lnb__item"><a href="bisc.do"
								class="c-lnb__link">국제선용품유통센터</a></li>
							<li class="c-lnb__item"><a href="leisure.do"
								class="c-lnb__link">항만레저시설</a></li>
							<li class="c-lnb__item"><a href="etc.do"
								class="c-lnb__link">기타항만시설관리</a></li>
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
								class="breadcrumb__link">주요관리시설</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">공용부두 화물관리</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">소개</div></li>
						</ul>
					</div>
					<h3 class="c-h2">공용부두 화물관리</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-union">
						<h4 class="is-hidden">공용부두 화물관리 소개</h4>
						<ul class="c-tabs">
							<li class="c-tab c-tab--active"><a
								href="union.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="union_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab"><a href="union_3.do"
								class="c-link">화물요율표</a></li>
						</ul>
						
						<div class="f-infos f-infos--3">
							<div class="f-info__section f-info__section-1">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/fu-info__image-1.png" alt="국제여객터미널 CY 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">국제여객터미널 CY</div>
										<ul class="f-list2">
											<li class="f-list2__item">2015년 8월에 설치 및 운영</li>
											<li class="f-list2__item">한일정기선 수출입화물 처리 및 컨테이너 야적장</li>
											<li class="f-list2__item">보세창고(488㎡)운영 및 야드장(5,026㎡)관리</li>
											<li class="f-list2__item">주요 하역사의 다양한 공용화물 처리</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="f-info__section f-info__section-2">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/fu-info__image-2.png" alt="북항 공용부두 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">북항 공용부두</div>
										<ul class="f-list2">
											<li class="f-list2__item">2007년 4월 개장</li>
											<li class="f-list2__item">1&nbsp;&nbsp;부&nbsp;&nbsp;두 : 공용부두(14,455㎡), 컨테이너&middot;잡화
											<li class="f-list2__item">2&nbsp;&nbsp;부&nbsp;&nbsp;두 : 공용부두(8,070㎡), 컨테이너&middot;잡화</li>
											<li class="f-list2__item">8&nbsp;&nbsp;부&nbsp;&nbsp;두 : 국방부/공용부두, 군수품, 컨테이너, 잡화</li>
											<li class="f-list2__item">용호부두 : 공용부두(6,975㎡), 위험물, 냉동어획물</li>
											<li class="f-list2__item">우암터미널 야드시설 관리</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="f-info__section f-info__section-3">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/fu-info__image-3.png" alt="감천항 공용부두 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">감천항 공용부두</div>
										<ul class="f-list2">
											<li class="f-list2__item">감천항 2 &middot; 5 &middot; 6 &middot; 7 공용부두 관리</li>
											<li class="f-list2__item">수산물 및 시멘트, 모래, 철재 등 연안화물을 처리하는 <br />&nbsp;&nbsp;&nbsp;다목적 항만</li>
										</ul>
									</div>
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

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>
