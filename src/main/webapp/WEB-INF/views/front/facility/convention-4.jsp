<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>부산항국제전시컨벤션센터 일정</title>
<meta name="format-detection" content="telephone=no" />

<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/pages.css" />
<link rel="stylesheet" href="css/common.css" />
<link href='css/convention_css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/convention_css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link rel="stylesheet" href="css/convention_css/scheduler.min.css" />

<!-- 달력 플러그인 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="js/convention_js/moment.min.js"></script>
<script src="js/convention_js/fullcalendar.js"></script>
<script src="js/convention_js/scheduler.js"></script>
<!-- jquery밑에 넣어줘야 동작함. -->
<!-- // 달력 플러그인 -->
<script src="lib/placeholder/jquery.placeholder.min.js"></script>
<script src="lib/bxslider/jquery.bxslider.js"></script>
<script src="lib/tweenmax/TweenMax.js"></script>
<script src="lib/superscrollorama/jquery.superscrollorama.js"></script>

<script src="js/common.js"></script>
<style type="text/css">
	.fc-time{
		display:none;
	}
	#calendar .fc-toolbar button.fc-today-button{
		margin-left:10px;
		margin-right:-100px;
	}
	.fc-content{
		text-align: center;
		margin-top: 10%;
	}
	.fc-title{
	color: #fff;
		font-weight:400;
		font-size: 1em;
		line-height: 1.5em;
		z-index: 2;
	}
	.fc-more-cell div{
		margin: 0 auto;
		margin-top: 10%;
		text-align: center;
		background-color: #3a87ad;
		position: relative;
    	display: block;
   	 	border-radius: 3px;
   	 	cursor:pointer;
	}
	.fc-more{
		color: #fff;
		font-weight:400;
		font-size: 1em;
		/* line-height: 30px; */
		z-index: 2;
		
	}
	.fc-event{
	background-color: #fff;
	border: none;
	margin: 0;
	}
	.fc-content{
		margin-top: 10%;
		text-align: center;
		background-color: #3a87ad;
		position: relative;
    	display: block;
   	 	border-radius: 3px;
   		height: 20px;
	}
	.fc-more-cell div .fc-more{
		text-decoration: none;
	}
</style>
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
								class="breadcrumb__link">일정</div></li>
						</ul>
					</div>
					<div class="c-h2">
						<h3>부산항국제전시컨벤션센터(BPEX)&ensp;<a href="https://www.facebook.com/bpex.kr" target="_blank"><img class="f_sns1" src="images/pages/sns_01.png" alt="부산항국제전시컨벤션센터 페이스북연결" /></a></h3>
					</div>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="f-convention">
					<div class="f-convention__aligner">
						<h4 class="is-hidden">부산항국제전시컨벤션센터 일정</h4>
						<ul class="c-tabs">
							<li class="c-tab"><a
								href="convention.do" class="c-link">소개</a></li>
							<li class="c-tab"><a href="convention_2.do"
								class="c-link">주요업무</a></li>
							<li class="c-tab"><a href="convention_3.do"
								class="c-link">이용안내</a></li>
							<li class="c-tab"><a href="convention_5.do"
								class="c-link">MOU 체결 현황</a></li>
							<li class="c-tab c-tab--active"><a href="convention_4.do"
								class="c-link">일정</a></li>
						</ul>	

						<div class="f-convention__dates">
							<div class="f-convention__date f-convention__date-1">
								<div id="calendar">
									<!-- 달력 -->
								</div>
							</div>
							<div class="f-convention__date f-convention__date-2">
								<div class="c-heading">
									<h5 class="c-h3">
									<input type="hidden" value="${con_no_view }" id="con_no_view_hidden" />
										<a id="text_date"></a><span class="c-h3--gray">${con_no_view }일정 리스트</span>
									</h5>
								</div>
								<div class="c-tables c-tables--scroll">
									<table class="c-table c-table--small">
										<caption>
											<span class="is-hidden">일정 리스트: 시간, 장소, 행사명, 행사주관업체</span>
										</caption>
										<colgroup>
											<col style="width: 18%" />
											<col style="width: 22%" />
											<col style="width: 37%" />
											<col style="width: 22%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">시간</th>
												<th scope="col">장소</th>
												<th scope="col">행사명</th>
												<th scope="col">행사주관업체</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="con_list_view" items="${con_list_view}" varStatus="status">
											<tr>
												<td>${con_list_view.con_time }</td>
												<td>${con_list_view.con_place }</td>
												<td class="c-table__left">
													<div class="c-table__adds">
														<input type="hidden" value="${con_list_view.con_division }" id="con_division_hidden_${status.count }" />
														<span class="c-table__add" id="table_add_${status.count }"></span>${con_list_view.event_name }
													</div>
												</td>
												<td>${con_list_view.con_organizer }</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" value="${fn:length(con_list_view) }" id="list_size" />
			<!-- // 내용-->
		</div>

		<!-- 바로가기 및 맨위로 -->
		<jsp:include page="../../sub_quick.jsp"></jsp:include>
		<!-- end -->

		<script type="text/javascript">
			$(function() {
				var cc = $('#con_no_view_hidden').val();
				if(cc==''){
					cc=new Date();
				}
				$('#calendar').fullCalendar({
									lang:"ko",
									defaultDate : new Date(cc),
									navLinks : false, // can click day/week names to navigate views
									editable : false,
									eventLimit : 1, // allow "more" link when too many events
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dayNames : [ "SUN", "MON", "TUE", "WED",
											"THU", "FRI", "SAT" ],
									events : {
										url : 'cal_data.do',
										type : 'POST',
										error : function() {
											alert('there was an error while fetching events!');
										}/* ,
										color : '#00BFFF',
										textColor : 'black' */
									},
									schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
									buttonText: {
										prev: '<',
										next: '>'
									}
								    });
				
				var division_count = $("#list_size").val();
				if(division_count!=0){
					for(var k=1; k<=division_count; k++){
						var division_hidden = $("#con_division_hidden_"+k+"").val();
						if(division_hidden=="전시"){
							$("#table_add_"+k+"").text("Ex");
							$("#table_add_"+k+"").attr("class", "c-table__add c-table__add--blue");
						}
						else if(division_hidden=="이벤트"){
							$("#table_add_"+k+"").text("Ev");
							$("#table_add_"+k+"").attr("class", "c-table__add c-table__add--yellow");
						}
						else if(division_hidden=="회의"){
							$("#table_add_"+k+"").text("Co");
							$("#table_add_"+k+"").attr("class", "c-table__add c-table__add--purple");
						}
					}
				}
			});
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>
