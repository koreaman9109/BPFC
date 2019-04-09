<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>공용부두 화물관리 화물관리요율</title>
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

		<div id="content" class="c-container">
			<div class="c-lnbs">
				<div class="c-lnb">
					<div class="c-lnb__aligner">
						<h2 class="c-lnb__heading">주요관리시설</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a
								href="international.do" class="c-lnb__link">부산항 여객터미널</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="union.do"
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
								class="breadcrumb__link">공용부두 화물관리</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">화물요율표</div></li>
						</ul>
					</div>
					<h4 class="c-h2">공용부두 화물관리</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="s-tariff">
						<h5 class="is-hidden">공용부두 화물관리 화물요율표</h5>
						<ul class="c-tabs">
							<li class="c-tab"><a
								href="union.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="union_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab c-tab--active"><a href="union_3.do"
								class="c-link">화물요율표</a></li>
						</ul>
						<div class="c-sections">
							<div class="c-section">
								<div class="c-sections c-sections--padding">
									<div class="s-tariff__headings">
										<h6 class="f-heading f-heading--color">장치 경비료</h6>
										<div class="c-section">
											<div class="s-tariff__heading-detail">부두 장치장(창고, 야적장,CY)에 장치된 화물에 대하여 징수하는 경비료</div>
										</div>
									</div>
								</div>
							</div>
							<div class="c-section c-section--small">
								<div class="s-tariff__utils">
									<div class="s-tariff__util">
										<div class="s-tariff__h4">가. 일반화물</div>
									</div>
									<div class="s-tariff__util s-tariff__util--right">
										<a href="javascript:void(0);" onclick="union_3_bt2('tariff.pdf')" title="첨부파일 다운로드" download>
											<button class="c-button c-button--green">화물관리요율표 내려받기</button>
										</a>
									</div>
								</div>
								<div class="s-tariff__tables">
									<table class="s-tariff__table">
										<caption><span class="is-hidden">일반화물 경비료: 구분, 종가제(수입품, 수출품), 종량제(수입(일반잡화),
											수출), 요율적용 방법</span></caption>
										<colgroup>
											<col style="width: 10%" />
											<col style="width: 12%" />
											<col style="width: 12%" />
											<col style="width: 12%" />
											<col style="width: 12%" />
											<col style="width: 58%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">구분</th>
												<th scope="col" colspan="2">종가제</th>
												<th scope="col" colspan="2">종량제</th>
												<th scope="col" rowspan="2">요율적용 방법</th>
											</tr>
											<tr>
												<th scope="col" class="c-table__b-left">수입품</th>
												<th scope="col">수출품</th>
												<th scope="col">수입(일반잡화)</th>
												<th scope="col">수출</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1일(당일)</td>
												<td>1.250/1,000</td>
												<td>0.077/1,000</td>
												<td>24원/톤</td>
												<td>13원/톤</td>
												<td rowspan="5" class="s-tariff__table--left">
													<div class="s-tariff__cont">
														<div class="s-tariff__sheading">
															<em class="s-tariff__em">종가제(수입품)</em>
														</div>
														<ul class="s-tariff__slist">
															<li class="s-tariff__sitem">- 기본료(1일) :
																(감가+관세)×요율×1일</li>
															<li class="s-tariff__sitem">- 2~15일 :
																기본료×[1+(0.02×경과일수)]</li>
															<li class="s-tariff__sitem">- 16일부터는 (감가+관세)×요율× 해당
																장치일수 적용</li>
														</ul>
													</div>
													<div class="s-tariff__cont">
													<div class="s-tariff__sheading">
														<em class="s-tariff__em">종가제(수출품)</em>
													</div>
														<ul class="s-tariff__slist">
															<li class="s-tariff__sitem">- 감가 × 요율 × 일수</li>
														</ul>
														</div>
													<div class="s-tariff__cont">
														<em class="s-tariff__em">종량제 :</em> 톤수 × 요율 × 일수 - 기본일수
														12일적용
													</div>
													<div class="s-tariff__cont">
														<em class="s-tariff__em">T/S화물 :</em>수입품 요율 적용
													</div>
												</td>
											</tr>
											<tr>
												<td>15일까지</td>
												<td>기본일수(1일) 초과시 매 1일 2%씩 증가</td>
												<td>0.081/1,000</td>
												<td>25원/톤</td>
												<td>13원/톤</td>
											</tr>
											<tr>
												<td>30일까지</td>
												<td>0.120/1,000</td>
												<td>0.082/1,000</td>
												<td>26원/톤</td>
												<td>14원/톤</td>
											</tr>
											<tr>
												<td>45일까지</td>
												<td>0.129/1,000</td>
												<td>0.085/1,000</td>
												<td>28원/톤</td>
												<td>14원/톤</td>
											</tr>
											<tr>
												<td>46일이상</td>
												<td>0.140/1,000</td>
												<td>0.100/1,000</td>
												<td>29원/톤</td>
												<td>15원/톤</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="s-tariff__noti">출고건당 10,000원 미만은 10,000원 적용</div>
							</div>
	
							<div class="c-section">
								<div class="s-tariff__h4">나. 컨테이너(종량제)</div>
								<div class="s-tariff__tables">
									<table class="s-tariff__table">
										<caption><span class="is-hidden">컨테이너(종량제) 경비료: 구분, 수입품(T/S포함), 수출품, 계산 방법</span></caption>
										<colgroup>
											<col style="width: 15%" />
											<col style="width: 20%" />
											<col style="width: 20%" />
											<col style="width: 45%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">수입품(T/S포함)</th>
												<th scope="col">수출품</th>
												<th scope="col">계산 방법</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>5일까지(기본)</td>
												<td>40원/톤</td>
												<td>23원/톤</td>
												<td rowspan="3" class="s-tariff__table--left">
													<div class="s-tariff__cont">
														<div class="s-tariff__sheading">
															<em class="s-tariff__em">종량제 :</em>톤수 × 요율 × 일수
														</div>
														<ul class="s-tariff__slist">
															<li class="s-tariff__sitem">- 톤수적용 : 컨테이너 외형 톤 적용</li>
														</ul>
													</div>
													<div class="s-tariff__cont">
														<em class="s-tariff__em">기본일수 5일 적용</em>
													</div>
												</td>
											</tr>
											<tr>
												<td>10일까지</td>
												<td>46원/톤</td>
												<td>26원/톤</td>
											</tr>
											<tr>
												<td>11일 이상</td>
												<td>53원/톤</td>
												<td>32원/톤</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
	
							<div class="c-section">
								<div class="s-tariff__h4">다. 철재류 등(대량 화물)</div>
								<div class="s-tariff__tables">
									<table class="s-tariff__table">
										<caption><span class="is-hidden">철재류 등(대량 화물) 경비료: 구분, 수입품(T/S포함), 수출품</span></caption>
										<colgroup>
											<col style="width: 20%" />
											<col style="width: 30%" />
											<col style="width: 50%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">수입품(T/S포함)</th>
												<th scope="col">수출품</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>면적(㎡)</td>
												<td>1,723원/월</td>
												<td class="s-tariff__table--left"><em
													class="s-tariff__em">계산방법 : </em>사용면적(㎡) × 요율 × 장치기간(월 기준)
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="s-tariff__noti">단위 면적당 요율에 따라 적용하는 경비료</div>
							</div>
						</div>
	
						<div class="c-sections">
							<div class="c-section">
								<div class="c-sections c-sections--padding">
									<div class="s-tariff__headings">
										<h6 class="s-tariff__heading"><div class="f-heading f-heading--color">하선 경비료</div></h6>
										<div class="c-section">
											<div class="s-tariff__heading-detail">하선장소가 부두로 신고된 화물 중
											부두내 창고나 야적장에 장치하지 않고 보세운송 등 타 지역으로 반출되는 화물(차상반출포함)에 적용.</div>
										</div>
									</div>
								</div>
							</div>

							<div class="c-section c-section--small">
								<div class="s-tariff__tables">
									<table class="s-tariff__table">
										<caption><span class="is-hidden">하선 경비료: 구분, 요율, 계산방법, 비고></span></caption>
										<colgroup>
											<col style="width: 20%" />
											<col style="width: 22%" />
											<col style="width: 22%" />
											<col style="width: 36%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">요율</th>
												<th scope="col">계산방법</th>
												<th scope="col">비고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>7일까지(기본)</td>
												<td>23원/톤</td>
												<td>톤수 × 23원 × 7일</td>
												<td rowspan="3" class="s-tariff__table--left"><em
													class="s-tariff__em">일수적용 :</em> 하선반입 신고일부터 반출되는 날까지</td>
											</tr>
											<tr>
												<td>기본일수 경과시 <br />(할증료 포함)
												</td>
												<td>매일 2원/톤</td>
												<td>톤수 × [23원 + (2원 × 7일 초과일수)] × 장치일수</td>
											</tr>
											<tr>
												<td>최저 경비료</td>
												<td>B/L 당 10,000원 미만은 <br />10,000원 적용</td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
	
							<div class="c-section">
								<div class="s-tariff__h4">부대상황</div>
								<ul class="s-tariff__list">
									<li class="s-tariff__item">컨테이너 외형 용기 톤수를 적용한다. (10피트 :
										16톤, 20피트 : 32톤, 40피트 : 64톤, 45피트 : 72톤)</li>
									<li class="s-tariff__item">화물량 최저단위 : B/L당 총화물이 1톤 미만은
										1톤으로 한다.</li>
									<li class="s-tariff__item">경비료는 종가제와 종량제 중 많은 쪽을 적용한다.</li>
									<li class="s-tariff__item">톤수는 용적톤과 중량톤 중 많은 쪽을 적용하되 중량톤은
										1000kg, 용적톤은 1.133m³를 1톤으로 한다.</li>
									<li class="s-tariff__item">부가가치세는 공급액의 10%를 화주로부터 별도 징수한다.</li>
								</ul>
							</div>
						</div>
	
						<div class="c-sections">
							<div class="c-section">
								<div class="c-sections c-sections--padding">
									<div class="s-tariff__headings">
										<h6 class="s-tariff__heading"><div class="f-heading f-heading--color">일반 경비료</div></h6>
										<div class="c-section">
											<div class="s-tariff__heading-detail">하선장소가 부두가 아닌 타장소로
											신고되어 직송되는 화물에 적용</div>
										</div>
									</div>
								</div>
							</div>
							<div class="c-section c-section--small">
								<div class="s-tariff__tables">
									<table class="s-tariff__table">
										<caption><span class="is-hidden">일반 경비료: 구분, 일반잡화, 양곡·고철, 컨테이너 찬것, 수입원목,
											냉동어(수입, 연안·내국)</span></caption>
										<colgroup>
											<col style="width: 14%" />
											<col style="width: 14%" />
											<col style="width: 14%" />
											<col style="width: 14%" />
											<col style="width: 14%" />
											<col style="width: 14%" />
											<col style="width: 14%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">구분</th>
												<th scope="col" rowspan="2">일반잡화</th>
												<th scope="col" rowspan="2">양곡&middot;고철</th>
												<th scope="col" rowspan="2">컨테이너 찬것</th>
												<th scope="col" rowspan="2">수입원목</th>
												<th scope="col" colspan="2">냉동어</th>
											</tr>
											<tr>
												<th scope="col" class="c-table__b-left">수입</th>
												<th scope="col">연안&middot;내국</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>요율</td>
												<td>31</td>
												<td>35</td>
												<td>25</td>
												<td>53</td>
												<td>115</td>
												<td>115</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="c-section c-section--x-small">
								<div class="s-tariff__kv">
									<div class="s-tariff__key">계산방법</div>
									<div class="s-tariff__value">
										톤수×요율 = 경비료 (B/L별 최저경비료가 2,000원 미만 2,000원 적용) <br />단, 동일선박
										동일화주일 경우 1B/L 적용
									</div>
								</div>
							</div>
							<div class="c-section c-section--small">
								<ul class="s-tariff__list">
									<li class="s-tariff__item">하선경비료 징수화물에 대하여는 일반경비료를 징수치 않음</li>
								</ul>
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
