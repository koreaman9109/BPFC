<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=CL0Er3m5dabz5eoRnoXQ&submodules=geocoder"></script>
<title>오시는 길</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#Introduce').parent().parent().parent().parent().addClass('m-gnb__item--active');
});
</script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=CL0Er3m5dabz5eoRnoXQ&submodules=geocoder"></script>
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
							<li class="c-lnb__item"><a
								href="history.do" class="c-lnb__link">개요</a></li>
							<li class="c-lnb__item"><a href="business-goal.do"
								class="c-lnb__link">경영목표</a></li>
							<li class="c-lnb__item"><a href="organization.do"
								class="c-lnb__link">조직도</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="location.do"
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
								class="breadcrumb__link">BPFC 소개</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link"> 오시는 길</div></li>
						</ul>
					</div>
					<h3 class="c-h2">오시는 길</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="b-location">
						<div class="b-location__boxs">
							<div class="b-location__box b-location__box-1"><img src="images/bpfc/b-location__box.png" alt="부산항시설관리센터(부산항연악여객터미널2F) 위치설명" /></div>
							<div class="b-location__box b-location__box-2">
								<div id="map" style="width: 100%; height: 640px;" alt="지도"></div>
							</div>
						</div>
						<div class="b-location__infos">
							<div class="b-location__info b-location__info-1">
								<div class="b-location__address">
									48940 부산광역시 중구 충장대로 24 2층 (중앙동 4가 15-3) <br /> 부산본부세관 옆,
									구)국제여객터미널 2층
								</div>
							</div>
							<div class="b-location__info b-location__info-2">
								<div class="b-location__call">
									대표번호: <em class="b-location__call--em">051-400-3100</em>
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
		<script type="text/javascript">
			/* $('.copyright').on('click', function() {
				location.href = "login.do";
			}); */
			var map = new naver.maps.Map('map');
			var myaddress = '부산광역시 중구 충장대로 24';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
			naver.maps.Service
					.geocode(
							{
								address : myaddress
							},
							function(status, response) {
								if (status !== naver.maps.Service.Status.OK) {
									return alert(myaddress
											+ '의 검색 결과가 없거나 기타 네트워크 에러');
								}
								var result = response.result;
								// 검색 결과 갯수: result.total
								// 첫번째 결과 결과 주소: result.items[0].address
								// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
								var myaddr = new naver.maps.Point(
										result.items[0].point.x,
										result.items[0].point.y);
								map.setCenter(myaddr); // 검색된 좌표로 지도 이동
								// 마커 표시
								var marker = new naver.maps.Marker({
									position : myaddr,
									map : map
								});
								// 마커 클릭 이벤트 처리
								naver.maps.Event.addListener(marker, "click",
										function(e) {
											if (infowindow.getMap()) {
												infowindow.close();
											} else {
												infowindow.open(map, marker);
											}
										});
								// 마크 클릭시 인포윈도우 오픈
								var infowindow = new naver.maps.InfoWindow(
										{
											content : '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
										});
							});
		
		</script>

	</div>
</body>
</html>