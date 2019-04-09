<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>부산항 여객터미널 주요업무</title>
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
								class="breadcrumb__link">주요업무</div></li>
						</ul>
					</div>
					<h4 class="c-h2">부산항 여객터미널</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="fi-work">
						<h5 class="is-hidden">부산항 여객터미널 주요업무</h5>
						<ul class="c-tabs">
							<li class="c-tab"><a
								href="international.do" class="c-link">소개</a></li>
							<li class="c-tab c-tab--active"><a href="international_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab"><a href="international_3.do"
								class="c-link">주차장이용안내</a></li>
							<li class="c-tab"><a href="international_4.do"
								class="c-link">운항정보</a></li>
						</ul>
						
						<div class="fi-work__box">
							<div class="fi__heading">주요업무</div>
							<ul class="fi__txts">
								<li class="fi__txt">여객터미널 시설 및 운영 관리</li>
								<li class="fi__txt">시설물 및 이용객 안전관리</li>
								<li class="fi__txt">여객터미널 이용객 고객서비스 관리</li>
								<li class="fi__txt">터미널 부속시설 관리</li>
							</ul>
						</div>
						<div class="fi-work__box">
							<div class="fi__pictures">
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fi__image-1.png" alt="터미널 내부전경" /></div>
									<div class="fi__subject">터미널 이용객 안전관리</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fi__image-2.png" alt="종합방재센터 전경" /></div>
									<div class="fi__subject">종합방재센터 운영</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fi__image-3.png" alt="시설물 안전관리 훈련모습" /></div>
									<div class="fi__subject">시설물 안전관리 훈련</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fi__image-4.png" alt="선박 입출항 지원시설" /></div>
									<div class="fi__subject">선박 입출항 지원시설 운영</div>
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