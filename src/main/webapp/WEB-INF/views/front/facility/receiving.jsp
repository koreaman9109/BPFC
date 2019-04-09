<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>친수시설</title>
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
							<li class="c-lnb__item"><a href="port.do"
								class="c-lnb__link">항만부대시설 관리</a></li>
							<li class="c-lnb__item"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="receiving.do" class="c-lnb__link">친수시설 관리</a></li>
						</ul>
					</div>
				</div>
				<div class="l-depth3">
					<div class="l-depth3__aligner">
						<h3 class="is-hidden">친수시설 관리</h3>
						<ul class="l-depth3__list">
							<li class="l-depth3__item l-depth3__item--active"><a
								href="receiving.do" class="l-depth3__link">친수시설</a></li>
							<li class="l-depth3__item"><a href="etc.do"
								class="l-depth3__link">기타</a></li>
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
								class="breadcrumb__link">친수시설 관리 </div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">친수시설</div></li>
						</ul>
					</div>
					<h4 class="c-h2">친수시설</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-lists">
						<ul class="f-list__list">
							<li class="f-list__item">
								<div class="f-list__key">부산항 힐링 야영장</div>
								<div class="f-list__value">
									<ul class="f-slist">
										<li class="f-slist__item">
											<div class="f-slist__key">개장년도</div>
											<div class="f-slist__value">2017년 11월</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">위 치</div>
											<div class="f-slist__value">부산시 동구 충장대로 206</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">시설규모</div>
											<div class="f-slist__value">8,894㎡(야영장24면, 녹지 등)</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">주요시설</div>
											<div class="f-slist__value">온천공 및 펌프·배관시설 등</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">편의시설</div>
											<div class="f-slist__value">관리동, 화장실2동, 샤워실2동, 취사장,
												분리수거장, 창고동</div>
										</li>
									</ul>
								</div>
							</li>
							<li class="f-list__item">
								<div class="f-list__key">부산항 시민 해수온천 야외수영장</div>
								<div class="f-list__value">
									<ul class="f-slist">
										<li class="f-slist__item">
											<div class="f-slist__key">개장년도</div>
											<div class="f-slist__value">하절기 운영</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">위 치</div>
											<div class="f-slist__value">부산시 동구 충장대로 206</div>
										</li>
										<li class="f-slist__item">
											<div class="f-slist__key">시설규모</div>
											<div class="f-slist__value">7,425㎡</div>
										</li>
										<li class="f-slist__item f-slist__item--x">
											<div class="f-slist__key">주요시설</div>
											<div class="f-slist__value">수영장 4개, 워터바스켓, 에어슬라이드,
												슬라이드썰매, 유아품, 푸드존, 화장실, 샤워실</div>
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
