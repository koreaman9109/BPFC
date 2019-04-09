<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>분실물 안내 연락처</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#customer_na').parent().addClass('m-gnb__item--active');
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

		<div id="content" class="c-container">
			<div class="c-lnbs">
				<div class="c-lnb">
					<div class="c-lnb__aligner">
						<h2 class="c-lnb__heading">고객마당</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a
								href="center-news.do?board_id=1" class="c-lnb__link">공지사항</a></li>
							<li class="c-lnb__item"><a href="newsletter.do?board_id=2"
								class="c-lnb__link">BPFC 소식지</a></li>
							<li class="c-lnb__item"><a href="photo.do?board_id=3"
								class="c-lnb__link">포토갤러리</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="lost.do?board_id=6"
								class="c-lnb__link">분실물안내</a></li>
							<li class="c-lnb__item"><a href="inquiry.do?board_id=5"
								class="c-lnb__link">문의사항</a></li>
							<li class="c-lnb__item"><a href="data.do?board_id=9"
								class="c-lnb__link">자료실</a></li>	
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
								class="breadcrumb__link">고객마당</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">분실물 안내</div></li>
						</ul>
					</div>
					<h3 class="c-h2">분실물 안내</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="s-lost-call">
					<div class="s-lost-call__aligner">
						<div class="c-section">
							<ul class="s-lost-call__list">
								<li class="s-lost-call__item"><a href="#"
									class="s-lost-call__link">
										<div class="s-lost-call__key">
											<span>연안여객터미널</span>
										</div>
										<div class="s-lost-call__value">051-000-0000</div>
								</a></li>
								<li class="s-lost-call__item"><a href="#"
									class="s-lost-call__link">
										<div class="s-lost-call__key">
											<span>연안여객터미널</span>
										</div>
										<div class="s-lost-call__value">051-000-0000</div>
								</a></li>
								<li class="s-lost-call__item"><a href="#"
									class="s-lost-call__link">
										<div class="s-lost-call__key">
											<span>연안여객터미널</span>
										</div>
										<div class="s-lost-call__value">051-000-0000</div>
								</a></li>
								<li class="s-lost-call__item"><a href="#"
									class="s-lost-call__link">
										<div class="s-lost-call__key">
											<span>연안여객터미널</span>
										</div>
										<div class="s-lost-call__value">051-000-0000</div>
								</a></li>
								<li class="s-lost-call__item"><a href="#"
									class="s-lost-call__link">
										<div class="s-lost-call__key">
											<span>연안여객터미널</span>
										</div>
										<div class="s-lost-call__value">051-000-0000</div>
								</a></li>
								<li class="s-lost-call__item"><a href="#"
									class="s-lost-call__link">
										<div class="s-lost-call__key">
											<span>연안여객터미널</span>
										</div>
										<div class="s-lost-call__value">051-000-0000</div>
								</a></li>
								<li class="s-lost-call__item"><a href="#"
									class="s-lost-call__link">
										<div class="s-lost-call__key">
											<span>연안여객터미널</span>
										</div>
										<div class="s-lost-call__value">051-000-0000</div>
								</a></li>
								<li class="s-lost-call__item"><a href="#"
									class="s-lost-call__link">
										<div class="s-lost-call__key">
											<span>연안여객터미널</span>
										</div>
										<div class="s-lost-call__value">051-000-0000</div>
								</a></li>
								<li class="s-lost-call__item"><a href="#"
									class="s-lost-call__link">
										<div class="s-lost-call__key">
											<span>연안여객터미널</span>
										</div>
										<div class="s-lost-call__value">051-000-0000</div>
								</a></li>
							</ul>
							<div class="c-pagination">
<!-- 								<a href="#"
									class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
								<a href="#"
									class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
								<ul class="c-pagination__list">
									<li class="c-pagination__item"><a href="#"
										class="c-pagination__link">1</a></li>
									<li class="c-pagination__item"><a href="#"
										class="c-pagination__link">2</a></li>
									<li class="c-pagination__item"><a href="#"
										class="c-pagination__link">3</a></li>
									<li class="c-pagination__item"><a href="#"
										class="c-pagination__link">4</a></li>
									<li class="c-pagination__item"><a href="#"
										class="c-pagination__link">5</a></li>
									<li class="c-pagination__item"><a href="#"
										class="c-pagination__link">6</a></li>
									<li class="c-pagination__item"><a href="#"
										class="c-pagination__link">7</a></li>
									<li class="c-pagination__item"><a href="#"
										class="c-pagination__link">8</a></li>
									<li class="c-pagination__item"><a href="#"
										class="c-pagination__link">9</a></li>
									<li class="c-pagination__item"><a href="#"
										class="c-pagination__link">10</a></li>
								</ul>
<!-- 								<a href="#"
									class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a>
								<a href="#"
									class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a> -->
							</div>
						</div>
						<div class="c-section c-section--small">
							<div class="c-buttons">
								<button onclick="location.href='lost.do?board_id=6'"
									class="c-button c-button--small c-button--white">목록</button>
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

		<script type="text/javascript">
			function sameHeight() {
				var maxHeight = -1;
				$('.s-lost-call__item')
						.each(
								function() {
									maxHeight = maxHeight > $(this).height() ? maxHeight
											: $(this).height();
								});

				$('.s-lost-call__item').each(function(i) {
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
