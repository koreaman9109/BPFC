<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>(사)부산항시설관리센터</title>

<link rel="canonical" href="http://bpfmc.or.kr/">
<meta name="description" content="(사)부산항시설관리센터 홈페이지 입니다.">
<meta name="Keywords" content="부산항시설관리센터, 부산항, 부산항만, 부산항만공사">
<meta property="og:type" content="website">
<meta property="og:title" content="(사)부산항시설관리센터">
<meta property="og:description" content="(사)부산항시설관리센터 홈페이지 입니다.">
<meta property="og:url" content="http://bpfmc.or.kr/">

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=CL0Er3m5dabz5eoRnoXQ&submodules=geocoder"></script>
<script type="text/javascript">

		$(document).ready(function() {
		
		if($('#chk').val()){
		
		alert("잘못된 경로입니다. 메인으로 이동합니다.");
		}
		
		});
</script>
</head>
<body>
	<input type="hidden" id="chk" name="chk" value="${chk}" >
	<jsp:include page="../../banner.jsp"></jsp:include>
	<div class="c-wrap">
		<jsp:include page="../../main_topmenu.jsp"></jsp:include>
		<div id="content" class="c-container">
			<div class="m-contents">
				<div class="m-visual">
					<ul class="m-visual__list">
						<li class="m-visual__item m-visual__item-2">
							<div class="m-visual__txts">
								<div class="m-visual__txt m-visual__txt-1">
									<div class="m-visual__txt--large">"항만시설관리전문법인"</div>
									<em class="m-visual__txt--em">항만법</em>에 의하여 설립된 50년 전통의 <em class="m-visual__txt--em">항만관리법인</em>
								</div><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
								<div class="m-visual__txt m-visual__txt-2">
									    부산항의 성장과 미래를 함께합니다 
									  <div class="m-visual__txt--em">부산항시설관리센터</div>
								</div>
							</div>
						</li>
						<li class="m-visual__item m-visual__item-3">
							<div class="m-visual__txts">
								<div class="m-visual__txt m-visual__txt-1">
									<div class="m-visual__txt--large">"항만시설관리전문법인"</div>
									<em class="m-visual__txt--em">항만법</em>에 의하여 설립된 50년 전통의 <em class="m-visual__txt--em">항만관리법인</em>
								</div><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
								<div class="m-visual__txt m-visual__txt-2">
									    부산항의 성장과 미래를 함께합니다 
									  <div class="m-visual__txt--em">부산항시설관리센터</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div id="bpfc" class="m-bpfc">
					<div class="m-aligner">
						<div class="m-headings">
							<h2 class="m-heading">BPFC 소개</h2>
						</div>
						<div class="m-bpfc__cont">
							<div class="m-bpfc__boxs">
								<div class="m-bpfc__heading">설립목적</div>
								<div class="m-bpfc__box">
									<div class="m-bpfc__values">
										<div class="m-bpfc__value">
											부산항 여객터미널 및 항만시설물의 효율적 관리와 
											<br />기타 항만의 공공시설물 위탁관리사업 수행을 통해 
											<br />항만 발전과 국민 편익 증진에 기여함
										</div>
									</div>
								</div>
							</div>
							<div class="m-bpfc__boxs">
								<div class="m-bpfc__heading">경영목표</div>
								<div class="m-bpfc__box">
									<div class="m-bpfc__values">
										<div class="m-bpfc__align">
											<div class="m-bpfc__key">VISION</div>
											<div class="m-bpfc__value">최고의 항만시설관리&middot;서비스 기관 도약</div>
										</div>
										<div class="m-bpfc__align">
											<div class="m-bpfc__key">MISSION</div>
											<div class="m-bpfc__value">
												항만시설의 효율적 관리&middot;운영을 통해<br /> 최고의 항만서비스로 일류 부산항 구현
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="facilities" class="m-facilities">
					<div class="m-aligner">
						<div class="m-headings">
							<h2 class="m-heading">주요관리시설</h2>
						</div>
						<div class="m-facilities__boxs">
							<div class="m-facilities__box m-facilities__box-1">
								<a href="international.do" class="m-facilities__info">
									<div class="m-facilities__key m-facilities__key-1">부산항 여객터미널</div>
									<div class="m-facilities__image">
										<img src="images/main/m-facilities__image-1.png" alt="부산항 여객터미널" />
									</div>
								</a>
							</div>
							<div class="m-facilities__box m-facilities__box-2">
								<a href="convention-intro.do" class="m-facilities__info">
									<div class="m-facilities__key m-facilities__key-2">부산항<br />국제전시컨벤션센터</div>
									<div class="m-facilities__image">
										<img src="images/main/m-facilities__image-2.png"
											alt="부산항 국제컨벤션센터" />
									</div>
								</a> <a href="bisc.do" class="m-facilities__info">
								<div class="m-facilities__key m-facilities__key-3">국제선용품 유통센터</div>
									<div class="m-facilities__image">
										<img src="images/main/m-facilities__image-3.png"
											alt="국제선용품 유통센터" />
									</div>
									
								</a>
							</div>
							<div class="m-facilities__box m-facilities__box-3">
								<a href="new-port.do" class="m-facilities__info">
									<div class="m-facilities__key m-facilities__key-4">신항항만시설관리
									</div>
									<div class="m-facilities__image">
										<img src="images/main/m-facilities__image-4.png"
											alt="신항항만시설관리" />
									</div>
								</a> <a href="union.do"
									class="m-facilities__info">
									<div class="m-facilities__key m-facilities__key-5">공용부두화물관리</div>
									<div class="m-facilities__image">
										<img src="images/main/m-facilities__image-5.png"
											alt="공용부두화물관리" />
									</div>
									
								</a>
							</div>
							<div class="m-facilities__box m-facilities__box-4">
								<a href="leisure.do" class="m-facilities__info">
									<div class="m-facilities__key m-facilities__key-6">항만레저시설
									</div>
									<div class="m-facilities__image">
										<img src="images/main/m-facilities__image-6.png"
											alt="항만레저시설" />
									</div>
								</a> <a href="etc.do"
									class="m-facilities__info m-facilities__info--last">
									<div class="m-facilities__key m-facilities__key-7">기타항만시설관리</div>
									<div class="m-facilities__image">
										<img src="images/main/m-facilities__image-7.png"
											alt="기타항만시설관리" />
									</div>
									
								</a>
							</div>
						</div>
					</div>
				</div>
				<div id="recruit" class="m-recruit">
					<div class="m-aligner">
						<div class="m-headings">
							<h2 class="m-heading">
								<img src="images/main/m-recruit.png" alt="채용,입찰정보" />
							</h2>
							<!-- <div class="m-heading__detail"><br></div> -->
							<br><br>
						</div>
						<div class="c-section">
							<div class="m-facilities__keys">
								<a class="m-facilities__key m-facilities__key-8">채용안내</a>
								<a href="public.do" class="m-service__news-more"><span class="is-hidden">채용안내</span>더보기</a>
							</div>
							<!-- <a href="public.do" style="background: #f1d4e5; font-size: smaller;" title="총모집건수 : ${checCnt }건 , 채용안내페이지 바로가기"> *모집중 : ${checCnt }건 + </a> -->
						</div>
						<div class="c-section c-section--x-small">
							<ul class="m-recruit__list">
								<c:forEach var="tin" items="${tin}" varStatus="status">
									<li class="m-recruit__item m-recruit__item-${status.count }">
									<a href="recruit-body.do?all_no=${tin.all_no }" class="m-recruit__link">
											<div class="m-recruit__infos">
												<div class="m-recruit__info">
													<div class="m-recruit__preview">
														<div class="m-recruit__current m-recruit__current--ing" id="color_main_${status.count }">
														<input type="hidden" value="${tin.chec }" id="thin_chec_hidden_main_${status.count }" />
															<c:set var="ch" value="${tin.chec}" />
															<c:if test="${ch eq '1' }">모집중</c:if>
															<c:if test="${ch ne '1' }">마감</c:if>
														</div>
														<div class="m-recruit__keys">
															<div class="m-recruit__key">${tin.place}</div>
															<div class="m-recruit__key m-recruit__key--big">
																${tin.title }
																직원채용공고
															</div>
														</div>
														<div class="m-recruit__value">
															<c:set var="ch1" value="${tin.employment}" />
																<c:if test="${ch1 eq '1' }">신입</c:if>
																<c:if test="${ch1 eq '2' }">경력</c:if>
																<c:if test="${ch1 ne '1' and ch1 ne '2' }">${tin.employment}</c:if> 직원 모집중입니다.<br />많은 참여 바랍니다
														</div>
														<div class="m-recruit__types">
															<div class="m-recruit__type">모집인원 : ${tin.no }</div>
															<div class="m-recruit__type">근무장소 : ${tin.place }</div>
															<div class="m-recruit__type">접수기간 : ${tin.period } 까지</div>
															<div class="m-recruit__type">근무조건 : ${tin.cond }</div>
														</div>
													</div>
												</div>
											</div>
									</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="c-section">
							<!-- <h3 class="m-facilities__key m-facilities__key-9">입찰안내</h3> -->
						</div>
						<div class="c-section c-section--x-small">
							<div class="m-recruit__news">
								<div class="m-service__news-headings">
									<div class="m-service__news-heading">
									<h3>입찰안내</h3>
									</div>
									<div class="m-service__news-mores">
										<a href="bid.do?board_id=4" class="m-service__news-more" title="입찰안내 더보기 버튼">더보기</a>
									</div>
								</div>
								
								<ul class="m-service__news-list">
								<c:forEach var="mainBidList" items="${mainBidList}" varStatus="status">
									<li class="m-service__news-item">
									<!-- 
									2018-06-26 오전 9:30
									수정자 : 박권수
									내  용 : 메인에서 board_id값 같이 넘겨줌
									 -->
									<a href="bid-body.do?board_id=${mainBidList.board_id }&seq_id=${mainBidList.seq_id}"class="m-service__news-link">
										${mainBidList.title}
										<div class="m-service__news-date"><c:set var="day_va" value="${mainBidList.register_date}" /> ${fn:substring(day_va,0,10) }</div>
									</a>
									
									</li>
									</c:forEach>
									</ul>
							</div>
						</div>
					</div>
				</div>
				<div id="organization" class="m-organization">
					<div class="m-aligner">
						<div class="m-headings">
							<h2 class="m-heading">조직도</h2>
						</div>
						<div class="m-organization__boxs">
							<ul>
								<li class="b-organization__boxs_left"><a href="#" class="m-organization__heading m-organization__heading--ceo" onclick="bpfc1('사장');" style="cursor:pointer;">사장</a>
									<ul>
										<li class="b-organization__boxs_left"><a href="#" class="m-organization__heading m-organization__heading--white" onclick="bpfc1('본부장');" style="cursor:pointer;">본부장</a>
											<ul>
												<li class="b-organization__boxs_left">
													<div class="m-organization__box m-organization__box-1">
													<a href="#" class="m-organization__heading"><span onclick="bpfc1('B000');" style="cursor:pointer;">경영<br />지원실</span></a>
														<ul class="m-organization__list">	
															<li class="m-organization__item"><a href="#" onclick="bpfc1('B1');" class="m-organization__link" title="경영기획부 자세히 보기">경영기획부</a></li>
															<li class="m-organization__item"><a href="#" onclick="bpfc1('B2');" class="m-organization__link" title="운영지원부 자세히 보기">운영지원부</a></li>
															<li class="m-organization__item"><a href="#" onclick="bpfc1('B3');" class="m-organization__link" title="전산부 자세히 보기">전산부</a></li>
														</ul>
													</div>
												</li>	
												<li class="b-organization__boxs_left">
													<div class="m-organization__box m-organization__box-2">
													<a href="#" class="m-organization__heading"><span onclick="bpfc1('C000');" style="cursor:pointer;">항만시설<br />관리사업소</span></a>	
														<ul class="m-organization__list">
															<li class="m-organization__item"><a href="#" onclick="bpfc1('C1');" class="m-organization__link" title="공용시설관리팀 자세히 보기">공용시설관리팀</a></li>
															<li class="m-organization__item"><a href="#" onclick="bpfc1('C2');" class="m-organization__link" title="화물관리팀 자세히 보기">화물관리팀</a></li>
															<li class="m-organization__item"><a href="#" onclick="bpfc1('C3');" class="m-organization__link" title="연안터미널관리팀 자세히 보기">연안터미널관리팀</a></li>
															<li class="m-organization__item"><a href="#" onclick="bpfc1('C4');" class="m-organization__link" title="BPA청사관리팀 자세히 보기">B<br />P<br />A<br />청사관리팀</a></li>
															<li class="m-organization__item"><a href="#" onclick="bpfc1('C5');" class="m-organization__link" title="영도시설관리팀 자세히 보기">영도시설관리팀</a></li>
														</ul>
													</div>
												</li>
												<li class="b-organization__boxs_left_1">
													<div class="m-organization__box m-organization__box-3" id="b-organization__boxs_left_1_div">
													<a href="#" class="m-organization__heading"><span onclick="bpfc1('D000');" style="cursor:pointer;">국제터미널<br />관리사업소</span></a>
														<ul class="m-organization__list">
															<li class="m-organization__item"><a href="#" onclick="bpfc1('D1');" class="m-organization__link" title="국제터미널관리팀 자세히 보기">국제터미널관리팀</a></li>
														</ul>
													</div>
												</li>
												<li class="b-organization__boxs_left_1">
													<div class="m-organization__box m-organization__box-4" id="b-organization__boxs_left_1_div">
													<a href="#" class="m-organization__heading"><span onclick="bpfc1('E000');" style="cursor:pointer;">컨벤션<br />사업소</span></a>
														<ul class="m-organization__list">
															<li class="m-organization__item"><a href="#" onclick="bpfc1('E1');" class="m-organization__link" title="컨벤션운영팀 자세히 보기">컨벤션운영팀</a></li>
														</ul>
													</div>
												</li>
												<li class="b-organization__boxs_left">
													<div class="m-organization__box m-organization__box-5">
													<a href="#" class="m-organization__heading"><span onclick="bpfc1('F000');" style="cursor:pointer;">신항<br />관리사업소</span></a>
														<ul class="m-organization__list">
															<li class="m-organization__item"><a href="#" onclick="bpfc1('F1');" class="m-organization__link" title="신항관리팀 자세히 보기">신항관리팀</a></li>
															<li class="m-organization__item"><a href="#" onclick="bpfc1('G1');" class="m-organization__link" title="항만공용전기팀 자세히 보기">항만공용전기팀</a></li>
														</ul>
													</div>
												</li>
											</ul>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="service" class="m-service">
					<div class="m-aligner">
						<div class="m-headings">
							<h2 class="m-heading">CUSTOMER SERVICE</h2>
						</div>
						<div class="m-service__cont">
							<div class="m-service__news">
								<div class="m-service__news-headings">
									<div class="m-service__news-heading">
										BPFC <em class="m-service__news-heading--em">NEWS</em>
									</div>
									<div class="m-service__news-mores">
										<!-- <div class="is-hidden">BPFC NEWS 더보기 버튼</div> -->
										<a href="center-news.do?board_id=1" class="m-service__news-more" title="BPFC NEWS 더보기 버튼">더보기</a>
									</div>
								</div>
								<ul class="m-service__news-list">
								<c:forEach var="mainBoardList" items="${mainBoardList}" varStatus="status">
									<li class="m-service__news-item">
									<!-- 
									2018-06-26 오전 9:30
									수정자 : 박권수
									내  용 : 메인에서 board_id값 같이 넘겨줌
									 -->	
									<a href="center-news-body.do?board_id=${mainBoardList.board_id}&seq_id=${mainBoardList.seq_id}"class="m-service__news-link">
										${mainBoardList.title}
										<div class="m-service__news-date"><c:set var="day_va" value="${mainBoardList.register_date}" /> ${fn:substring(day_va,0,10) }</div>
									</a>
									
									</li>
									</c:forEach>
									</ul>
							</div>
							<div class="m-service__infos">
								<div class="m-service__info">
									<div class="m-service__calls">
										<div class="m-service__call m-service__call-1">051-400-3100</div>
										<div class="m-service__call m-service__call-2">051-464-6154</div>
									</div>
								</div>
								<div class="m-service__info">
									<div class="m-service__time">AM 10:00 ~ PM 05:00</div>
								</div>
								<a href="inquiry.do?board_id=5" class="m-service__button">문의 하기</a>
							</div>
						</div>
					</div>
				</div>
				<div id="location" class="m-location">
					<div class="m-aligner">
						<div class="m-headings">
							<h2 class="m-heading">오시는길</h2>
						</div>
						<div class="m-location__boxs">
							<div class="m-location__box m-location__box-1">
								<!--<div id="map" style="width: 100%; height: 400px;" alt="지도"></div> -->
								<img src="images/main/m-location__box-1.png" alt="오시는길 약도" />
							</div>
							<div class="m-location__box m-location__box-2">
								<div id="map"  style="width: 100%; height: 640px;" alt="오시는길 네이버지도"></div>
							</div>
						</div>
						<div class="m-location__infos">
							<div class="m-location__info">
								48940 부산광역시 중구 충장대로 24 2층 (중앙동 4가 15-3) <br />부산본부세관 옆,
								구)국제여객터미널 2층
							</div>
							<div class="m-location__info m-location__info--call">
								대표번호 : <em class="m-location__info--em">051-400-3100</em>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="../../main_quick.jsp"></jsp:include>

		<script type="text/javascript">
			$('.c-banner__list').bxSlider({
				auto: true
			});
			
			// visual 
			$('.m-visual__list').bxSlider({
				pager: false,
				auto: true
			});

			// scrollmoving
			$('.c-gnb__link').not('.c-gnb__link--none').on(
					'click',
					function() {
						var thisHref = $(this).attr('href'), thisSt = $(
								thisHref).offset().top - 280;

						if ( $('.c-banner').hasClass('c-banner--active')){
							$('body, html').animate({'scrollTop':thisSt});
						}else {
							$('body, html').animate({'scrollTop':thisSt+200});
						}

						return false;
					});
			$('.c-quick__link')
					.on(
							'click',
							function() {
								if ($(this).parent()
										.hasClass('c-quick__item-3')
										|| $(this).parent().hasClass(
												'c-quick__item-4')) {
									var thisHref = $(this).attr('href');
									var thisSt = $(thisHref).offset().top - 250;
									
									if ( $('.c-banner').hasClass('c-banner--active')){
										$('body, html').animate({'scrollTop':thisSt});
									}else {
										$('body, html').animate({'scrollTop':thisSt+180});
									}
								} else {
									if ($(this).parent().hasClass(
											'c-quick__item-1')) {
										location.href = "convention_4.do";
									} else if ($(this).parent().hasClass(
											'c-quick__item-2')) {
										location.href = "union_3.do";
									}
								}
								return false;
							});

			var scrollControll = $.superscrollorama({
				reverse : false
			});

			var starMotion = new TimelineMax({
				repeat : -1
			}), policyItem = new TimelineLite({
				delay : .3
			});
			visualTxt = new TimelineLite({
				delay : .5
			});
			bpfcTxt = new TimelineLite({
				delay : .1
			});
			facilitiesInfo = new TimelineLite({
				delay : .01
			});
			recruitItem = new TimelineLite({
				delay : .01
			});

			// visual
			/*TweenMax.to('.m-visual__txts', .4, {
				opacity : 1
			});

			visualTxt.staggerTo('.m-visual__txt', 1, {
				delay : .1,
				top : 0,
				opacity : 1,
				ease : Power4.easeOut
			}, .5)
			*/

			// policy
			scrollControll.addTween('.m-policy', TweenMax.fromTo(
					'.m-policy__star-align', 100, {
						rotation : 360
					}, {
						rotation : 0,
						repeat : -1
					}));
			scrollControll.addTween('.m-policy', starMotion.staggerTo(
					'.m-policy__star', .4, {
						opacity : 1
					}, .2).staggerTo('.m-policy__star', .4, {
				opacity : 0
			}, .2));
			scrollControll.addTween('.m-policy', policyItem.staggerTo(
					'.m-policy__item', .7, {
						opacity : 1
					}, .3));
			scrollControll.addTween('.m-policy', TweenMax.to('.m-policy-add',
					.5, {
						delay : .7,
						bottom : '200px',
						ease : Back.easeOut.config(1.5)
					}, .3));

			// bpfc
			scrollControll.addTween('.m-bpfc', bpfcTxt.staggerTo(
					'.m-bpfc__boxs', .3, {
						scale : 1,
						ease : Quad.easeOut
					}, .5));

			// facilities
			scrollControll.addTween('.m-facilities', facilitiesInfo.staggerTo(
					'.m-facilities__info', 1.2, {
						opacity : 1,
						ease : Circ.easeOut
					}, .2));

			// recruit
			scrollControll.addTween('.m-recruit', recruitItem.staggerTo(
					'.m-recruit__item', 1, {
						delay : .2,
						top : 0,
						opacity : 1,
						ease : Circ.easeOut
					}, .2));
		</script>
		<jsp:include page="../../footer.jsp"></jsp:include>
		<script type="text/javascript">
			$('.copyright').on('click', function() {
				location.href = "login.do";
			});
			var map = new naver.maps.Map('map');
			var myaddress = '부산광역시 중구 충장대로 24';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
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
											content : '<h4> (사)부산항시설관리센터 </h4>'
										});
							});
			function bpfc1(name) {
				location.href = "organization2.do?department="
						+ encodeURI(name);
			}
		</script>
	</div>
</body>
</html>

