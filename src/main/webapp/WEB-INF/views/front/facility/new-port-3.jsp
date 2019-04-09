<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>신항 항만시설관리 부산항 홍보관 안내</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=CL0Er3m5dabz5eoRnoXQ&submodules=geocoder"></script>
<script>
	function international() {
		window.open('http://www.busanpa.com/bpt/Contents.do?mCode=MN0006',
				'_blank')
	}
</script>
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
								class="breadcrumb__link">부산항 홍보관 안내</div></li>
						</ul>
					</div>
					<h4 class="c-h2">신항 항만시설관리</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-public">
						<h5 class="is-hidden">신항 항만시설관리 부산항 홍보관 안내</h5>
						<ul class="c-tabs">
							<li class="c-tab"><a
								href="new-port.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="new-port_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab c-tab--active"><a href="new-port_3.do"
								class="c-link">부산항 홍보관 안내</a></li>
						</ul>
						
						<div class="c-sections c-sections--small c-sections--padding">
							<h6 class="f-heading f-heading--color">견학신청안내</h6>
							<div class="c-section">
								<ul class="fi-parking__list">
									<li class="fi-parking__item">
										1. 이용대상 : 바다를 좋아하고 해양항만업무에 관심이 많으며 홍보관 견학을 원하는 모든 사람
										<br />※ 신청자 포함 1일 최대 40명
									</li>
									<li class="fi-parking__item">2. 운영시간 : 09:30 ~ 17:00 매주 월요일 ~ 금요일(법정공휴일 휴관)</li>
									<li class="fi-parking__item">
									<div class="fi-parking__txt">
										3. 신청방법 :
									</div>
									<button class="c-button c-button--blue" onclick="new_port_bt1()">신청하러 가기</button>
									</li>
								</ul>
							</div>
						</div>
						
						<div class="c-sections c-sections--small c-sections--padding">
							<h6 class="f-heading f-heading--color">문의사항 : <a class="phone_css" href="tel:051-972-6369" style="cursor:default; color:#1b5c93; font-weight: 700;">051-972-6369</a></h6>
						</div>
						
						<div class="c-sections c-sections--small c-sections--padding">
							<h6 class="f-heading f-heading--color">오시는 길</h6>
							<div class="fn-location">
								<div id="map" style="width: 80%; height: 500px;" alt="부산항 홍보관 지도"></div>
								<!-- <img src="images/facility/fn-location.png" alt="신항 항만시설관리 위치 표시된 지도" /> -->
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
			var map = new naver.maps.Map('map');
			var myaddress = '부산광역시 강서구 신항로 96-87';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
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
											content : '<h4> 부산항 홍보관</h4><a href="http://www.busanpa.com/bpr/Contents.do?mCode=MN0004" target="_blank"></a>'
										});
							});
		
		</script>
	</div>
</body>
</html>