<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>미션 및 비전</title>
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
							<li class="c-lnb__item"><a href="licensing.do"
								class="c-lnb__link">인허가내용</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="history.do" class="c-lnb__link">BPFC개요</a></li>
							<li class="c-lnb__item"><a href="object.do"
								class="c-lnb__link">사업</a></li>
							<li class="c-lnb__item"><a href="organization.do"
								class="c-lnb__link">조직도</a></li>
							<li class="c-lnb__item"><a href="location.do"
								class="c-lnb__link">오시는길</a></li>
						</ul>
					</div>
				</div>
				<div class="l-depth3">
					<div class="l-depth3__aligner">
						<h3 class="is-hidden">BPFC개요</h3>
						<ul class="l-depth3__list">
							<li class="l-depth3__item"><a href="history.do"
								class="l-depth3__link">BPFC연혁</a></li>
							<li class="l-depth3__item"><a href="ci.do"
								class="l-depth3__link">CI소개</a></li>
							<li class="l-depth3__item l-depth3__item--active"><a
								href="vision.do" class="l-depth3__link">미션 및 비전</a></li>
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
								class="breadcrumb__link">BPFC 소개</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link"> BPFC개요</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">미션 및 비전</div></li>
						</ul>
					</div>
					<h4 class="c-h2">미션 및 비전</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="b-vision">
					<div class="b-vision__box">
						<div class="b-vision__aligner">
							<h3 class="b-vision__heading">경영목표</h3>
							<div class="b-vision-goals">
								<div class="b-vision-goal">
									New<em>Company</em>
								</div>
								<div class="b-vision-goal b-vision-goal--other">
									New<em>Business</em>
								</div>
								<div class="b-vision-goal">
									New<em>People</em>
								</div>
							</div>
						</div>
					</div>
					<div class="b-vision__aligner">
						<div class="b-vision__heading-2">추진전략</div>
						<div class="b-vision__list">
							<div class="b-vision__item b-vision__item-1">
								<div>
									기획/마케팅기능의<br />신설 및 강화
								</div>
							</div>
							<div class="b-vision__item b-vision__item-2">
								<div>
									신사업 개발 및<br />사업 다각화 추진
								</div>
							</div>
							<div class="b-vision__item b-vision__item-3">
								<div>
									사업구조 재조정/<br />사업군별 신규사업 <br />개발
								</div>
							</div>
							<div class="b-vision__item b-vision__item-4">
								<div>
									사업별 사업다각화<br />추진
								</div>
							</div>
							<div class="b-vision__item b-vision__item-5">
								<div>
									신규 직원 채용/<br />재교육 및 핵심인재 <br />양성
								</div>
							</div>
							<div class="b-vision__item b-vision__item-6">
								<div>
									21C형 선진인력관리<br />및 핵심인재 양성
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

		<script type="text/javascript">
			var scrollControll = $.superscrollorama({
				reverse : false
			});

			var vision = new TimelineLite({
				delay : .3
			});

			scrollControll.addTween('.b-vision__aligner', vision.staggerTo(
					'.b-vision__item', .3, {
						opacity : 1,
						scale : 1
					}, .2), -200);
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>