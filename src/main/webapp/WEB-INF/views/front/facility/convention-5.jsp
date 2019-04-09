<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>부산항국제전시컨벤션센터 소개</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=CL0Er3m5dabz5eoRnoXQ&submodules=geocoder"></script>
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
							<li class="c-lnb__item"><a href="international.do"
								class="c-lnb__link">부산항 여객터미널</a></li>
							<li class="c-lnb__item"><a href="union.do"
								class="c-lnb__link">공용부두 화물관리</a></li>
							<li class="c-lnb__item"><a href="new-port.do"
								class="c-lnb__link">신항 항만시설관리</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="convention.do" class="c-lnb__link">부산항국제전시컨벤션센터</a></li>
							<li class="c-lnb__item"><a href="bisc.do"
								class="c-lnb__link">국제선용품유통센터</a></li>
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
									class="breadcrumb__link">부산항국제전시컨벤션센터</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
									class="breadcrumb__link">MOU 체결 현황</div></li>
						</ul>
					</div>
					<div class="c-h2">
						<h3>부산항국제전시컨벤션센터(BPEX)&ensp;<a href="https://www.facebook.com/bpex.kr" target="_blank"><img class="f_sns1" src="images/pages/sns_01.png" alt="부산항국제전시컨벤션센터 페이스북연결" /></a></h3>
					</div>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-union">
						<h4 class="is-hidden">부산항국제전시컨벤션센터</h4>
						<ul class="c-tabs">
							<li class="c-tab"><a href="convention.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="convention_2.do" class="c-link">주요업무</a></li>
							<li class="c-tab"><a href="convention_3.do" class="c-link">이용안내</a></li>
							<li class="c-tab c-tab--active"><a href="convention_5.do"
								class="c-link">MOU 체결 현황</a></li>
							<li class="c-tab"><a href="convention_4.do" class="c-link">일정</a></li>
						</ul>
						<!-- 테이블 -->
						<div class="c-sections c-sections--padding">
							<h6 class="f-heading f-heading--color">MOU 체결 현황</h6>
							<div class="c-section">
								<div class="c-tables c-tables--scroll">
								<ul class="f-list2">
								<li class="f-list2__item">아래 업체는 BPEX와 업무협약이 체결된 곳이며, 컨벤션센터 이용시 이용요금 할인이 적용됩니다.<br />&emsp;자세한 사항은 해당 업체에 문의 바랍니다.</li>
							</ul>
									<table class="c-table">
										<caption><span class="is-hidden">MOU 체결 현황: 시설, 업종, 위치, 홈페이지, 연락처</span></caption>
										<colgroup>
											<col style="width: 20%" />
											<col style="width: 12%" />
											<col style="width: 36%" />
											<col style="width: 13%" />
											<col style="width: 17%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">업체명</th>
												<th scope="col">업종</th>
												<th scope="col">위치</th>
												<th scope="col">홈페이지</th>
												<th scope="col">연락처</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>부산롯데호텔</td>
												<td>숙박</td>
												<td>부산광역시 부산진구 가야대로 772</td>
												<td><a href="http://www.lottehotel.com/busan/ko/" class="f-link" title="부산롯데호텔 홈페이지 새창으로 연결" target="_blank">부산롯데호텔 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-810-5200" style="cursor:default;">051-810-5200</a></td>
											</tr>
											<tr>
												<td>웨스틴 조선호텔 부산</td>
												<td>숙박</td>
												<td>부산광역시 해운대구 우1동</td>
												<td><a href="https://twcb.echosunhotel.com/" class="f-link" title="웨스틴 조선호텔 부산 홈페이지 새창으로 연결" target="_blank">웨스틴 조선호텔 부산 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-749-7237" style="cursor:default;">051-749-7237</a></td>
											</tr>
											<tr>
												<td>코모도호텔</td>
												<td>숙박</td>
												<td>부산 중구 중구로 151</td>
												<td><a href="http://commodore.co.kr/html/main/" class="f-link" title="코모도호텔 홈페이지 새창으로 연결" target="_blank">코모도호텔 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-466-9101" style="cursor:default;">051-466-9101</a></td>
											</tr>
											<tr>
												<td>크라운하버 호텔</td>
												<td>숙박</td>
												<td>부산광역시 중구 중앙대로 114</td>
												<td><a href="https://www.crownharborhotel.com:4442/" class="f-link" title="크라운하버 호텔 홈페이지 새창으로 연결" target="_blank">크라운하버 호텔 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-678-1116" style="cursor:default;">051-678-1116</a></td>
											</tr>
											<tr>
												<td>호텔농심</td>
												<td>숙박</td>
												<td>부산광역시 동래구 금강공원로 20번길 23</td>
												<td><a href="http://www.hotelnongshim.com/" class="f-link" title="호텔농심 홈페이지 새창으로 연결" target="_blank">호텔농심 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-550-2400" style="cursor:default;">051-550-2400</a></td>
											</tr>
											<tr>
												<td>코오롱 씨클라우드호텔</td>
												<td>숙박</td>
												<td>부산광역시 해운대구 해운대해변로 287, 4F</td>
												<td><a href="http://www.seacloudhotel.com/" class="f-link" title="코오롱 씨클라우드호텔 홈페이지 새창으로 연결" target="_blank">코오롱 씨클라우드호텔 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-933-1253" style="cursor:default;">051-933-1253</a></td>
											</tr>
											<tr>
												<td>아스티호텔 부산</td>
												<td>숙박</td>
												<td>부산광역시 동구 중앙대로 214번길 7-8</td>
												<td><a href="http://www.astihotel.co.kr" class="f-link" title="아스티호텔 부산 홈페이지 새창으로 연결" target="_blank">아스티호텔 부산 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-409-8888" style="cursor:default;">051-409-8888</a></td>
											</tr>
											<tr>
												<td>밸류호텔 부산</td>
												<td>숙박</td>
												<td>부산광역시 영도구 태종로 45</td>
												<td><a href="http://www.valuehotelbusan.com" class="f-link" title="밸류호텔 부산 홈페이지 새창으로 연결" target="_blank">밸류호텔 부산 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-960-5500" style="cursor:default;">051-960-5500</a></td>
											</tr>
											<tr>
												<td>이비스 앰배서더 부산 호텔</td>
												<td>숙박</td>
												<td>부산광역시 부산진구 중앙대로 777</td>
												<td><a href="http://www.ambatel.com/ibis/busan/" class="f-link" title="이비스 앰배서더 부산 호텔 홈페이지 새창으로 연결" target="_blank">이비스 앰배서더 부산 호텔 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-930-1100" style="cursor:default;">051-930-1100</a></td>
											</tr>
											<tr>
												<td>더 파티</td>
												<td>프랜차이즈<br />외식업체</td>
												<td>부산광역시 부산진구 자유평화로 11 (누리엔 빌딩 12층)</td>
												<td><a href="http://www.thepartytogo.com" class="f-link" title="더 파티 홈페이지 새창으로 연결" target="_blank">더 파티 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:1522-6090" style="cursor:default;">1522-6090</a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							
						</div>
						<!-- 테이블 end -->
						
						<div class="c-sections c-sections--padding">
						<h6 class="f-heading f-heading--color">지정협력업체 현황</h6>
						<div class="c-section">
						<ul class="f-list2">
								<li class="f-list2__item">행사장 조성 공사는 한국전시산업진흥회에 등록된 지정등록업체를 이용하여야 하며. 업종별 면허소지자가 시공하여야 합니다.<br />&emsp;(단, 센터와 임차인 간에 사전협의가 되어 지정등록업체 외 타 업체의 작업이 불가피하다고 인정될 경우에는 필요서류 구비 후 작업 가능)</li>
							</ul><br />
							<a href="javascript:void(0);" onclick="convention_5_bt1('BPEX.pdf')" title="첨부파일 다운로드" download>
								<button class="c-button c-button--blue c-button--middle" style="width: 250px;">지정협력업체 자료 내려받기</button>
							</a>
						</div>
						</div>
						
						
					</div>
				</div>
			</div>
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