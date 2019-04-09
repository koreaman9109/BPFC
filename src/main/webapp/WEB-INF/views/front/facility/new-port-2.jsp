<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>신항 항만시설관리 주요업무</title>
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
							<li class="c-lnb__item"><a
								href="international.do" class="c-lnb__link">부산항 여객터미널</a></li>
							<li class="c-lnb__item"><a href="union.do"
								class="c-lnb__link">공용부두 화물관리</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="new-port.do"
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
								class="breadcrumb__link">신항 항만시설관리</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">주요업무</div></li>
						</ul>
					</div>
					<h4 class="c-h2">신항 항만시설관리</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="fi-work">
						<h5 class="is-hidden">신항 항만시설관리 주요업무</h5>
						<ul class="c-tabs">
							<li class="c-tab"><a
								href="new-port.do" class="c-link">소개</a></li>
							<li class="c-tab c-tab--active"><a href="new-port_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab"><a href="new-port_3.do"
								class="c-link">부산항 홍보관 안내</a></li>
						</ul>
						
						<div class="fi-work__box">
							<div class="fi__heading">주요업무</div>
							<ul class="fi__txts">
								<li class="fi__txt">신항 지원건물 및 홍보관 운영 관리</li>
								<li class="fi__txt">신항 배후단지 및 종합상황실 운영 관리</li>
								<li class="fi__txt">공용컨테이너 장치장 운영 관리</li>
								<li class="fi__txt">임항도로(교통시설 포함) 및 외곽시설 관리</li>
								<li class="fi__txt">임항도로 장미꽃길 관리</li>
								<li class="fi__txt">신항 셔틀버스 운영 관리</li>
							</ul>
						</div>
						<div class="fi-work__box">
							<div class="fi__pictures">
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fn__image-4.png" alt="부산항 홍보관" /></div>
									<div class="fi__subject">부산항 홍보관 운영</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fn__image-2_1.png" alt="종합상황실 운영" /></div>
									<div class="fi__subject">종합상황실 운영 관리</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fn__image-3_1.png" alt="신항 내부도로" /></div>
									<div class="fi__subject">신항 내부도로 관리</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fn__image-3_1_2.png" alt="웅동배후단지 녹지구역 조경" /></div>
									<div class="fi__subject">웅동배후단지 녹지구역 조경 관리</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fn__image-3_1_3.png" alt="임항도로 시설" /></div>
									<div class="fi__subject">임항도로 시설 관리</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fn__image-3_1_4.png" alt="임항도로 장미꽃길" /></div>
									<div class="fi__subject">임항도로 장미꽃길 관리</div>
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