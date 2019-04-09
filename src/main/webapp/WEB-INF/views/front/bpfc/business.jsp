<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>사업</title>
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
							<li class="l-depth3__item"><a href="history.do"
								class="l-depth3__link">연혁</a></li>
							<li class="l-depth3__item l-depth3__item--active"><a href="business.do"
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
							<li class="breadcrumb__item breadcrumb__item-1"><div
								class="breadcrumb__link">BPFC 소개</div></li>
								<li class="breadcrumb__item breadcrumb__item-2"><div class="breadcrumb__link"> 개요</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link"> 사업</div></li>
						</ul>
					</div>
					<h4 class="c-h2">사업</h4>

				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="b-business">
						<div class="b-business__list">
							<div class="b-business__item b-business__item-1">
								<div class="b-business__key">설립목적</div>
								<div class="b-business__value">
									<div class="b-business__txt b-business__txt--large">
										부산항 여객터미널 및 항만시설물의
										효율적 관리와 기타 항만의 공공시설물
										위탁관리사업 수행을 통해 항만 발전과
										국민 편익 증진에 기여함
									</div>
								</div>
							</div>
							<div class="b-business__item b-business__item-2">
								<div class="b-business__key">설립근거</div>
								<div class="b-business__value">
									<div class="b-business__heading">항만법 제88조 제1항</div>
									<div class="b-business__txt">
										제88조(항만관리법인) ① 해양수산부장관은 항만시설의 
										관리 및 경비·보안 등의 업무를 담당하는 법인
										(이하 "항만관리법인"이라한다)을 지정할 수 있다.
									</div>
								</div>
							</div>
							<div class="b-business__item b-business__item-3">
								<div class="b-business__key">주요사업</div>
								<div class="b-business__value">
									<div class="b-business__txt">
										부산항 여객터미널 등 공용시설의 서비스 개선사업
										국가, 부산항만공사, 지방자치단체, 그 밖의 단체 등으로
										부터 위탁받은 사업
									</div>
									<ul class="b-business__slist">
										<li class="b-business__sitem">부산항 여객터미널 관리,운영사업</li>
										<li class="b-business__sitem">부산항 공용부두의 시설 및 수&middot;출입 화물관리 사업</li>
										<li class="b-business__sitem">그 외 항만시설에 대한 위탁사업 및 관련 부대사업</li>
									</ul>
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