<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>부산항 여객터미널 운항정보</title>
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
								class="breadcrumb__link">운항정보</div></li>
						</ul>
					</div>
					<h4 class="c-h2">부산항 여객터미널</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="fi-parking">
						<h5 class="is-hidden">부산항 여객터미널 운항정보</h5>
						<ul class="c-tabs">
							<li class="c-tab"><a
								href="international.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="international_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab"><a href="international_3.do"
								class="c-link">주차장이용안내</a></li>
							<li class="c-tab c-tab--active"><a href="international_4.do"
								class="c-link">운항정보</a></li>
						</ul>
						
						<div class="c-sections c-sections--padding">
							<h6 class="f-heading f-heading--color">국제여객터미널</h6>
							<div class="c-section">
								<div class="c-tables c-tables--scroll">
									<table class="c-table">
										<caption><span class="is-hidden">국제여객터미널: 항로, 운행간격, 선박사, 선박명, 홈페이지, 연락처</span></caption>
										<colgroup>
											<col style="width: 20%" />
											<col style="width: 12%" />
											<col style="width: 18%" />
											<col style="width: 18%" />
											<col style="width: 14%" />
											<col style="width: 16%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">항로</th>
												<th scope="col">운행간격</th>
												<th scope="col">선박사</th>
												<th scope="col">선박명</th>
												<th scope="col">홈페이지</th>
												<th scope="col">연락처</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="c-table__left" rowspan="4">대마도(히타카츠)</td>
												<td rowspan="4">매일</td>
												<td>JR큐슈고속선(주)</td>
												<td>비틀</td>
												<td><a href="http://www.jrbeetle.co.kr/kor/" class="f-link" title="대마도(히타카츠)행 JR큐슈고속선 홈페이지 새창으로 연결" target="_blank">대마도(히타카츠)행 JR큐슈고속선 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-469-0778" style="cursor:default;">051-469-0778</a></td>
											</tr>
											<tr>
												<td class="c-table__b-left">미래고속(주)</td>
												<td>코비,니나</td>
												<td><a href="https://www.kobee.co.kr/html/" class="f-link" title="대마도(히타카츠)행 미래고속 홈페이지 새창으로 연결" target="_blank">대마도(히타카츠)행 미래고속 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:1599-0255" style="cursor:default;">1599-0255</a></td>
											</tr>
											<tr>
												<td class="c-table__b-left">대아고속해운</td>
												<td>오션플라워</td>
												<td><a href="http://www.daea.com/" class="f-link" title="대마도(히타카츠)행 대아고속해운 홈페이지 새창으로 연결" target="_blank">대마도(히타카츠)행 대아고속해운 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:1644-9604" style="cursor:default;">1644-9604</a></td>
											</tr>
											<tr>
												<td class="c-table__b-left">한일고속해운</td>
												<td>오로라</td>
												<td><a href="http://www.hanil-aurora.com/" class="f-link" title="대마도(히타카츠)행 한일고속해운 홈페이지 새창으로 연결" target="_blank">대마도(히타카츠)행 한일고속해운 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-714-7301" style="cursor:default;">051-714-7301</a></td>
											</tr>
											<tr>
												<td class="c-table__left" rowspan="3">대마도(이즈하라)</td>
												<td rowspan="3">매일</td>
												<td>JR큐슈고속선(주)</td>
												<td>비틀</td>
												<td><a href="http://www.jrbeetle.co.kr/kor/" class="f-link" title="대마도(이즈하라)행 JR큐슈고속선 홈페이지 새창으로 연결" target="_blank">대마도(이즈하라)행 JR큐슈고속선 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-469-0778" style="cursor:default;">051-469-0778</a></td>
											</tr>
											<tr>
												<td class="c-table__b-left">미래고속(주)</td>
												<td>코비,니나</td>
												<td><a href="https://www.kobee.co.kr/html/" class="f-link" title="대마도(이즈하라)행 미래고속 홈페이지 새창으로 연결" target="_blank">대마도(이즈하라)행 미래고속 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:1599-0255" style="cursor:default;">1599-0255</a></td>
											</tr>
											<tr>
												<td class="c-table__b-left">대아고속해운</td>
												<td>오션플라워</td>
												<td><a href="http://www.daea.com/" class="f-link" title="대마도(이즈하라)행 대아고속해운 홈페이지 새창으로 연결" target="_blank">대마도(이즈하라)행 대아고속해운 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:1644-9604" style="cursor:default;">1644-9604</a></td>
											</tr>
											<tr>
												<td class="c-table__left" rowspan="3">후쿠오카(히카타)</td>
												<td rowspan="3">매일</td>
												<td>JR큐슈고속선(주)</td>
												<td>비틀</td>
												<td><a href="http://www.jrbeetle.co.kr/kor/" class="f-link" title="후쿠오카(히카타)행 JR큐슈고속선 홈페이지 새창으로 연결" target="_blank">후쿠오카(히카타)행 JR큐슈고속선 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-469-0778" style="cursor:default;">051-469-0778</a></td>
											</tr>
											<tr>
												<td class="c-table__b-left">미래고속(주)</td>
												<td>코비,니나</td>
												<td><a href="https://www.kobee.co.kr/html/" class="f-link" title="후쿠오카(히카타)행 미래고속 홈페이지 새창으로 연결" target="_blank">후쿠오카(히카타)행 미래고속 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:1599-0255" style="cursor:default;">1599-0255</a></td>
											</tr>
											<tr>
												<td class="c-table__b-left">고려훼리</td>
												<td>뉴카멜리아</td>
												<td><a href="http://koreaferry.kr/board/" class="f-link" title="후쿠오카(히카타)행 고려훼리 홈페이지 새창으로 연결" target="_blank">후쿠오카(히카타)행 고려훼리 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:1688-7447" style="cursor:default;">1688-7447</a></td>
											</tr>
											<tr>
												<td class="c-table__left">시모노세키</td>
												<td>매일</td>
												<td>부관훼리/관부훼리</td>
												<td>성희/하마유</td>
												<td><a href="https://www.pukwan.co.kr/" class="f-link" title="시모노세키행 부관훼리 홈페이지 새창으로 연결" target="_blank">시모노세키행 부관훼리 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:051-463-3161" style="cursor:default;">051-463-3161</a></td>
											</tr>
											<tr>
												<td class="c-table__left">오사카</td>
												<td>주3회</td>
												<td>팬스타라인</td>
												<td>팬스타드림</td>
												<td><a href="https://www.panstar.co.kr/main/main.php" class="f-link" title="오사카행 팬스타라인 홈페이지 새창으로 연결" target="_blank">오사카행 팬스타라인 홈페이지 새창으로 연결</a></td>
												<td><a class="phone_css" href="tel:1577-9996" style="cursor:default;">1577-9996</a></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="c-table__noti">※ 운항일정은 운영사의 정책 등에 따라 변경될 수 있음</div>
							</div>
						</div>
						
						<div class="c-sections c-sections--padding">
							<h6 class="f-heading f-heading--color">연안여객터미널</h6>
							<div class="c-section">
								<div class="c-tables c-tables--scroll">
									<table class="c-table">
										<caption><span class="is-hidden">연안여객터미널: 항로, 선사, 선명, 운항형태, 출항, 입항, 소요시간, 홈페이지, 연락처</span></caption>
										<colgroup>
											<col style="width: 12%" />
											<col style="width: 12%" />
											<col style="width: 12%" />
											<col style="width: 13%" />
											<col style="width: 11%" />
											<col style="width: 11%" />
											<col style="width: 10%" />
											<col style="width: 9%" />
											<col style="width: 10%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">항로</th>
												<th scope="col">선사</th>
												<th scope="col">선명</th>
												<th scope="col">운항형태</th>
												<th scope="col">출항</th>
												<th scope="col">입항</th>
												<th scope="col">소요시간</th>
												<th scope="col">홈페이지</th>
												<th scope="col">연락처</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td rowspan="2">부산 ↔ 제주</td>
												<td rowspan="2">(주)동북아카페리</td>
												<td rowspan="2">블루스타</td>
												<td>부산출발(월,수,금)</td>
												<td>오후 7시</td>
												<td>익일 오전 7시</td>
												<td rowspan="2">12시간</td>
												<td rowspan="2"><a href="http://enacarferry.haewoon.co.kr/" class="f-link" title="부산~제주도 행 동북아카페리 홈페이지 새창으로 연결" target="_blank">부산~제주도 행 동북아카페리 홈페이지 새창으로 연결</a></td>
												<td rowspan="2"><a class="phone_css" href="tel:1661-9559" style="cursor:default;">1661-9559</a></td>
											</tr>
											<tr>
												<td class="c-table__b-left">부산출발(화,목,토)</td>
												<td>오후 7시</td>
												<td>익일 오전 7시</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="c-table__noti">※ 운항일정은 운영사의 정책 등에 따라 변경될 수 있음</div>
							</div>
						</div>
						
						<div class="c-sections c-sections--padding">
							<h6 class="f-heading f-heading--color">제2국제 크루즈터미널 & 국제크루즈터미널(영도)</h6>
							<div class="c-section">
								<div class="c-buttons">
									<button class="c-button c-button--large c-button--blue" onclick="international_bt1()">입항 시간표 보러가기</button>
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