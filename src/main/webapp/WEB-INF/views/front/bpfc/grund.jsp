<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>설립근거</title>
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
							<li class="c-lnb__item"><a href="history.do"
								class="c-lnb__link">BPFC개요</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="object.do" class="c-lnb__link">사업</a></li>
							<li class="c-lnb__item"><a href="organization.do"
								class="c-lnb__link">조직도</a></li>
							<li class="c-lnb__item"><a href="location.do"
								class="c-lnb__link">오시는길</a></li>
						</ul>
					</div>
				</div>
				<div class="l-depth3">
					<div class="l-depth3__aligner">
						<h3 class="is-hidden">사업</h3>
						<ul class="l-depth3__list">
							<li class="l-depth3__item"><a href="object.do"
								class="l-depth3__link">설립목적</a></li>
							<li class="l-depth3__item l-depth3__item--active"><a
								href="grund.do" class="l-depth3__link">설립근거</a></li>
							<li class="l-depth3__item"><a href="business.do"
								class="l-depth3__link">주요사업</a></li>
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
								class="breadcrumb__link"> 사업</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">설립근거</div></li>
						</ul>
					</div>
					<h4 class="c-h2">설립근거</h4>

				</div>
			</div>
			<!-- 내용-->
			<div class="c-ready">준비중 입니다.</div>
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