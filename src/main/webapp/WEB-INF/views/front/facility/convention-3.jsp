<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>부산항국제전시컨벤션센터 이용안내</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
	$('#facility_na').parent().addClass('m-gnb__item--active');
});
</script>
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
								class="breadcrumb__link">이용안내</div></li>
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
					<div class="fc-info">
						<h4 class="is-hidden">부산항국제전시컨벤션센터 이용안내</h4>
						<ul class="c-tabs">
							<li class="c-tab"><a
								href="convention.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="convention_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab c-tab--active"><a href="convention_3.do"
								class="c-link">이용안내</a></li>
							<li class="c-tab"><a href="convention_5.do"
								class="c-link">MOU 체결 현황</a></li>
							<li class="c-tab"><a href="convention_4.do"
								class="c-link">일정</a></li>
						</ul>					
					</div>
				</div>
				<div class="c-sections">
					<div class="fc-info__section">
						<h5 class="f-heading f-heading--color">회의장 / 전시장임대절차</h5>
					</div>
					<div class="fc-info__box">
						<div class="fc-info__section">
							<ul class="fc-info__steps">
								<li class="fc-info__step fc-info__step-1">
									<div class="fc-info__circle">임대문의 및 상담</div>
									<ul class="f-list2 f-list2--small">
										<li class="f-list2__item">사용신청서 제출</li>
										<li class="f-list2__item">개인정보 동의서 제출</li>
										<li class="f-list2__item">사업자등록증 제출</li>
									</ul>
								</li>
								<li class="fc-info__step fc-info__step-2">
									<div class="fc-info__circle">임대계약</div>
									<ul class="f-list2 f-list2--small">
										<li class="f-list2__item">임대계약서 작성</li>
										<li class="f-list2__item">임대료 납부</li>
									</ul>
								</li>
								<li class="fc-info__step fc-info__step-3">
									<div class="fc-info__circle">사전회의 및<br /> 리허설</div>
									<ul class="f-list2 f-list2--small">
										<li class="f-list2__item">부대서류 제출 <br />- 전기, 소방 등</li>
										<li class="f-list2__item">행사관련자료 제출 (보도자료, VIP명단 등)</li>
									</ul>
								</li>
								<li class="fc-info__step fc-info__step-4">
									<div class="fc-info__circle">행사개최</div>
								</li>
								<li class="fc-info__step fc-info__step-5">
									<div class="fc-info__circle">정산</div>
									<ul class="f-list2 f-list2--small">
										<li class="f-list2__item">세금계산서 발행</li>
									</ul>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
				
				<div class="c-sections c-sections--padding c-sections--small">
					<div class="fc-info__section">
						<h5 class="f-heading f-heading--color">각종 자료 및 양식 내려받기</h5>
						<div class="c-section">
							<button class="c-button c-button--blue c-button--middle" onclick="javascript:newin=window.open('about:blank'); newin.location.href='http://www.busanpa.com/bpt/Board.do?mCode=MN0065';" style="width: 160px;">관련자료실 이동</button>
						</div>
					</div>
				</div>

				<div class="c-sections c-sections--padding c-sections--small">
					<div class="fc-info__section">
						<h5 class="f-heading f-heading--color">연락처 안내</h5>
						<div class="c-section">
							<div class="f-call__cont">
							<div class="f-call__box">
								<a class="phone_css" href="tel:051-400-1280" style="cursor:default;">
								<div class="f-call__key f-call__key--large">051-400-1280</div></a>
								<a class="phone_css" href="tel:051-400-1282" style="cursor:default;">
								<div class="f-call__key1 f-call__key--large">051-400-1282</div></a>
							</div>
						</div>
						</div>
					</div>
				</div>

				<div class="c-sections c-sections--padding c-sections--small">
					<div class="fc-info__section">
						<h5 class="f-heading f-heading--color">임대신청서 제출 및 임대료 납부</h5>
						<div class="c-section">
							<ul class="f-list2">
								<li class="f-list2__item">회의/전시일정 확인 후 회의장/전시장 배정</li>
								<li class="f-list2__item">임대신청서, 행사계획서, 사업자등록증 제출</li>
								<li class="f-list2__item">임대료 납부 : KB국민은행 551101-01-391897 사단법인 부산항시설관리센터</li>
							</ul>
						</div>
						<div class="c-section">
							<h6 class="c-table__heading">납부방법</h6>
							<div class="c-tables c-tables--scroll">
								<table class="c-table">
									<caption><span class="is-hidden">임대신청서 제출 및 임대료 납부방법: 구분, 납부 내용</span></caption>
									<colgroup>
										<col style="width: 40%;" />
										<col style="width: 60%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">납부 내용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td rowspan="3">회의장 임대개시 전 완납</td>
											<td>계약 체결 시 : 임대료의 20%</td>
										</tr>
										<tr>
											<td class="c-table__b-left">임대 개시일 90일 전 : 임대료의 30%</td>
										</tr>
										<tr>
											<td class="c-table__b-left">임대 개시일 7일 전 : 임대료의 50% 및 잔금 전액.</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="c-table__noti">※ 부산항 국제여객터미널 컨벤션센터 사용 및 운영규정 제17조 참조</div>
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
