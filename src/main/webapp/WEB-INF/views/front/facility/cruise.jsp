<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>연안여객터미널</title>
<script>
	function cruise() {
		window.open('http://www.busanpa.com/bpt/Contents.do?mCode=MN0012',
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
						<h2 class="c-lnb__heading">부산항주요시설</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item c-lnb__item--active"><a
								href="international.do" class="c-lnb__link">여객터미널</a></li>
							<li class="c-lnb__item"><a href="convention-intro.do"
								class="c-lnb__link">부산항국제전시컨벤션센터</a></li>
							<li class="c-lnb__item"><a href="union.do"
								class="c-lnb__link">공용부두 시설 및 화물 관리</a></li>
							<li class="c-lnb__item"><a href="port.do"
								class="c-lnb__link">항만부대시설 관리</a></li>
							<li class="c-lnb__item"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설</a></li>
							<li class="c-lnb__item"><a href="receiving.do"
								class="c-lnb__link">친수시설 관리</a></li>
						</ul>
					</div>
				</div>
				<div class="l-depth3">
					<div class="l-depth3__aligner">
						<h3 class="is-hidden">여객터미널</h3>
						<ul class="l-depth3__list">
							<li class="l-depth3__item"><a href="international.do"
								class="l-depth3__link">국제여객터미널</a></li>
							<li class="l-depth3__item"><a href="coast.do"
								class="l-depth3__link">연안여객터미널</a></li>
							<li class="l-depth3__item l-depth3__item--active"><a
								href="cruise.do" class="l-depth3__link">국제크루즈터미널</a></li>
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
								class="breadcrumb__link">여객터미널</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">국제크루즈터미널</div></li>
						</ul>
					</div>
					<h4 class="c-h2">국제크루즈터미널</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="f-international">
					<div class="c-section">
						<div class="f-international__aligner">
							<div class="f-international__image">
								<img src="images/facility/f-international__image-2.png"
									alt="국제크루즈터미널 전경" />
							</div>
						</div>
					</div>
					<div class="c-section">
						<div class="f-international__box">
							<div class="f-international__aligner">
								<div class="f-international__infos">
									<div class="f-international__info f-international__info-1">
										<div class="f-international__heading">국제크루즈터미널은</div>
										<div class="f-international__txt">2007년 4월 개장한 국제크루즈터미널은
											짧은 기간에도 불구하고 세계적인 크루즈선이 모항으로 기항하는 등 부산항의 새로운 성장동 력이 되고 있습니다.
											초대형 여객선이 안전하게 취항할 수 있도록 11.8m의 깊은 수심을 확보하고 있으며, 입출국 관련시설 및
											세관시설 까지 편리한 서비스로 고객을 만족시키고 있습니다.</div>
									</div>
									<div class="f-international__info">
										<ul class="f-international__list">
											<li class="f-international__item">
												<div class="f-international__key">준공년도</div>
												<div class="f-international__value">2007년 4월</div>
											</li>
											<li class="f-international__item">
												<div class="f-international__key">위 치</div>
												<div class="f-international__value">부산시 영도구 해양로 301번길
													17</div>
											</li>
											<li class="f-international__item">
												<div class="f-international__key">시설규모</div>
												<div class="f-international__value">부지 2,568.78㎡ (2층
													철골조, 1층 별관 2동)</div>
											</li>
											<li class="f-international__item">
												<div class="f-international__key">주요시설</div>
												<div class="f-international__value">입&middot;출국장, 대합실,
													C.I.Q시설</div>
											</li>
											<li class="f-international__item">
												<div class="f-international__key">편의시설</div>
												<div class="f-international__value">주차장</div>
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
								<button onclick="cruise()" title="새창열림(다른 사이트로 이동)" class="c-button c-button--blue">국제크루즈터미널
									자세히 보러 가기</button>
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
