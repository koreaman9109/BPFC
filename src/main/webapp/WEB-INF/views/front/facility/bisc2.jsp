<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>국제선용품유통센터(BISC) 소개</title>
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
							<li class="c-lnb__item c-lnb__item--active"><a href="bisc.do"
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
								class="breadcrumb__link">국제선용품유통센터</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">소개</div></li>
						</ul>
					</div>
					<h3 class="c-h2">국제선용품유통센터(BISC)</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-union">
						<h4 class="is-hidden">국제선용품유통센터(BISC) 소개</h4>
						<ul class="c-tabs">
							<li class="c-tab c-tab--active"><a
								href="bisc.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="bisc_2.do"
								class="c-link">시설현황</a></li>
							<li class="c-tab"><a href="bisc_3.do"
								class="c-link">입점안내</a></li>
						</ul>
						
						<div class="c-section">
							<div class="f-info__bimage">
								<img src="images/facility/fb-info__bimage.png" alt="국제선용품유통센터(BISC) 전경" />
							</div>
						</div>
						
						<div class="c-section">
							<div class="f-infos f-infos--2 f-infos--none">
								<div class="f-info__section f-info__section-1">
									<div class="f-info">
										<div class="f-info__cont">
											<div class="f-heading">개요</div>
											<ul class="f-list2 f-list2--none">
												<li class="f-list2__item">2012년 8월 건축연면적 33,455.21㎡, 지상 5층 규모로 준공되었으며 최신설비의 창고와 사무실, 지원시설 등을 갖춘 초현대식시설과 공항, 항만, 철도 등의 완벽한 인프라를 구축하고 있습니다</li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="f-info__section f-info__section-2">
									<div class="f-info">
										<div class="f-info__cont">
											<div class="f-list2__box">
												<div class="f-heading">주소</div>
												<ul class="f-list2 f-list2--none">
													<li class="f-list2__item">4049 부산광역시 영도구 남항서로 85</li>
														</ul>
													</li>
												</ul>
											</div>
											<div class="f-list2__box f-list2__box--border f-list2__box--large">
												<div class="f-heading">주요시설</div>
												<ul class="f-list2 f-list2--none">
													<li class="f-list2__item">창고 (냉동 및 냉장, 중량물, 일반), 사무실, 선용품전시장</li>
														</ul>
													</li>
												</ul>
											</div>
										</div>
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
