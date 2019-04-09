<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>국제선용품유통센터(BISC) 소개</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=CL0Er3m5dabz5eoRnoXQ&submodules=geocoder"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#facility_na').parent().addClass('m-gnb__item--active');
	});
</script>
<style type="text/css">
#c-table-font td, #c-table-font th {
	font-size: 16px;
}
</style>
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
							<li class="c-lnb__item"><a href="international.do"
								class="c-lnb__link">부산항 여객터미널</a></li>
							<li class="c-lnb__item"><a href="union.do"
								class="c-lnb__link">공용부두 화물관리</a></li>
							<li class="c-lnb__item"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설관리</a></li>
							<li class="c-lnb__item"><a href="convention.do"
								class="c-lnb__link">부산항국제전시컨벤션센터</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="bisc.do" class="c-lnb__link">국제선용품유통센터</a></li>
							<li class="c-lnb__item"><a href="leisure.do"
								class="c-lnb__link">항만레저시설</a></li>
							<li class="c-lnb__item"><a href="etc.do" class="c-lnb__link">기타항만시설관리</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="c-headings">
				<div class="c-aligner">
					<div class="breadcrumb">
						<ul class="breadcrumb__list">
							<li class="breadcrumb__item breadcrumb__item--home"><div
									class="breadcrumb__link">
									<a href="main.do" id="content">홈</a>
								</div></li>
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
							<li class="c-tab c-tab--active"><a href="bisc.do"
								class="c-link">소개</a></li>
							<li class="c-tab"><a href="bisc_2.do" class="c-link">시설현황</a></li>
							<li class="c-tab"><a href="bisc_3.do" class="c-link">입점안내</a></li>
						</ul>
					</div>

					<div class="c-sections">
						<h5 class="f-heading">시설개요</h5>
						<div class="c-section">
							<div class="f-info__bimage1">
								<img src="images/facility/fb-info__bimage.png"
									alt="국제선용품유통센터(BISC) 전경" />
							</div>


							<div class="f-info__bimage2">
								<div class="c-sections c-sections--padding">

									<div class="c-section">
										<div class="c-tables c-tables--scroll">
											<table class="c-table c-table--font" id="c-table-font">
												<caption>
													<span class="is-hidden">국제선용품유통센터 시설개요: 위치, 면적,
														건물형태, 주요시설, 부대시설, 지역지구</span>
												</caption>
												<colgroup>
													<col style="width: 20%" />
													<col style="width: 80%" />
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">위&ensp;&ensp;&nbsp;&nbsp;&nbsp;치</th>
														<td class="c-table__left">4049 부산광역시 영도구 남항서로 85번길
															(남항동2가)</td>
													</tr>
													<tr>
														<th scope="row">면&ensp;&ensp;&nbsp;&nbsp;&nbsp;적</th>
														<td class="c-table__left">대지 26,119.60㎡ / 건축
															10,266.85㎡ / 연면적 33,455.21㎡</td>
													</tr>
													<tr>
														<th scope="row">건물형태</th>
														<td class="c-table__left">지상사무동 5층, 창고동 3층</td>
													</tr>
													<tr>
														<th scope="row">주요시설</th>
														<td class="c-table__left">사무실, 창고(냉동•냉장•중량물•일반), 전시장,
															회의실</td>
													</tr>
													<tr>
														<th scope="row">부대시설</th>
														<td class="c-table__left">식당, 편의점, 주차장(362대 수용) 등</td>
													</tr>
													<tr>
														<th scope="row">지역지구</th>
														<td class="c-table__left">자유무역지역 지정</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="c-sections" style="padding-top: 300px">
						<h5 class="f-heading">개요</h5>
						<div class="c-section">
							<div class="f-info__bimage"
								style="width: 95%; margin-left: 10px;">
								<a style="margin-left: 10px;">선용품유통시장의 새로운 미래를 열어갈
									부산항국제선용품유통센터는 2012년 8월 준공된 건축연면적 33,455.21㎡, 지상 5층, 창고 3층 규모로서
									선용품전시장, 중량물, 냉동, 냉장, 일반창고, 사무실 및 식당, 편의시설 등의 지원시설을 갖추고 있는 선용품
									유통에 적합한 친환경 시스템을 도입한 최신 시설로 최적의 업무환경을 구축 하고 있습니다.</a>
							</div>
						</div>
					</div>

					<div class="c-sections">
						<h5 class="f-heading">설립목적</h5>
						<div class="c-section">

							<div class="f-info__bimage"
								style="width: 95%; margin-left: 10px;">
								<a style="margin-left: 10px;">자유무역지역으로 지정된 영도 남항동 소재 국유지에
									선용품센터를 건립하여 부산시내 흩어져 있는 선용품업체들을 한 곳에 모아 공동물류 창고를 통해 유통구조를 개선하여
									선용품업계의 경쟁력을 강화하고, 부산항을 고부가가치 항만으로 육성하는 것을 목적으로 건립하였음 </a>
							</div>
						</div>
					</div>

					<div class="c-sections">
						<h5 class="f-heading">선용품이란</h5>
						<div class="c-section">
							<div class="f-info__bimage"
								style="width: 95%; margin-left: 10px;">
								<ul class="f-list2">
									<li class="f-list2__item">어선, 여객선, 화물선 등 선박 내에서 사용되는 모든
										물품을 일컫는 것입니다.</li>
									<li class="f-list2__item">음료, 식품, 의류, 식수 등 선원들 일상생활용품에서부터
										시작하여 선박용 기계류, 유류, 공구류 등 그 종류가 매우 다양하다.</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="c-sections">
						<h5 class="f-heading">주요업무</h5>
						<div class="c-section">
							<div class="f-info__bimage"
								style="width: 95%; margin-left: 10px;">
								<ul class="f-list2">
									<li class="f-list2__item">시설관리 및 운영관리</li>
									<li class="f-list2__item">시설이용객 안전관리</li>
									<li class="f-list2__item">이용객 쾌적한 환경제공</li>
									<li class="f-list2__item">기타 부속시설 관리</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="c-sections">
						<h5 class="f-heading">부산항국제선용품유통센터 위치도</h5>
						<div class="c-section">
							<div class="f-info__bimage" style="width: 95%; margin-left: 10px;">
								<!-- <div style="width: 95%;height: 200px;">지도</div> -->
								<div class="c-section" id="bisc_map">
									<div id="map" style="width: 100%;"></div>
								</div>
							</div>
							<div class="f-info__bimage"
								style="width: 95%; margin-left: 10px;">
								<ul class="f-list2">
									<li class="f-list2__item">부산역 중앙대로를 따라 중앙동을 지나 남포동방면으로
									직진하다가, 광복점 롯데백화점 사거리에서 좌측방향으로 이동 후 영도대교를 이용해서 대교동으로 진입합니다.</li>
									<li class="f-list2__item">대교동에서 남항동 방면으로 우회전 후, 남항서로 92번길을 따라 직전하시면 남항서로 85번길(남항동2가 16번지)
									국제선용품유통센터에 도착합니다.</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="c-sections">
						<h5 class="f-heading">버스로 찾아오시는 길</h5>
						<div class="c-section">
							<div class="c-tables c-tables--scroll">
								<table class="c-table" style="width: 80%;">
									<caption>
										<span class="is-hidden">버스로 오는시는 길: 부산역 출발, 남포동 출발,
											자갈치시장 출발</span>
									</caption>
									<colgroup>
										<col style="width: 20%" />
										<col style="width: 40%" />
										<col style="width: 40%" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">버스번호</th>
											<th scope="col">하차정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="c-table__brown" rowspan="2">부산역 출발</td>
											<td>508</td>
											<td>남항동정류장 하차, 도보 4분</td>
										</tr>
										<tr>
											<td class="c-table__b-left">66,82,85,88A,88B</td>
											<td>영도경찰서정류장 하차, 도보 10분</td>
										</tr>
										<tr>
											<td class="c-table__brown">남포동 출발</td>
											<td>8</td>
											<td>영도경찰서정류장 하차, 도보 10분</td>
										</tr>
										<tr>
											<td class="c-table__brown" rowspan="2">자갈치시장 출발</td>
											<td>6,71</td>
											<td>남항동정류장 하차, 도보 4분</td>
										</tr>
										<tr>
											<td class="c-table__b-left">113,30</td>
											<td>영도경찰서정류장 하차 도보 10분</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</div>



		</div>
	
	<!-- // 내용-->

	<!-- 바로가기 및 맨위로 -->
	<jsp:include page="../../sub_quick.jsp"></jsp:include>
	<!-- end -->

	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
	<!-- end -->
	
	<script type="text/javascript">
		var map = new naver.maps.Map('map');
		var myaddress = '부산광역시 영도구 남항서로 85';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
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
										content : '<h4> 국제선용품유통센터 </h4>'
										/* <a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a> */
									});
						});
		</script>
		</div>
</body>
</html>
