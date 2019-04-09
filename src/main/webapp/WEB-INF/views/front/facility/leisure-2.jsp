<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>항만레저시설 이용안내</title>
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
							<li class="c-lnb__item"><a href="bisc.do"
								class="c-lnb__link">국제선용품유통센터</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="leisure.do"
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
								class="breadcrumb__link">항만레저시설</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">이용안내</div></li>
						</ul>
					</div>
					<h3 class="c-h2">항만레저시설</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="f-leisure">
						<h4 class="is-hidden">항만레저시설 이용시설</h4>
						<ul class="c-tabs">
							<li class="c-tab"><a
								href="leisure.do" class="c-link">이용시설</a></li>
							<li class="c-tab c-tab--active"><a href="leisure_2.do"
								class="c-link">이용안내</a></li>
						</ul>

						<div class="c-sections">
							<h5 class="f-heading f-heading--color">힐링야영장</h5>
							<div class="c-section">
								<div class="s-tariff__utils">
									<div class="s-tariff__util">
										<h6 class="s-tariff__h4">요금 및 이용시간</h6>
									</div>
									<div class="s-tariff__util s-tariff__util--right">
										<button class="c-button c-button--blue" onclick="leisure_2_bt1('Rates.pdf')">감면 및 할인대상 선정 기준  내려받기</button>
									</div>
								</div>
								<div class="c-tables c-tables--scroll">
									<table class="c-table">
										<caption><span class="is-hidden">힐링야영장 요금 및 이용시간: 구분, 이용요금(1개 사이트당), 이용시간, 비고</span></caption>
										<colgroup>
											<col style="width: 25%" />
											<col style="width: 25%" />
											<col style="width: 25%" />
											<col style="width: 25%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">이용요금(1개 사이트당)</th>
												<th scope="col">이용시간</th>
												<th scope="col">비고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="c-table__left">1박 2일</td>
												<td>20,000원</td>
												<td>14시 ~ 익일 12시</td>
												<td rowspan="2">&middot;사이트 1면당차량 1대 기준 (최대 5인) </td>
											</tr>
											<tr>
												<td class="c-table__left">당일 입장 (비숙박)</td>
												<td>8,000원</td>
												<td>14시 ~ 20시</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="c-section c-section--x-small">
								<ul class="f-list2">
									<li class="f-list2__item">부산시 거주민은 30% 할인, 사회적 배려계층은 이용료를 면제(주차비 5천원만 징수)드리며, 현장에서 증빙자료(신분증 등)를 제시하시면 확인 후 입장 가능합니다. 
									<br />&nbsp;&nbsp;&nbsp;(위 첨부파일에서 감면 대상자 여부 확인 요망)</li>
									<li class="f-list2__item">결재는 현장에서 결재</li>
									<li class="f-list2__item">인원 초과 시 1인당 2,000원이 추가됩니다.</li>
									<li class="f-list2__item">주차 차량 1대 초과 시 외부 주차장을 이용하시기 바라며, 별도 주차요금이 적용됩니다.</li>
									<li class="f-list2__item">이용 당일 기상악화 시 야영장 폐쇄 및 문자로 통보드립니다.</li>
									<li class="f-list2__item">천재지변, 기상특보 등 야영장 주최측 판단으로 폐장 시 100% 환불해드립니다.</li>
								</ul>
							</div>
							<div class="c-section c-section--x-small">
								<div class="c-buttons">
									<button class="c-button c-button--large c-button--blue" onclick="leisure_bt3()">야영장 자세히 보러가기</button>
								</div>
							</div>
							<div class="c-section">
								<div class="f-call">
									<div class="f-call__heading">연락처 안내</div>
									<div class="f-call__cont">
										<div class="f-call__box">
										<a class="phone_css" href="tel:051-400-1205" style="cursor:default;">
											<div class="f-call__key f-call__key--large">051-400-1205</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="c-sections">
							<h5 class="f-heading f-heading--color">해수온천족욕장</h5>
							<div class="c-section">
								<ul class="f-list2">
									<li class="f-list2__item">이용시간 : 11:00(개장) ~ 18:00(폐장), 매주 월요일 휴장</li>
									<li class="f-list2__item">이용요금 : 무료개방</li>
								</ul>
							</div>
							<div class="c-section">
								<div class="f-call">
									<div class="f-call__heading">연락처 안내</div>
									<div class="f-call__cont">
										<div class="f-call__box">
											<a class="phone_css" href="tel:051-400-1200" style="cursor:default;">
											<div class="f-call__key f-call__key--large">051-400-1200</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="c-sections">
							<h5 class="f-heading f-heading--color">시민 해수온천 야외수영장</h5>
							<div class="c-section">
								<div class="s-tariff__util">
									<h6 class="s-tariff__h4">입장료</h6>
								</div>
								<div class="c-tables c-tables--scroll">
									<table class="c-table">
										<caption><span class="is-hidden">시민 해수온천 야외수영장 입장료: 구분, 만 5세(미만 어린이), 어린이(만 6~13세), 청소년(만 14~18세), 성인(만 19세 이상)</span></caption>
										<colgroup>
											<col style="width: 20%" />
											<col style="width: 20%" />
											<col style="width: 20%" />
											<col style="width: 20%" />
											<col style="width: 20%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">만 5세 (미만 어린이)</th>
												<th scope="col">어린이 (만 6~13세)</th>
												<th scope="col">청소년 (만 14~18세)</th>
												<th scope="col">성인 (만 19세 이상)</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="c-table__graybg">기본입장료</td>
												<td>무료</td>
												<td>3,000원</td>
												<td>4,000원</td>
												<td>5,000원</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="c-table__noti">※ 이용객이 많을 경우 쾌적한 수영장 이용을 위한 "입장 제한"으로 바로 입장하지 못할 수 있으며 대기 시간이 길어질 수 있습니다. </div>
							</div>
							<div class="c-section c-section--small">
								<div class="s-tariff__util">
									<h6 class="s-tariff__h4">렌탈요금</h6>
								</div>
								<div class="f-leisure__box">
									<ul class="f-leisure__list">
										<li class="f-leisure__item">
											<div class="f-leisure__key">썬베드, 파라솔</div>
											<div class="f-leisure__value">3,000원</div>
										</li>
										<li class="f-leisure__item">
											<div class="f-leisure__key">튜브</div>
											<div class="f-leisure__value">5,000원</div>
										</li>
										<li class="f-leisure__item">
											<div class="f-leisure__key">구명조끼</div>
											<div class="f-leisure__value">5,000원</div>
										</li>
										<li class="f-leisure__item">
											<div class="f-leisure__key">평상 1부 : 10:00 ~ 14:00 / 2부 : 14:30 ~ 20:00</div>
											<div class="f-leisure__value">5,000원</div>
										</li>
									</ul>
								</div>
								<div class="c-table__noti">※ 평상 이용을 원하시지 않을 경우 '휴식 공간'을 이용하실 수 있으며, '휴식 공간'을 이용하실 경우 돗자리를 가져오시면 편리합니다.</div>
							</div>
							<div class="c-section c-section--small">
								<div class="s-tariff__util">
									<h6 class="s-tariff__h4">입장료 할인</h6>
								</div>
								<ul class="f-list2">
									<li class="f-list2__item">16시 이후 입장 고객에 한하여 입장료의 50% 할인 적용</li>
									<li class="f-list2__item">부산시민 1,000원 할인(신분증 등 제시), 단, 16시 이후 입장 시는 적용하지 않습니다.</li>
								</ul>
							</div>
							<div class="c-section c-section--small">
								<div class="s-tariff__util">
									<h6 class="s-tariff__h4">입장료 면제</h6>
								</div>
								<ul class="f-list2">
									<li class="f-list2__item">만 5세 이하 영&middot;유아</li>
									<li class="f-list2__item">만 65세 이상 경로자</li>
									<li class="f-list2__item">「국민기초생활 보장법」의 적용을 받는 수급자</li>
									<li class="f-list2__item">「장애인복지법」에 따라 등록된 장애인(1급부터 3급까지 해당하는 장애인의 경우 보호자 1명을 포함)</li>
									<li class="f-list2__item">「독립유공자 예우에 관한 법률」의 적용을 받는 독립유공자와 그 유족 또는 가족</li>
									<li class="f-list2__item">「국가유공자 등 예우 및 지원에 관한 법률」의 적용을 받는 국가유공자와 그 유족 또는 가족</li>
									<li class="f-list2__item">「5&middot;18 민주유공자 예우에 관한 법률」의 적용을 받는 5&middot;18 민주유공자와 그 유족 또는 가족</li>
									<li class="f-list2__item">「특수임무수행자 지원 및 단체설립에 관한 법률」의 적용을 받는 특수임무수행자와 그 유족 또는 가족</li>
									<li class="f-list2__item">「참전유공자 예우 및 단체설립에 관한 법률」의 적용을 받는 참전유공자</li>
									<li class="f-list2__item">「고엽제후유의증 환자지원 등에 관한 법률」의 적용을 받는 고엽제후유증&middot;환자고엽제후유의증 환자 또는 고엽제후유증 2세환자</li>
									<li class="f-list2__item">「부산광역시 저출산 대책 및 출산장려원 조례」의 적용을 받는 다자녀가정에 속하는 자부산항 시민 해수온천 수영장 요금안내로 렌탈요금 정보를 볼 수 있는 테이블부산항 </li>
									<li class="f-list2__item">시민 해수온천 수영장 요금안내를 구분, 만 5세 이하 어린이, 어린이(6~13세), 청소년(14~18세), 성인(19세이상)의 기본입장료 정보 제공</li>
								</ul>
							</div>
							<div class="c-section c-section--x-small">
								<div class="c-buttons">
									<button class="c-button c-button--large c-button--blue" onclick="leisure_bt5()">수영장 자세히 보러가기</button>
								</div>
							</div>
							<div class="c-section">
								<div class="f-call">
									<div class="f-call__heading">연락처 안내</div>
									<div class="f-call__cont">
										<div class="f-call__box">
										<a class="phone_css" href="tel:051-400-1205" style="cursor:default;">
											<div class="f-call__key f-call__key--large">051-400-1205</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="c-sections">
							<h5 class="f-heading f-heading--color">신항 야구장</h5>
							<div class="c-section">
								<div class="c-section">
									<div class="s-tariff__utils">
										<div class="s-tariff__util">
											<h6 class="s-tariff__h4">대관안내</h6>
										</div>
										<div class="s-tariff__util">
											<div class="c-table__noti c-table__noti--red">※ 동절기는 빠른 일몰로 인해 개장 시간 및 각 회차 시간 조정될 수 있습니다.</div>
										</div>
									</div>
								</div>
								<div class="c-section c-section--x-small">
									<div class="c-tables c-tables--scroll">
										<table class="c-table c-table__th--none">
											<caption><span class="is-hidden">신항 야구장 대관안내: 구분, 시간, 금액, 비고</span></caption>
											<thead>
												<tr>
													<th scope="col">구분</th>
													<th scope="col">시간</th>
													<th scope="col">금액</th>
													<th scope="col">비고</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="4" class="c-table__bluebg">평일</td>
												</tr>
												<tr>
													<td class="c-table__brown">1회차</td>
													<td>09:00 ~ 12:00</td>
													<td> 18만원 </td>
													<td rowspan="3" class="c-table__left">
														&middot;평일기준 회차당3시간씩 <br />
														<div class="c-table__blue">&nbsp;&nbsp;정확한 대여시간은 대관신청 <br />&nbsp;&nbsp;페이지에서 확인하세요 </div>
													</td>
												</tr>
												<tr>
													<td class="c-table__brown">2회차</td>
													<td>12:15 ~ 15:15</td>
													<td> 18만원 </td>
												</tr>
												<tr>
													<td class="c-table__brown">3회차</td>
													<td>15:30 ~ 18:30</td>
													<td> 18만원 </td>
												</tr>
												<tr>
													<td class="c-table__brown">4회차</td>
													<td>19:00 ~ 22:00</td>
													<td> 18만원 </td>
													<td></td>
												</tr>
												<tr>
													<td colspan="4" class="c-table__bluebg">주말&amp;공휴일</td>
												</tr>
												<tr>
													<td class="c-table__brown">토요일</td>
													<td>리그경기 종료후</td>
													<td class="c-table__left">1시간당6만원<br />3시간이상대관가능 </td>
													<td class="c-table__left">
														&middot;리그경기종료후대관가능<br />
														&middot;대여시간은 대관신청 페이지에서 <br />&nbsp;확인가능
														<br />&middot;조명료시간당3만원 
													</td>
												</tr>
												<tr>
													<td class="c-table__brown">일요일</td>
													<td>리그경기 종료후</td>
													<td class="c-table__left">1시간당6만원<br />3시간이상대관가능 </td>
													<td class="c-table__left">
														&middot;리그경기종료후대관가능<br />
														&middot;대여시간은 대관신청 페이지에서 <br />&nbsp;확인가능<br />
														&middot;조명료시간당3만원 
													</td>
												</tr>
												<tr>
													<td class="c-table__brown">공휴일</td>
													<td colspan="3" class="c-table__left">리그경기 없을시 평일기준으로 대관</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="c-table__noti c-table__noti--red">※ 주말&공휴일 3시간 이상 대관을 원하시는 단체는 사용료 입금전 먼저 연락(신항사업소 051-974-0032)을 주시고 신청해 주시기 바랍니다.</div>
								</div>
							</div>
							<div class="c-section">
								<ul class="f-list2">
									<li class="f-list2__item">대관신청은 홈페이지에 등재된 신청양식에 따라 신청합니다.</li>
									<li class="f-list2__item">입금은 신청당일 오후 4시까지 입금을 원칙으로 하며 미입금시 자동취소됩니다. (신청자와 입금자는 동일인이여야하며 부득이한 경우 운영자에게 연락바랍니다.) </li>
									<li class="f-list2__item">입금 후 사용취소(환불), 변경은 불가합니다. 단, 우천, 천재지변으로 인해 구장 사용을 하지 못했을 경우 변경 가능합니다. <br />&nbsp;&nbsp;&nbsp;(개인이 대여하는 구장이 아니라 환불절차가 복잡하므로 환불이 불가한 점 양해바랍니다.)</li>
									<li class="f-list2__item">주말 및 공휴일은 항만리그경기를 우선하며 그 외 시간은 일반 대관합니다.</li>
								</ul>
							</div>
							<div class="c-section c-section--x-small">
								<div class="c-buttons">
									<button class="c-button c-button--large c-button--blue" onclick="leisure_bt2()">야구장 자세히 보러가기</button>
								</div>
							</div>
							<div class="c-section">
								<div class="f-call">
									<div class="f-call__heading">연락처 안내</div>
									<div class="f-call__cont">
										<div class="f-call__box">
										<a class="phone_css" href="tel:051-974-0032" style="cursor:default;">
											<div class="f-call__key f-call__key--large">051-974-0032</div>
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
