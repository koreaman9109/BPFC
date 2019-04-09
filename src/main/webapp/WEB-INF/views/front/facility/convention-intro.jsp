<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>부산항국제컨벤션센터 컨벤션 소개</title>
<script>
	function convention_intro() {
		window.open('http://www.busanpa.com/bpt/Contents.do?mCode=MN0064',
				'_blank')
	};
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
						<h2 class="c-lnb__heading">부산항주요시설</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a
								href="international.do" class="c-lnb__link">부산항 여객터미널</a></li>
							<li class="c-lnb__item"><a href="union.do"
								class="c-lnb__link">공용부두 화물관리</a></li>
							<li class="c-lnb__item"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설관리</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="convention.do"
								class="c-lnb__link">부산항국제컨벤션센터</a></li>
							<li class="c-lnb__item"><a href="bisc.do"
								class="c-lnb__link">국제선용품유통센터</a></li>
							<li class="c-lnb__item"><a href="leisure.do"
								class="c-lnb__link">항만레저시설</a></li>
							<li class="c-lnb__item"><a href="etc.do"
								class="c-lnb__link">기타항만시설관리</a></li>
						</ul>
					</div>
				</div>
				<div class="l-depth3">
					<div class="l-depth3__aligner">
						<h3 class="is-hidden">부산항국제컨벤션센터</h3>
						<ul class="l-depth3__list">
							<li class="l-depth3__item l-depth3__item--active"><a
								href="convention-intro.do" class="l-depth3__link">컨벤션 소개</a></li>
							<li class="l-depth3__item"><a href="convention-date.do"
								class="l-depth3__link">컨벤션 일정</a></li>
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
								class="breadcrumb__link">부산항주요시설</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">부산항국제컨벤션센터</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">컨벤션 소개</div></li>
						</ul>
					</div>
					<h4 class="c-h2">부산항국제컨벤션센터</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="f-international">
					<div class="c-section">
						<div class="f-international__aligner">
							<h5 class="is-hidden">컨벤션 소개</h5>
							<ul class="c-tabs">
								<li class="c-tab c-tab--active"><a
									href="convention-intro.do" class="c-link">컨벤션 소개</a></li>
								<li class="c-tab"><a href="convention-date.do"
									class="c-link">컨벤션 일정</a></li>
							</ul>
							<div class="f-international__image">
								<img src="images/facility/convention-intro__image.png"
									alt="부산항국제컨벤션센터 전경" />
							</div>
						</div>
					</div>
					<div class="c-section">
						<div class="f-international__box">
							<div class="f-international__aligner">
								<div class="f-international__infos">
									<div class="f-international__info f-international__info-1">
										<div class="f-international__heading">부산항국제컨벤션센터는</div>
										<div class="f-international__txt">축구장 세배 크기의 전문 전시장과 다목적
											홀, 야외전시장, 상설전시 장을 갖춘 부산국제컨벤션센터는 2002년 한일월드컵 본선 조 추첨이 이루어졌던
											곳이며 2005년 APEC 정상회담이 열렸던 역사적인 장소 이다. 겉에서 보기에는 기와집을 연상시키는 대형
											단층 건물로 보이 지만 지하 1층, 지상 7층 규모로 구성되어 있으며 전시 및 회의 시설 이외에도 대형공연 및
											이벤트, 스포츠 행사장으로 이용되고 있다.</div>
									</div>
									<div class="f-international__info">
										<ul class="f-international__list">
											<li class="f-international__item">
												<div class="f-international__key">위치</div>
												<div class="f-international__value">부산항국제여객터미널 5층</div>
											</li>
											<li class="f-international__item">
												<div class="f-international__key">시설개요</div>
												<div class="f-international__value">이벤트홀1, 컨퍼런스홀1,
													회의실10</div>
											</li>
											<li class="f-international__item f-international__item--x">
												<div class="f-international__key">주요업무</div>
												<div class="f-international__value">
													<ul class="f-international__slist">
														<li class="f-international__sitem">운영 관리, 마케팅, 홍보업무</li>
														<li class="f-international__sitem">컨벤션센터 시설관리</li>
														<li class="f-international__sitem">시설물 및 이용고객 안전관리</li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="c-section c-section--small">
						<div class="f-international__aligner">
							<div class="c-buttons c-buttons--right">
								<button onclick="convention_intro()" title="새창열림(다른 사이트로 이동)" 
									class="c-button c-button--blue">부산항 국제컨벤션센터 자세히 보러 가기</button>
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
