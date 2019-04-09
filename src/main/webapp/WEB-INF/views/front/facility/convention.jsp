<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>부산항국제전시컨벤션센터 소개</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=CL0Er3m5dabz5eoRnoXQ&submodules=geocoder"></script>
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
							<li class="c-lnb__item c-lnb__item--active"><a href="convention.do"
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
								class="breadcrumb__link">부산항국제전시컨벤션센터</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">소개</div></li>
						</ul>
					</div>
					<!-- 		<div class="c-h2">
						<h3>부산항국제전시컨벤션센터</h3>
						<div class="c-heading__detail">(BPEX&middot;Busan Port International Exhibition &amp; Convention Center)</div>
					</div> -->
					
					<div class="c-h2">
						<h3>부산항국제전시컨벤션센터(BPEX)&ensp;</h3>
						<div>
						<a id="sns_id111" href="https://www.facebook.com/bpex.kr" target="_blank"><img class="f_sns1" src="images/pages/sns_01.png" alt="부산항국제전시컨벤션센터 페이스북연결" /></a>
						<a href="https://www.instagram.com/bpex_kr/" target="_blank"><img class="f_sns1" src="images/pages/sns_03.png" alt="부산항국제전시컨벤션센터 인스타그램연결" /></a>
						<a href="https://blog.naver.com/bpex_kr" target="_blank"><img class="f_sns1" src="images/pages/sns_04.png" alt="부산항국제전시컨벤션센터 네이버블로그연결" /></a>
						</div>
					</div>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-union">
						<h4 class="is-hidden">부산항국제전시컨벤션센터</h4>
						<ul class="c-tabs">
							<li class="c-tab c-tab--active"><a
								href="convention.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="convention_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab"><a href="convention_3.do"
								class="c-link">이용안내</a></li>
							<li class="c-tab"><a href="convention_5.do"
								class="c-link">MOU 체결 현황</a></li>
							<li class="c-tab"><a href="convention_4.do"
								class="c-link">일정</a></li>
						</ul>

						<div class="c-section">
							<div class="f-info__bimage">
								<img src="images/facility/fc-info__bimage1.png" alt="부산항국제전시컨벤션센터 메인이미지" />
							</div>
						</div>
						
						<h5 class="f-heading f-heading--color" style="margin-top:20px;">평면도</h5>
						<div class="c-section">
							<div class="f-info__bimage">
								<img src="images/facility/fc-info__bimage.png" alt="부산항국제전시컨벤션센터 구조" />
							</div>
						</div>

						<div class="c-section">
							<div class="c-sections c-sections--padding">
								<h5 class="f-heading f-heading--color">시설개요</h5>
								<div class="c-section">
									<div class="c-tables c-tables--scroll">
										<table class="c-table c-table--font">
											<caption><span class="is-hidden">부산항국제전시컨벤션센터 시설개요: 위치, 전체면적, 주요시설, 부대시설</span></caption>
											<colgroup>
												<col style="width: 30%" />
												<col style="width: 70%" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">위&ensp;&ensp;&nbsp;&nbsp;&nbsp;치</th>
													<td class="c-table__left">부산광역시 동구 충장대로 206(부산항국제여객터미널 5층)</td>
												</tr>
												<tr>
													<th scope="row">전체면적</th>
													<td class="c-table__left">11,007.64㎡(공조실, 계단 등 공용면적 제외)</td>
												</tr>
												<tr>
													<th scope="row">주요시설</th>
													<td class="c-table__left">컨퍼런스홀(1), 다목적이벤트홀(1), 회의실(10)</td>
												</tr>
												<tr>
													<th scope="row">부대시설</th>
													<td class="c-table__left">동시통역실, 라운지, 홍보관, 편의시설 등</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						
						<div class="c-section">
							<div class="f-infos f-infos--3">
								<div class="f-info__section f-info__section-1">
									<div class="f-info">
										<div class="f-info__image"><img src="images/facility/fc-info__image-1.png" alt="이벤트 홀 전경" /></div>
										<div class="f-info__cont">
											<div class="f-heading">이벤트 홀</div>
											<ul class="f-list2">
												<li class="f-list2__item">면&emsp;&emsp;적 : 1,709.58㎡</li>
												<li class="f-list2__item">주요용도 : 전시행사, 박람회, 기업행사 등</li>
												<li class="f-list2__item">특&emsp;&emsp;징 : 최대 4개실 통합 가능</li>
												<li class="f-list2__item">수용인원 : 1,680명(극장식)</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="f-info__section f-info__section-2">
									<div class="f-info">
										<div class="f-info__image"><img src="images/facility/fc-info__image-2.png" alt="컨퍼런스 홀 전경" /></div>
										<div class="f-info__cont">
											<div class="f-heading">컨퍼런스 홀</div>
											<ul class="f-list2">
												<li class="f-list2__item">면&emsp;&emsp;적 : 1,657.4㎡</li>
												<li class="f-list2__item">주요용도 : 국제회의, 기업회의, 세미나, 심포지움</li>
												<li class="f-list2__item">특&emsp;&emsp;징 : 최대 6개실 통합 가능
													<!-- <ul class="f-list2 f-list2--none"> </ul>-->
												<li class="f-list2__item">수용인원 : 1,840명(극장식)</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="f-info__section f-info__section-3">
									<div class="f-info">
										<div class="f-info__image"><img src="images/facility/fc-info__image-3.png" alt="회의실 전경" /></div>
										<div class="f-info__cont">
											<div class="f-heading">회의실</div>
											<ul class="f-list2">
												<li class="f-list2__item">면&emsp;&emsp;적 : 65~80㎡로 총 10개 회의실 운영</li>
												<li class="f-list2__item">주요용도 : 국제회의, 기업회의, 세미나, 심포지움</li>
												<li class="f-list2__item">특&emsp;&emsp;징 : 1+2 / 3+4 / 6+7 / 8+9 통합이용 가능</li>
												<li class="f-list2__item">수용인원 : 70명(극장식), 40명(강의식)</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="c-section">
							<div class="c-sections c-sections--padding">
								<h5 class="f-heading f-heading--color">오시는길</h5>
								<div class="c-section">
									<div id="map" style="width: 100%; height: 500px;" alt="부산항국제전시컨벤션센터 오시는길 지도"></div>
								</div>
								<div class="c-section">
									<div class="c-tables c-tables--scroll">
										<table class="c-table">
											<caption><span class="is-hidden">부산항국제전시컨벤션센터 오시는길: 부산역(철도)방면에서 도보로 이동, 지하철 방면에서 순황버스 이용, 시내버스, 김혜국제공항(공항버스+시내버스), 김해국제공항(지하철)</span></caption>
											<colgroup>
												<col style="width: 15%" />
												<col style="width: 15%" />
												<col style="width: 15%" />
												<col style="width: 55%" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row" colspan="2" rowspan="2">부산역(철도)방면에서 도보로 이동</th>
													<th scope="row">이동방향</th>
													<td class="c-table__left">부산역사 8번출입구  <span class="c-table__gt">&gt;</span>  북측 E/V  <span class="c-table__gt">&gt;</span>  횡단보도(충장대로)   <span class="c-table__gt">&gt;</span>  부산항국제여객터미널</td>
												</tr>
												<tr>
													<th scope="row">소요시간</th>
													<td class="c-table__left">약 10-15분</td>
												</tr>
												<tr>
													<th scope="row" colspan="2" rowspan="2">지하철 방면에서 순환버스 이용 <br />(*환승할인가능)</th>
													<th scope="row">운행노선</th>
													<td class="c-table__left">국제여객터미널  <span class="c-table__gt">&gt;</span>  부산역 후문 9번 출구  <span class="c-table__gt">&gt;</span>  부산세관 앞(연안여객터미널)  <span class="c-table__gt">&gt;</span>  중양역(14번 출구) <span class="c-table__gt">&gt;</span> 크라운하버호텔  <span class="c-table__gt">&gt;</span>  부산역(지하철 4번 출구 한국교직원공제회관 앞)  <span class="c-table__gt">&gt;</span>  초량역(4번 출구, 우회전 119소방서 맞은편)  <span class="c-table__gt">&gt;</span>  국제여객터미널</td>
												</tr>
												<tr>
													<th scope="row">배차간격</th>
													<td class="c-table__left">약 30분(07-19시)</td>
												</tr>
												<tr>
													<th scope="row" rowspan="4">시내버스</th>
													<th scope="row" rowspan="2">5-1</th>
													<th scope="row">운행노선</th>
													<td class="c-table__left">반여1동  <span class="c-table__gt">&gt;</span>  서면  <span class="c-table__gt">&gt;</span>  충장로  <span class="c-table__gt">&gt;</span>  부산항국제여객터미널  <span class="c-table__gt">&gt;</span>  충장로  <span class="c-table__gt">&gt;</span>  자갈치</td>
												</tr>
												<tr>
													<th scope="row">배차간격</th>
													<td class="c-table__left">약 11분(07-09시 / 17-19시), 13분(이외 시간)</td>
												</tr>
												<tr>
													<th scope="row" rowspan="2">1004</th>
													<th scope="row">운행노선</th>
													<td class="c-table__left">김해  <span class="c-table__gt">&gt;</span>  덕천  <span class="c-table__gt">&gt;</span>  모라  <span class="c-table__gt">&gt;</span>  백양터널  <span class="c-table__gt">&gt;</span>  서면  <span class="c-table__gt">&gt;</span>  부산역  <span class="c-table__gt">&gt;</span>  부산항국제여객터미널</td>
												</tr>
												<tr>
													<th scope="row">배차간격</th>
													<td class="c-table__left">약 8분(07-09시 / 17시-19시), 9분(이외 시간)</td>
												</tr>
												<tr>
													<th scope="row" colspan="2" rowspan="2">김해국제공항 (공항버스+시내버스 이용)</th>
													<th scope="row">이동방향</th>
													<td class="c-table__left">국제선청사 공항리무진1탑승  <span class="c-table__gt">&gt;</span>  부산진역 정류장 하차  <span class="c-table__gt">&gt;</span>  1004번 버스 승차  <span class="c-table__gt">&gt;</span>  부산항컨벤션센터 도착</td>
												</tr>
												<tr>
													<th scope="row">소요시간</th>
													<td class="c-table__left">약 50-55분</td>
												</tr>
												<tr>
													<th scope="row" colspan="2" rowspan="2">김해국제공항 (지하철)</th>
													<th scope="row">이동방향</th>
													<td class="c-table__left">공항역(경전철)  <span class="c-table__gt">&gt;</span>  2호선 사상역 환승  <span class="c-table__gt">&gt;</span>  1호선 서면역 환승  <span class="c-table__gt">&gt;</span>  초량역 하차  <span class="c-table__gt">&gt;</span>  4번출구에서 도보 10분</td>
												</tr>
												<tr>
													<th scope="row">소요시간</th>
													<td class="c-table__left">약 1시간-1시간 10분	</td>
												</tr>
											</tbody>
										</table>
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
		
		<script type="text/javascript">
		var map = new naver.maps.Map('map');
		var myaddress = '부산광역시 동구 충장대로 206';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
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
										content : '<h4> 부산항국제전시컨벤션센터 </h4>'
										/* <a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a> */
									});
						});
		</script>
	</div>
</body>
</html>
