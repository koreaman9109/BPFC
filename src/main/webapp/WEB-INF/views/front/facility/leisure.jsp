<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>항만레저시설 이용시설</title>
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
							<li class="c-lnb__item"><a href="union.do"
								class="c-lnb__link">공용부두 화물관리</a></li>
							<li class="c-lnb__item"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설관리</a></li>
							<li class="c-lnb__item"><a href="convention.do"
								class="c-lnb__link">부산항국제전시컨벤션센터</a></li>
							<li class="c-lnb__item"><a href="bisc.do"
								class="c-lnb__link">국제선용품유통센터</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="leisure.do"
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
								class="breadcrumb__link">항만레저시설</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">이용시설</div></li>
						</ul>
					</div>
					<h3 class="c-h2">항만레저시설</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-union">
						<h4 class="is-hidden">항만레저시설 이용시설</h4>
						<ul class="c-tabs">
							<li class="c-tab c-tab--active"><a
								href="leisure.do" class="c-link">이용시설</a></li>
							<li class="c-tab"><a href="leisure_2.do"
								class="c-link">이용안내</a></li>
						</ul>
						
						<div class="f-infos f-infos--4">
							<div class="f-info__section f-info__section-1">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/fl-info__image-1.png" alt="힐링야영장" /></div>
									<div class="f-info__cont">
										<div class="f-heading">힐링야영장</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">주요시설</div>
											<ul class="f-list2">
												<li class="f-list2__item">야영장 22면, 녹지 4,862㎡,<br />&nbsp;&nbsp;&nbsp;관리동 1동, 편의시설 5</li>
											</ul>
										</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">편의시설</div>
											<ul class="f-list2">
												<li class="f-list2__item">샤워실(남, 여) 및 화장실(남, 여) 4동,<br />&nbsp;&nbsp;&nbsp;취사장 1동</li>
											</ul>
										</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">주소</div>
											<ul class="f-list2">
												<li class="f-list2__item">부산광역시 동구 충장대로 206,<br />&nbsp;&nbsp;&nbsp;부산항국제여객터미널 야외주차장 내</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="f-info__section f-info__section-2">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/fl-info__image-2.png" alt="해수온천 족욕장 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">해수온천 족욕장</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">개요</div>
											<ul class="f-list2">
												<li class="f-list2__item">지하 500m 천연해수온천을 기반으로<br />&nbsp;&nbsp;&nbsp;조성되었으며, 비가림시설,신발장 등이 <br />&nbsp;&nbsp;&nbsp;설치운영 중입니다.</li>
											</ul>
										</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">주소</div>
											<ul class="f-list2">
												<li class="f-list2__item">부산광역시 동구 충장대로 206, <br />&nbsp;&nbsp;&nbsp;부산항국제여객터미널 내</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="f-info__section f-info__section-3">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/fl-info__image-3.png" alt="시민 해수온천 야외수영장 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">시민 해수온천 야외수영장</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">주요시설</div>
											<ul class="f-list2">
												<li class="f-list2__item">하절기(6월~9월) 한시운영</li>
												<li class="f-list2__item">지하 500m에서 용출되는 해수온천을 <br />&nbsp;&nbsp;&nbsp;기반으로 운영</li>
												<li class="f-list2__item">수영장, 워터바스켓, 에어슬라이드, <br />&nbsp;&nbsp;&nbsp;유아풀, 푸드존</li>
												<li class="f-list2__item">탈의실, 화장실, 샤워</li>
											</ul>
										</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">주소</div>
											<ul class="f-list2">
												<li class="f-list2__item">부산광역시 충장대로 206, <br />&nbsp;&nbsp;&nbsp;부산항국제여객터미널 내 야외주차장 <br />&nbsp;&nbsp;&nbsp;특설구역</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							
							<div class="f-info__section f-info__section-4">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/fl-info__image-4_1.png" alt="신항 야구장" /></div>
									<div class="f-info__cont">
										<div class="f-heading">신항 야구장</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">개요</div>
											<ul class="f-list2">
												<li class="f-list2__item">부산 신항 이용자 및 지역사회의 생활<br />&nbsp;&nbsp;&nbsp;체육 활성화를 위하여 웅동체육공원<br />&nbsp;&nbsp;&nbsp;내에 2014년 9월, BPA에서 개장</li>
											</ul>
										</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">주소</div>
											<ul class="f-list2">
												<li class="f-list2__item">경상남도 창원시 진해구 남문동 <br />&nbsp;&nbsp;&nbsp;1190번지 웅동하수처리시설 내</li>
											</ul>
										</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">주요시설</div>
											<ul class="f-list2">
												<li class="f-list2__item">면&emsp;적 : 7,759㎡
												<li class="f-list2__item">규&emsp;모 : 좌우 88ｍ, 중앙 93ｍ</li>
												<li class="f-list2__item">노&emsp;면 : 인조잔디 </li>
												<li class="f-list2__item">관람석 : 80석 </li>
												<li class="f-list2__item">주차장 : 34면</li>
												<li class="f-list2__item">기&emsp;타 : 본부석, 덕아웃, 조명6개소, <br />&nbsp;&nbsp;&nbsp;스코어보드, 기타부대시설1식 </li>
											</ul>
										</div>
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
