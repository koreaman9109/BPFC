<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>국제선용품유통센터(BISC) 시설현황</title>
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
								class="breadcrumb__link">시설현황</div></li>
						</ul>
					</div>
					<h3 class="c-h2">국제선용품유통센터(BISC)</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<h4 class="is-hidden">국제선용품유통센터(BISC) 시설현황</h4>
					<ul class="c-tabs">
						<li class="c-tab"><a
							href="bisc.do" class="c-link">소개</a></li>
						<li class="c-tab c-tab--active"><a href="bisc_2.do"
							class="c-link">시설현황</a></li>
						<li class="c-tab"><a href="bisc_3.do"
							class="c-link">입점안내</a></li>
					</ul>

					<div class="c-sections">
						<h5 class="f-heading">시설물 현황</h5>
						<div class="c-section">
							<div class="c-tables c-tables--scroll">
								<table class="c-table c-table__th--none">
									<caption><span class="is-hidden">시설물 현황: 1층, 2~3층, 2~5층, 편의시설, 기타시설</span></caption>
									<colgroup>
										<col style="width: 20%" />
										<col style="width: 30%" />
										<col style="width: 20%" />
										<col style="width: 30%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">1층</th>
											<td class="c-table__left">냉동, 냉장, 중량물창고, 선용품전시장</td>
											<th scope="col">2~3층</th>
											<td class="c-table__left">일반창고</td>
										</tr>
										<tr>
											<th scope="col">2~5층</th>
											<td class="c-table__left">사무실</td>
											<th scope="col">편의시설</th>
											<td class="c-table__left">식당, 편의점, 휴식공간</td>
										</tr>
										<tr>
											<th scope="col">기타시설</th>
											<td class="c-table__left" colspan="3">로비공간, 주차장(362대 수용), 화물 엘리베이터(3톤적재 가능) 상수, 중수, 중온수, 오배수, 전기, LNG, 초고속 LAN, CCTV</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="c-sections">
						<div class="c-section">
							<div class="c-tables c-tables--scroll">
								<table class="c-table">
									<caption><span class="is-hidden">시설물 현황: 층별, 용도, 전용면적, 공용면적, 공급면적</span></caption>
									<thead>
										<tr>
											<th scope="col">층별</th>
											<th scope="col">용도</th>
											<th scope="col">전용면적</th>
											<th scope="col">공용면적</th>
											<th scope="col">공급면적</th>
										</tr>
									</thead>
									<tbody>
										 <tr>
										 	<td class="c-table__brown" rowspan="3">1층</td>
											<td>냉동창고</td>
											<td>354.10㎡</td>
											<td>343.36㎡</td>
											<td>697.46㎡</td>
										 </tr>
										 <tr>
											<td class="c-table__b-left">냉장창고</td>
											<td>362.48㎡</td>
											<td>351.49㎡</td>
											<td>713.97㎡</td>
										 </tr>
										 <tr>
											<td class="c-table__b-left">중량물창고</td>
											<td>3,138.53㎡</td>
											<td>3,043.37㎡</td>
											<td>6,181.90㎡</td>
										 </tr>
										 <tr>
										 	<td class="c-table__brown" rowspan="2">2층</td>
											<td>일반창고</td>
											<td>3,101.59㎡</td>
											<td>3,007.55㎡</td>
											<td>6,109.14㎡</td>
										 </tr>
										 <tr>
											<td class="c-table__b-left">사무실</td>
											<td>1,123.64㎡</td>
											<td>1,104.87㎡</td>
											<td>2,228.51㎡</td>
										 </tr>
										 <tr>
										 	<td class="c-table__brown" rowspan="2">3층</td>
											<td>일반창고</td>
											<td>3,399.30㎡</td>
											<td>3,296.23㎡</td>
											<td>6,695.53㎡</td>
										 </tr>
										 <tr>
											<td class="c-table__b-left">사무실</td>
											<td>1,664.22㎡</td>
											<td>1,636.43㎡</td>
											<td>3,300.65㎡</td>
										 </tr>
										 <tr>
											<td class="c-table__brown">4층</td>
											<td>사무실</td>
											<td>1,777.10㎡</td>
											<td>1,747.42㎡</td>
											<td>3,524.52㎡</td>
										 </tr>
										 <tr>
											<td class="c-table__brown">5층</td>
											<td>사무실</td>
											<td>665.07㎡</td>
											<td>653.95㎡</td>
											<td>1,319.02㎡</td>
										 </tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<!-- <div class="c-sections">
						<h5 class="f-heading">시설물</h5>
						<div class="fi-work__box">
							<div class="fi__pictures">
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fc__image-1.png" alt="국제 회의실" /></div>
									<div class="fi__subject">국제 회의 개최</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fc__image-2.png" alt="대형 박람회" /></div>
									<div class="fi__subject">대형 박람회 개최</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fc__image-3.png" alt="대형 전시실" /></div>
									<div class="fi__subject">대형 전시회 개최</div>
								</div>
								<div class="fi__picture">
									<div class="fi__image"><img src="images/facility/fc__image-4.png" alt="세미나실" /></div>
									<div class="fi__subject">각종 회의 및 세미나 개최</div>
								</div>
							</div>
						</div>
						<div class="c-section">
						</div>
					</div> -->
					
					
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
