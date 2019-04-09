<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>부산항국제전시컨벤션센터 주요업무</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
	$('#facility_na').parent().addClass('m-gnb__item--active');
});
</script>
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
							<li class="c-lnb__item"><a href="union.do"
								class="c-lnb__link">공용부두 화물관리</a></li>
							<li class="c-lnb__item"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설관리</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="convention.do"
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
								class="breadcrumb__link">부산항국제전시컨벤션센터</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">주요업무</div></li>
						</ul>
					</div>
					<div class="c-h2">
						<h3>부산항국제전시컨벤션센터(BPEX)&ensp;<a href="https://www.facebook.com/bpex.kr" target="_blank"><img class="f_sns1" src="images/pages/sns_01.png" alt="부산항국제전시컨벤션센터 페이스북연결" /></a></h3>
					</div>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="fi-work">
						<h4 class="is-hidden">부산항국제전시컨벤션센터 주요업무</h4>
						<ul class="c-tabs">
							<li class="c-tab"><a
								href="convention.do" class="c-link">소개</a></li>
							<li class="c-tab c-tab--active"><a href="convention_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab"><a href="convention_3.do"
								class="c-link">이용안내</a></li>
							<li class="c-tab"><a href="convention_5.do"
								class="c-link">MOU 체결 현황</a></li>
							<li class="c-tab"><a href="convention_4.do"
								class="c-link">일정</a></li>
						</ul>
						
						<div class="fi-work__box">
							<div class="fi__heading">주요업무</div>
							<ul class="fi__txts">
								<li class="fi__txt">컨벤션센터 운영관리</li>
								<li class="fi__txt">컨벤션센터 마케팅 및 홍보 업무</li>
								<li class="fi__txt">컨벤션센터 시설관리</li>
								<li class="fi__txt">시설물 및 이용고객 안전관리</li>
							</ul>
						</div>
						<div class="fi-work__box">
							<div class="fi__pictures">
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fc__image-1.png" alt="국제 회의실" /></div>
									<div class="fi__subject">국제 회의 개최</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fc__image-2.png" alt="대형 박람회" /></div>
									<div class="fi__subject">대형 박람회 개최</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fc__image-3.png" alt="대형 전시실" /></div>
									<div class="fi__subject">대형 전시회 개최</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fc__image-4.png" alt="세미나실" /></div>
									<div class="fi__subject">각종 회의 및 세미나 개최</div>
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
