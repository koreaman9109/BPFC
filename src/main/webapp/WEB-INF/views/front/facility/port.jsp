<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>항만부대시설 관리</title>
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
							<li class="c-lnb__item"><a href="international.do"
								class="c-lnb__link">여객터미널</a></li>
							<li class="c-lnb__item"><a href="convention-intro.do"
								class="c-lnb__link">부산항국제전시컨벤션센터</a></li>
							<li class="c-lnb__item"><a href="union.do"
								class="c-lnb__link">공용부두 시설 및 화물 관리</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="port.do" class="c-lnb__link">항만부대시설 관리</a></li>
							<li class="c-lnb__item"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설</a></li>
							<li class="c-lnb__item"><a href="receiving.do"
								class="c-lnb__link">친수시설 관리</a></li>
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
								class="breadcrumb__link">항만부대시설 관리</div></li>
						</ul>
					</div>
					<h3 class="c-h2">항만부대시설 관리</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-lists">
						<ul class="f-list__list">
							<li class="f-list__item">
								<div class="f-list__key">부산항 국제선용품유통센터</div>
								<div class="f-list__value">
									<ul class="f-slist">
										<li class="f-slist__item">
											<div class="f-slist__key">준공년도</div>
											<div class="f-slist__value">2012년8월</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">위 치</div>
											<div class="f-slist__value">부산시 영도구 남항동2가 16번지 일원</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">시설규모</div>
											<div class="f-slist__value">연면적(33,455.21㎡) 지상5층</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">주요시설</div>
											<div class="f-slist__value">창고(냉동 및 냉장, 중량물, 일반), 사무실</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">편의시설</div>
											<div class="f-slist__value">홍보관, 주차장</div>
										</li>
									</ul>
								</div>
							</li>
							<li class="f-list__item">
								<div class="f-list__key">BPA 청사 관리</div>
								<div class="f-list__value">
									<ul class="f-slist">
										<li class="f-slist__item">
											<div class="f-slist__key">준공년도</div>
											<div class="f-slist__value">1998년 8월</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">위 치</div>
											<div class="f-slist__value">부산시 중구 대교로 122</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">시설규모</div>
											<div class="f-slist__value">부지(39,740㎡), 연면적(7,945㎡)</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">주요시설</div>
											<div class="f-slist__value">사무실</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">편의시설</div>
											<div class="f-slist__value">휴게공원, 전망대, 직원식당</div>
										</li>
									</ul>
								</div>
							</li>
							<li class="f-list__item">
								<div class="f-list__key">북항&middot;신항 관제정보 지원업무</div>
								<div class="f-list__value">
									<ul class="f-slist">
										<li class="f-slist__item f-slist__item--x">
											<div class="f-slist__key">위치</div>
											<div class="f-slist__value">
												<ul class="f-list__deshs">
													<li class="f-list__desh">북항 관제실 (VTS)<br />부산시 영도구
														태종로 727-1
													</li>
													<li class="f-list__desh">신항 관제실 (VTS)<br />경남 창원시 진해구
														연도로 58번지
													</li>
												</ul>
											</div>
										</li>
									</ul>
								</div>
							</li>
							<li class="f-list__item">
								<div class="f-list__key">부산항 공용 전력시설</div>
								<div class="f-list__value">
									<ul class="f-slist">
										<li class="f-slist__item f-slist__item--x">
											<div class="f-slist__key">위 치</div>
											<div class="f-slist__value">부산항 북항, 감천항, 신항</div>
										</li>
										<li class="f-slist__item f-slist__item--x">
											<div class="f-slist__key">과업범위</div>
											<div class="f-slist__value">
												부산항종합변전소, 신항 154KV 변전소 등 <br />부산항 전력시설
											</div>
										</li>
									</ul>
								</div>
							</li>
							<li class="f-list__item">
								<div class="f-list__key">부산항 CCTV 관리</div>
								<div class="f-list__value">
									<ul class="f-slist">
										<li class="f-slist__item">
											<div class="f-slist__key">위 치</div>
											<div class="f-slist__value">부산항 북항, 감천항, 신항</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">대 상</div>
											<div class="f-slist__value">북항&middot;감천항&middot;신항에 설치
												및 운영 중인 CCTV</div>
										</li>
									</ul>
								</div>
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
			function sameHeight() {
				var maxHeight = -1;
				$('.f-list__item')
						.each(
								function() {
									maxHeight = maxHeight > $(this).height() ? maxHeight
											: $(this).height();
								});

				$('.f-list__item').each(function(i) {
					$(this).height(maxHeight);
				});

			}
			sameHeight();

			$(window).resize(function(e) {
				$('.f-list__item').height('auto');
				sameHeight();

			});
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>
