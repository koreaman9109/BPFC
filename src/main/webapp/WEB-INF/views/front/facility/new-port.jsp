<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>신항 항만시설관리</title>
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
							<li class="c-lnb__item c-lnb__item--active"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설관리</a></li>
							<li class="c-lnb__item"><a href="convention.do"
								class="c-lnb__link">부산항국제전시컨벤션센터</a></li>
							<li class="c-lnb__item"><a href="bisc.do"
								class="c-lnb__link">국제선용품유통센터</a></li>
							<li class="c-lnb__item"><a href="leisure.do"
								class="c-lnb__link">항만레저시설</a></li>
							<li class="c-lnb__item"><a href="etc.do"
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
								class="breadcrumb__link">신항 항만시설관리</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">소개</div></li>
						</ul>
					</div>
					<h3 class="c-h2">신항 항만시설관리</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-union">
						<h4 class="is-hidden">신항 항만시설관리 소개</h4>
						<ul class="c-tabs">
							<li class="c-tab c-tab--active"><a
								href="new-port.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="new-port_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab"><a href="new-port_3.do"
								class="c-link">부산항 홍보관 안내</a></li>
						</ul>
						
						<div class="f-infos f-infos--3">
							<div class="f-info__section f-info__section-1">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/fn-info__image-1_1.png" alt="국제여객터미널 CY 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">부산항 신항 배후단지 관리 / <br />부산항 신항 임항도로 및 외곽시설 관리</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">부산항 신항 배후단지 관리</div>
											<ul class="f-list2">
												<li class="f-list2__item">북컨배후단지 : 약 170만㎡ (28개사 30개 업장)</li>
												<li class="f-list2__item">웅동배후단지 : 약 249만㎡ (38개사)</li>
												<li class="f-list2__item">종&nbsp;합&nbsp;&nbsp;상황실 : 북컨(127대), 웅동(192대)</li>
											</ul>
										</div>
										<div class="f-list2__box">
											<div class="f-list2__heading">부산항 신항 입항도로 및 외곽시설 관리</div>
											<ul class="f-list2">
												<li class="f-list2__item">북 ’컨’ 배후단지, 욕망산 구간, 신항삼거리, <br />&nbsp;&nbsp;&nbsp;신항 1,2부두, 남 ‘컨’ 철도, 남 ‘컨’ 화물차 휴게소 구간, 
												<br />&nbsp;&nbsp;&nbsp;웅천대교 구간</li>
												<li class="f-list2__item">총 27km의 환경관리 및 순찰업무</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="f-info__section f-info__section-2">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/fn-info__image-2_1.png" alt="북항 공용부두 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">공용컨테이너 장치장</div>
										<ul class="f-list2">
											<li class="f-list2__item">신형배후단지 내 설치된 공컨테이너 야적장</li>
											<li class="f-list2__item">컨테이너 부두 내 컨테이너 작업편의를 지원</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="f-info__section f-info__section-3">
								<div class="f-info">
									<div class="f-info__image"><img src="images/facility/fn-info__image-3.png" alt="감천항 공용부두 전경" /></div>
									<div class="f-info__cont">
										<div class="f-heading">신항 지원건물 &middot; 운영관리</div>
										<ul class="f-list2">
											<li class="f-list2__item">부산광역시 강서구 신항로 96-87(성북동)</li>
											<li class="f-list2__item">연&ensp;면&ensp;적 : 6,528㎡ (지상 8층)</li>
											<li class="f-list2__item">주요시설 : 일반업무시설, 부산항홍보관 등</li>
											<li class="f-list2__item">용&emsp;&emsp;도 : 신항업무지원 및 부산항 홍보</li>
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
