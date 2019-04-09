<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>기타항만시설관리</title>
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
						<h2 class="c-lnb__heading">주요관리시설</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a
								href="international.do" class="c-lnb__link">부산항 여객터미널</a></li>
							<li class="c-lnb__item"><a href="union.do"
								class="c-lnb__link">공용부두 화물관리</a></li>
							<li class="c-lnb__item"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설관리</a></li>
							<li class="c-lnb__item"><a href="convention.do"
								class="c-lnb__link">부산항국제전시컨벤션센터</a></li>
							<li class="c-lnb__item"><a href="bisc.do"
								class="c-lnb__link">국제선용품유통센터</a></li>
							<li class="c-lnb__item"><a href="leisure.do"
								class="c-lnb__link">항만레저시설</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="etc.do"
								class="c-lnb__link">기타항만시설관리</a></li>
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
								class="breadcrumb__link">주요관리시설</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">기타항만시설관리</div></li>
						</ul>
					</div>
					<h3 class="c-h2">기타항만시설관리</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-infos f-infos--4">
						<div class="f-info__section f-info__section-1">
							<div class="f-info">
								<div class="f-info__image"><img src="images/facility/fe-info__image-1.png" alt="부산항만공사 사옥" /></div>
								<div class="f-info__cont">
									<div class="f-heading">부산항만공사 사옥</div>
									<div class="f-list2__box">
										<div class="f-list2__heading">위치</div>
										<ul class="f-list2">
											<li class="f-list2__item">부산광역시 중구 대교로</li>
										</ul>
									</div>
									<div class="f-list2__box">
										<div class="f-list2__heading">주요업무</div>
										<ul class="f-list2">
											<li class="f-list2__item">시설관리, 건물경비, 주차관리, 환경미화</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="f-info__section f-info__section-2">
							<div class="f-info">
								<div class="f-info__image"><img src="images/facility/fe-info__image-2.png" alt="부산항 공용전기 및 CCTV" /></div>
								<div class="f-info__cont">
									<div class="f-heading">부산항 공용전기 및 CCTV</div>
									<div class="f-list2__box">
										<div class="f-list2__heading">공용전기</div>
										<ul class="f-list2">
											<li class="f-list2__item">북&emsp;항 : 종합전소, 시민부두,<br>&nbsp;&nbsp;&nbsp;용호만 매립부두</li>
											<li class="f-list2__item">감천항 : 주요전기시설</li>
											<li class="f-list2__item">신&emsp;항 : 154KV변전소, 임항도로,<br>&nbsp;&nbsp;&nbsp;웅동배후단지, 주간선도로</li>
										</ul>
									</div>
									<div class="f-list2__box">
										<div class="f-list2__heading">공용CCTV</div>
										<ul class="f-list2">
											<li class="f-list2__item">북항, 감천항 및 신항 내 CCTV<br>&nbsp;&nbsp;&nbsp;(일반, 보안)</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="f-info__section f-info__section-3">
							<div class="f-info">
								<div class="f-info__image"><img src="images/facility/fe-info__image-3.png" alt="북항 및 신항 관제센터" /></div>
								<div class="f-info__cont">
									<div class="f-heading">북항 및 신항 관제센터</div>
									<div class="f-list2__box">
										<div class="f-list2__heading">관리시설</div>
										<ul class="f-list2">
											<li class="f-list2__item">북항 관제실 VTS 센터 </li>
											<li class="f-list2__item">신항 관제실 VTS 센터</li>
										</ul>
									</div>
									<div class="f-list2__box">
										<div class="f-list2__heading">주요업무</div>
										<ul class="f-list2">
											<li class="f-list2__item">PORT-MIS 입력 지원</li>
											<li class="f-list2__item">입출항선박 선석 지정 </li>
											<li class="f-list2__item">계류 선박현황 관리 및 불법선박 파악 </li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						
						<div class="f-info__section f-info__section-4">
							<div class="f-info">
								<div class="f-info__image"><img src="images/facility/fe-info__image-4.png" alt="부산항 환경미화 관리" /></div>
								<div class="f-info__cont">
									<div class="f-heading">부산항 환경미화 관리</div>
									<div class="f-list2__box">
										<div class="f-list2__heading">관리시설</div>
										<ul class="f-list2">
											<!--<li class="f-list2__item">감천항 내 동편부두, YK부두, 제6부두, 제7부두, 동방파제, 서방파제, 다대포항 방파제</li>-->

											<li class="f-list2__item">감천항 내 동편부두, YK부두, 제6부두,
											<br />
											&nbsp;&nbsp;&nbsp;제7부두, 동방파제, 서방파제,<br />&nbsp;&nbsp;&nbsp;다대포항 방파제</li>
											<li class="f-list2__item">북항 내 감만시민부두</li>
											<li class="f-list2__item">신항 소형선 부두 및 인접지역 </li>

										</ul>
									</div>
									<div class="f-list2__box">
										<div class="f-list2__heading">주요업무</div>
										<ul class="f-list2">
											<li class="f-list2__item">안전사고 예방활동, 항만환경관리 </li>
										</ul>
									</div>
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
