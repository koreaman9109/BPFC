<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>인허가내용</title>
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
						<h2 class="c-lnb__heading">BPFC센터 소개</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a href="intro.do"
								class="c-lnb__link">인사말</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="licensing.do" class="c-lnb__link">인허가내용</a></li>
							<li class="c-lnb__item"><a href="history.do"
								class="c-lnb__link">BPFC개요</a></li>
							<li class="c-lnb__item"><a href="object.do"
								class="c-lnb__link">사업</a></li>
							<li class="c-lnb__item"><a href="organization.do"
								class="c-lnb__link">조직도</a></li>
							<li class="c-lnb__item"><a href="location.do"
								class="c-lnb__link">오시는길</a></li>
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
								class="breadcrumb__link">BPFC센터 소개</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">인허가내용</div></li>
						</ul>
					</div>
					<h3 class="c-h2">인허가내용</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="b-licensing">
						<div class="b-licensing__aligner">
							<div class="b-licensing__image">
								<img src="images/bpfc/b-licensing__image-1_1.png" alt="법인 설립허가증" />
							</div>
							<div class="b-licensing__image">
								<img src="images/bpfc/b-licensing__image-2_1.png" alt="허가증" />
							</div>
							<div class="b-licensing__image">
								<img src="images/bpfc/b-licensing__image-3.png" alt="영업신고증" />
							</div>
							<div class="b-licensing__image">
								<img src="images/bpfc/b-licensing__image-4.png" alt="회원증" />
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