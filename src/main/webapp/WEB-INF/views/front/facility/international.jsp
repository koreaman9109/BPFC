<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>부산항 여객터미널 소개</title>
<script>
	function international() {
		window.open('http://www.busanpa.com/bpt/Contents.do?mCode=MN0006',
				'_blank')
	}
</script>
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
							<li class="c-lnb__item c-lnb__item--active"><a
								href="international.do" class="c-lnb__link">부산항 여객터미널</a></li>
							<li class="c-lnb__item"><a href="union.do"
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
								class="breadcrumb__link">부산항 여객터미널</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">소개</div></li>
						</ul>
					</div>
					<h4 class="c-h2">부산항 여객터미널</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-infomation">
						<h5 class="is-hidden">부산항 여객터미널 소개</h5>
						<ul class="c-tabs">
							<li class="c-tab c-tab--active"><a
								href="international.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="international_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab"><a href="international_3.do"
								class="c-link">주차장이용안내</a></li>
							<li class="c-tab"><a href="international_4.do"
								class="c-link">운항정보</a></li>
						</ul>
						
						<div class="f-infos">
							<div class="f-info__section f-info__section-1">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/f-info__image-1.png" alt="국제여객터미널 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">국제여객터미널</div>
										<ul class="f-list2">
											<li class="f-list2__item">2015년 8월 신축 개장</li>
											<li class="f-list2__item">연면적 93,932㎡ 로  일본(시모노세키,오사카,하카타,대마도)을 잇는<br />&nbsp;&nbsp;&nbsp;정기선 및 다국적 크루즈 접안 등 연 250만명 이상의 승객이 이용하는 시설</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="f-info__section f-info__section-2">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/f-info__image-2.png" alt="국제크루즈터미널 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">국제크루즈터미널</div>
										<ul class="f-list2">
											<li class="f-list2__item">2007년 4월 개장</li>
											<li class="f-list2__item">영도구에 위치하였으며 깊은수심(11.8m)으로 대형<br />&nbsp;&nbsp;&nbsp;크루즈의 기항 및 모항의 입항지로서 부산항을<br />&nbsp;&nbsp;&nbsp;대표하는 크루즈 접안시설 </li>
										</ul>
									</div>
								</div>
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/f-info__image-3.png" alt="제2국제크루즈터미널 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">제2국제크루즈터미널</div>
										<ul class="f-list2">
											<li class="f-list2__item">국제여객부두 1번 선석에 2017년 9월 개장</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="f-info__section f-info__section-3">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/f-info__image-4.png" alt="연안여객터미널 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">연안여객터미널</div>
										<ul class="f-list2">
											<li class="f-list2__item">연면적 14,412㎡로 국제여객터미널의<br />&nbsp;&nbsp;&nbsp;이전과 함께 리모델링 후 개장하였으며,<br />&nbsp;&nbsp;&nbsp;부산-제주 간 정기선이 운영 중임</li>
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