<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>경영목표</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#Introduce').parent().parent().parent().parent().addClass('m-gnb__item--active');
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
						<h2 class="c-lnb__heading">BPFC 소개</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a href="intro.do"
								class="c-lnb__link">인사말</a></li>
							<li class="c-lnb__item"><a
								href="history.do" class="c-lnb__link">개요</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="business-goal.do"
								class="c-lnb__link">경영목표</a></li>
							<li class="c-lnb__item"><a href="organization.do"
								class="c-lnb__link">조직도</a></li>
							<li class="c-lnb__item"><a href="location.do"
								class="c-lnb__link">오시는길</a></li>
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
								class="breadcrumb__link">BPFC 소개</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">경영목표</div></li>
						</ul>
					</div>
					<h4 class="c-h2">경영목표</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="b-goal">
					<div class="c-aligner">
						<div class="c-section">
							<div class="b-goal__list">
								<div class="b-goal__item">
									<div class="b-goal__key">Vision</div>
									<div class="b-goal__value">최고의 항만시설관리 &middot; 서비스 기관 도약</div>
								</div>
								<div class="b-goal__item">
									<div class="b-goal__key">Mission</div>
									<div class="b-goal__value">항만시설의 효율적 관리 &middot; 운영을 통해 최고의 항만서비스로 일류 부산항 구현 </div>
								</div>
								<div class="b-goal__item">
									<div class="b-goal__key">Business policies</div>
									<div class="b-goal__value">경영방침</div>
								</div>
							</div>
						</div>
						<div class="c-section c-section--large">
							<div class="b-policies">
								<div class="b-policie b-policie-1">
									<div class="b-policie__txt">고객감동</div>
									<div class="b-policie__txt b-policie__txt--eng">Customer impression Management</div>
								</div>
								<div class="b-policie b-policie-2">
									<div class="b-policie__txt">안전확인</div>
									<div class="b-policie__txt b-policie__txt--eng">Safety first Management</div>
								</div>
								<div class="b-policie b-policie-3">
									<div class="b-policie__txt">전문역량강화</div>
									<div class="b-policie__txt b-policie__txt--eng">Increasing ability Management</div>
								</div>
								<div class="b-policie b-policie-4">
									<div class="b-policie__txt">협업 &middot; 소통</div>
									<div class="b-policie__txt b-policie__txt--eng">Cooperation &amp; Communication Management</div>
								</div>
							</div>
						</div>
						<div class="c-section">
							<div class="b-goal__list">
								<div class="b-goal__item">
									<div class="b-goal__key">Strategy</div>
									<div class="b-goal__value">전략</div>
								</div>
							</div>
						</div>
					</div>
					<div class="b-goal__box">
						<div class="c-aligner">
							<div class="b-strategys">
								<div class="b-strategy b-strategy-1">
									<div class="b-strategy__box">서비스 지향적 관리체계 구축</div>
								</div>
								<div class="b-strategy b-strategy-2">
									<div class="b-strategy__box">안전항만구축을 위한 안전관리업무 체계 확립</div>
								</div>
								<div class="b-strategy b-strategy-3">
									<div class="b-strategy__box">전문적인 혁신 역량 강화</div>
								</div>
								<div class="b-strategy b-strategy-4">
									<div class="b-strategy__box">협력적 조직<br> 문화 확립</div>
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