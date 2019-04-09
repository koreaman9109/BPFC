<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>부산항 여객터미널 주차장이용안내</title>
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
							<li class="c-lnb__item c-lnb__item--active"><a
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
								class="breadcrumb__link">부산항 여객터미널</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">주차장이용안내</div></li>
						</ul>
					</div>
					<h4 class="c-h2">부산항 여객터미널</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="fi-parking">
						<h5 class="is-hidden">부산항 여객터미널 주차장이용안내</h5>
						<ul class="c-tabs">
							<li class="c-tab"><a
								href="international.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="international_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab c-tab--active"><a href="international_3.do"
								class="c-link">주차장이용안내</a></li>
							<li class="c-tab"><a href="international_4.do"
								class="c-link">운항정보</a></li>
						</ul>
						
						<h6 class="f-heading f-heading--color">국제여객터미널 &amp; 제2국제 크루즈터미널</h6>
						<div class="c-sections c-sections--padding">
							<div class="c-section">
								<ul class="fi-parking__list">
									<li class="fi-parking__item">1. 이용시간 : 연중상시운영</li>
									<li class="fi-parking__item">2. 이용요금</li>
								</ul>
							</div>
							
							<div class="c-section c-section--x-small">
								<div class="c-tables c-tables--scroll">
									<table class="c-table">
										<caption><span class="is-hidden">국제여객터미널 & 제2국제 크루즈터미널 이용요금: 구분, 최초10분, 11~30분, 초과, 일주차, 월주차</span></caption>
										<thead>
											<tr>
												<th scope="col" class="c-table__b-left">구분</th>
												<th scope="col">최초10분</th>
												<th scope="col">11분 ~ 30분</th>
												<th scope="col">초과</th>
												<th scope="col">일주차</th>
												<th scope="col">월주차</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="c-table__left">승용</td>
												<td>무료</td>
												<td>1,000원</td>
												<td>500원(10분)</td>
												<td>10,000원</td>
												<td>100,000원</td>
											</tr>
											<tr>
												<td class="c-table__left">대형<a style="font-size:13px;">(버스25인 이상)</a></td>
												<td>무료</td>
												<td>2,000원</td>
												<td>1,000원(10분)</td>
												<td>20,000원</td>
												<td>-</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							
							<div class="c-section">
								<ul class="f-list2">
									<li class="f-list2__item">
										50% 할인대상 : 독립·국가유공자, 장애인, 1000CC미만 경차, 친환경자동차, 다자녀 
										<br />&nbsp;&nbsp;&nbsp;※ 출차 전 할인 적용 지정카드 제시 및 국가지정 친환경 인증 대상 차량 확인 후 할인 적용
									</li>
									<li class="f-list2__item">
										20% 할인대상 : 승선권 소지자, 야외주차장(트레일러 등 화물차량 제외), 컨벤션센터 행사 이용자
										<br />&nbsp;&nbsp;&nbsp;→ 할인율 중복대상자는 최대 할인율로 1회만 적용함(중복할인 없음). 단, 야외주차장 이용시 아래 요율표를 추가 적용함 
									</li>
									<li class="f-list2__item">
										최초 입차 후 출차전 10분 무료
										<br />&nbsp;&nbsp;&nbsp;※ 본 주차장은 3시 30분 이상 주차시 일주차 요금이 발생합니다.
									</li>
								</ul>
							</div>
							
							<div class="c-section">
								<ul class="fi-parking__list">
									  <li class="fi-parking__item">3. 할인정보 : 할인율 중복대상자 할인요율표</li>
								</ul>
							</div>
							
							<div class="c-section c-section--x-small">
								<div class="c-tables c-tables--scroll">
									<table class="c-table">
										<caption><span class="is-hidden">할인율 중복대상자 할인요율표: 구분, 할인율(실내주차장(A/B), 야회주차장(E)), 비고</span></caption>
										<thead>
											<tr>
												<th scope="col" rowspan="2">구분</th>
												<th scope="col" colspan="2">할인율</th>
												<th scope="col" rowspan="2">비고</th>
											</tr>
											<tr>
												<th scope="col" class="c-table__b-left">실내주차장(A/B)</th>
												<th scope="col">야외주차장(E)</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="c-table__left">야외주차장 이용</td>
												<td>-</td>
												<td>20%</td>
												<td>화물차량 제외</td>
											</tr>
											<tr>
												<td class="c-table__left">승선권 소지자 및 컨벤션센터 행사 이용자</td>
												<td>20%</td>
												<td>30%</td>
												<td>당일에 한함</td>
											</tr>
											<tr>
												<td class="c-table__left">독립&middot;국가유공자, 장애인, 100cc미만 경차, 친환경자동차, 다자녀</td>
												<td>50%</td>
												<td>60%</td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							
							<div class="c-section">
								<div class="f-call">
									<div class="f-call__heading">주차안내</div>
									<div class="f-call__cont">
										<div class="f-call__box">
											<div class="f-call__key">(사)부산항시설관리센터 국제터미널관리팀</div>
											<a class="phone_css" href="tel:051-400-1250" style="cursor:default;">
											<div class="f-call__value">051-400-1250</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="c-sections c-sections--padding">
							<h6 class="f-heading f-heading--color">연안여객터미널 &amp; 국제크루즈터미널(영도)</h6>
							<div class="c-section">
								<ul class="fi-parking__list">
									  <li class="fi-parking__item">1. 이용시간 : 연중상시운영</li>
									  <li class="fi-parking__item">2. 이용요금 &amp; 할인정보</li>
								</ul>
							</div>
							
							<div class="c-section c-section--x-small">
								<div class="c-tables c-tables--scroll">
									<table class="c-table">
										<caption><span class="is-hidden">연안여객터미널 & 국제크루즈터미널(영도) 이용요금 및 할인정보: 구분, 최초10분, 11~30분, 초과, 일주차, 월주차</span></caption>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">최초10분</th>
												<th scope="col">11분 ~ 30분</th>
												<th scope="col">초과</th>
												<th scope="col">일주차</th>
												<th scope="col">월주차</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="c-table__left">승용</td>
												<td>무료</td>
												<td>1,000원</td>
												<td>500원(10분)</td>
												<td>10,000원</td>
												<td>-</td>
											</tr>
											<tr>
												<td class="c-table__left">대형<a style="font-size:13px;">(버스25인 이상)</a></td>
												<td>무료</td>
												<td>2,000원</td>
												<td>1,000원(10분)</td>
												<td>20,000원</td>
												<td>-</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							
							<div class="c-section">
								<ul class="f-list2">
									<li class="f-list2__item">
										50% 할인대상 : 독립·국가유공자, 장애인, 1000CC미만 경차, 친환경자동차, 다자녀 
										<br />&nbsp;&nbsp;&nbsp;※ 출차 전 할인 적용 지정카드 제시 및 국가지정 친환경 인증 대상 차량 확인 후 할인 적용
									</li>
									<li class="f-list2__item">
										20% 할인대상 : 승선권 소지자 
									</li>
								</ul>
							</div>
							
							<div class="c-section">
								<div class="f-call">
									<div class="f-call__heading">주차안내</div>
									<div class="f-call__cont">
										<div class="f-call__box">
											<div class="f-call__key">연안여객터미널</div>
											<a class="phone_css" href="tel:051-467-3139" style="cursor:default;">
											<div class="f-call__value">051-467-3139</div>
											</a>
										</div>
										<div class="f-call__box">
											<div class="f-call__key">국제크루즈터미널(영도)</div>
											<a class="phone_css" href="tel:051-405-6154" style="cursor:default;">
											<div class="f-call__value">051-405-6154</div>
											</a>
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