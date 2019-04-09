<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>연혁</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#Introduce').parent().parent().parent().parent().addClass('m-gnb__item--active');
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
						<h2 class="c-lnb__heading">BPFC 소개</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a href="intro.do"
								class="c-lnb__link">인사말</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="history.do" class="c-lnb__link">개요</a></li>
							<li class="c-lnb__item"><a href="business-goal.do"
								class="c-lnb__link">경영목표</a></li>
							<li class="c-lnb__item"><a href="organization.do"
								class="c-lnb__link">조직도</a></li>
							<li class="c-lnb__item"><a href="location.do"
								class="c-lnb__link">오시는길</a></li>
						</ul>
					</div>
				</div>
				<div class="l-depth3">
					<div class="l-depth3__aligner">
						<h3 class="is-hidden">개요</h3>
						<ul class="l-depth3__list">
							<li class="l-depth3__item l-depth3__item--active"><a href="history.do"
								class="l-depth3__link">연혁</a></li>
							<li class="l-depth3__item"><a href="business.do"
								class="l-depth3__link">사업</a></li>
							<li class="l-depth3__item"><a
								href="ci.do" class="l-depth3__link">CI소개</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="c-headings">
				<div class="c-aligner">
					<div class="breadcrumb">
						<ul class="breadcrumb__list">
							<li class="breadcrumb__item breadcrumb__item--home"><div class="breadcrumb__link"><a href="main.do" id="content">홈</a></div></li>
							<li class="breadcrumb__item breadcrumb__item-1"><div class="breadcrumb__link">BPFC 소개</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div class="breadcrumb__link"> 개요</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div class="breadcrumb__link">연혁</div></li>
						</ul>
					</div>
					<h4 class="c-h2">연혁</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="b-history">
						<div class="b-history__aligner">
							<div class="b-history__txts">
								<div class="b-history__txt">
									<img src="images/bpfc/b-history__txt-1.png" alt="Since 1969,바다를 열다" />
								</div>
								<div class="b-history__txt">
									반세기 전 ‘(사)부산항부두관리협회’로 시작된 우리센터는 부산항을 대표하는 전문
									<br />항만관리법인으로서 부산항 여객 터미널, 부산항 공용 부두의 수출입 화물 등 항만 시설의 효율적인 
									<br />관리와 항만 운영 관련 사업을 수행하여 부산항 발전에 기여하고 있습니다
								</div>
							</div>
							<div class="b-history__content">
								<ul class="b-history__list">
									<li class="b-history__item">
										<div class="b-history__year"><em class="b-history__year--em">1969</em>년</div>
										<div class="b-history__box">
											<div class="b-history__month">5월</div>
											<div class="b-history__heading">‘(사)부산항부두관리협회’ 창립</div>
											<ul class="b-history__conts">
												<li class="b-history__cont">부산항 공용부두 수출입화물 및 시설관리</li>
												<li class="b-history__cont">부산항 경비보안업무 수행</li>
											</ul>
										</div>
									</li>
									<li class="b-history__item">
										<div class="b-history__year"><em class="b-history__year--em">2000</em>년대</div>
										<div class="b-history__box">
											<div class="b-history__month">2002년2월</div>
											<div class="b-history__heading">‘부산항부두관리공사(부공)’ 로 명칭 변경</div>
											<ul class="b-history__conts">
												<li class="b-history__cont">기타 공공기관으로 지정</li>
											</ul>
										</div>
										<div class="b-history__box">
											<div class="b-history__month">2008년1월</div>
											<div class="b-history__heading">정부의 ‘부공 경영혁신 방안’ 확정</div>
											<ul class="b-history__conts">
												<li class="b-history__cont">경비보안업무 부산항보안공사로 이관</li>
												<li class="b-history__cont">항만시설 및 공용부두 화물관리 전담</li>
											</ul>
										</div>
										<div class="b-history__box">
											<div class="b-history__month">2009년7월</div>
											<div class="b-history__heading">공기업 선진화 계획에 따라 민영화</div>
											<ul class="b-history__conts">
												<li class="b-history__cont">부산항부두관리공사 해산</li>
												<li class="b-history__cont">부산항부두관리주식회사 설립</li>
											</ul>
										</div>
									</li>
									<li class="b-history__item">
										<div class="b-history__year"><em class="b-history__year--em">2013</em>년</div>
										<div class="b-history__box">
											<div class="b-history__month">9월</div>
											<div class="b-history__heading">‘항만공사법’ 개정에 따른 정부의 여객터미널 등 관리운영방안 확정</div>
										</div>
										<div class="b-history__box">
											<div class="b-history__month">12월</div>
											<div class="b-history__heading">‘부산항시설관리센터’ 설립</div>
											<ul class="b-history__conts">
												<li class="b-history__cont">항만법에 의거 항만관리법인으로 지정</li>
											</ul>
										</div>
									</li>
									<li class="b-history__item">
										<div class="b-history__year"><em class="b-history__year--em">2014</em>년</div>
										<div class="b-history__box">
											<div class="b-history__month">1월</div>
											<div class="b-history__heading">‘부산항시설관리센터’ 출범</div>
										</div>
									</li>
									<li class="b-history__item">
										<div class="b-history__year"><em class="b-history__year--em">2016</em>년</div>
										<div class="b-history__box">
											<div class="b-history__month">5월</div>
											<div class="b-history__heading">안전보건경영시스템(KOSHA18001) 인증</div>
										</div>
									</li>
									<li class="b-history__item">
										<div class="b-history__year"><em class="b-history__year--em">2017</em>년</div>
										<div class="b-history__box">
											<div class="b-history__heading">(사)부산항시설관리센터 제2기 출범</div>
										</div>
									</li>
								</ul>
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
			var scrollControll = $.superscrollorama({
				reverse : false
			});

			var historyImage = new TimelineLite({
				delay : .3
			});
			historyImage.staggerTo('.b-history__image', .5, {
				delay : .4,
				opacity : 1,
				scale : 1
			}, .5);
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>