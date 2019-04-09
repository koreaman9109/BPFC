<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>국제선용품유통센터(BISC) 입점안내</title>
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
								class="breadcrumb__link">입점안내</div></li>
						</ul>
					</div>
					<h3 class="c-h2">국제선용품유통센터(BISC)</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<h4 class="is-hidden">국제선용품유통센터(BISC) 입점안내</h4>
					<ul class="c-tabs">
						<li class="c-tab"><a
							href="bisc.do" class="c-link">소개</a></li>
						<li class="c-tab"><a href="bisc_2.do"
							class="c-link">시설현황</a></li>
						<li class="c-tab c-tab--active"><a href="bisc_3.do"
							class="c-link">입점안내</a></li>
					</ul>

					<div class="c-sections c-sections--padding">
						<h5 class="f-heading f-heading--color">입주신청자격</h5>
						<div class="c-section">
							<ul class="f-list2 f-list2--none">
								<li class="f-list2__item">항만운송사업법 제26조의 3에 따른 항만운송관련 사업등록 및 부산지방해양항만청에 물품공급업신고를 필하고 관세법 제222조 및 같은 법 시행령 제231조에 따른
								<br />&nbsp;물품공급업(선용품)으로 등록을 필한 업체</li>
							</ul>
						</div>
					</div>
					<div class="c-sections c-sections--small c-sections--padding">
						<h5 class="f-heading f-heading--color">사용료(건물, 부지)</h5>
						<div class="c-section">
							<div class="c-tables c-tables--scroll">
								<table class="c-table">
									<caption><span class="is-hidden">국제선용품유통센터 사용료(건물,부지): 건물 최저 사용료, 부지 사용료</span></caption>
									<colgroup>
										<col style="width: 25%;" />
										<col style="width: 25%;" />
										<col style="width: 25%;" />
										<col style="width: 25%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="3">건물 최저사용료(㎡/월)</th>
											<th scope="col">부지 사용료(㎡/월)</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="c-table__brown">1층 창고(원)</td>
											<td class="c-table__brown">2,3층 창고(원)</td>
											<td class="c-table__brown">사무실(원)</td>
											<td class="c-table__brown">부지(원)*</td>
										</tr>
										<tr>
											<td>3,958</td>
											<td>2,970</td>
											<td>3,560</td>
											<td>321</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="c-section c-section--x-small">
							<ul class="f-list2">
								<li class="f-list2__item">입주신청시 사무실 및 창고를 함께 신청을 원칙으로 함</li>
								<li class="f-list2__item">건물사용료는 국유재산법을 적용한 건물 최저사용료(예정가격)를 기준으로 해서 업체가 제시한 가격</li>
								<li class="f-list2__item">사용료는 입주기간 개시일로부터 징수하며, 매 1년 단위로 선납함<br />
								&nbsp;&nbsp;&nbsp;* 부지사용료는 “자유무역지역의 지정 및 운영에 관한 법률” 제17조 제2항의 규정에 따라 국토해양부가 공고하는 부지사용료를 적용하여 건물사용 면적에 비례하여 부과 함 </li>
							</ul>
						</div>
						<div class="c-section c-section--x-small">
							<button class="c-button c-button--large c-button--blue" onclick="bisc_3_bt1()">세부내역 보러가기</button>
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
