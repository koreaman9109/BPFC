<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>채용공고 - 목록</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#recruit_na').parent().addClass('m-gnb__item--active');
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	//--페이지 셋팅
	var totalPage = ${totalPage}; //전체 페이지
	var startPage = ${startPage}; //현재 페이지
	
	var pagination = "";

	//--페이지네이션에 항상 10개가 보이도록 조절
	var forStart = 0;
	var forEnd = 0;

	if ((startPage - 5) < 1) {
		forStart = 1;
	} else {
		forStart = startPage - 5;
	}

	if (forStart == 1) {

		if (totalPage > 9) {
			forEnd = 10;
		} else {
			forEnd = totalPage;
		}

	} else {

		if ((startPage + 4) > totalPage) {

			forEnd = totalPage;

			if (forEnd > 9) {
				forStart = forEnd - 9
			}

		} else {
			forEnd = startPage + 4;
		}
	}
	//--페이지네이션에 항상 10개가 보이도록 조절

	//전체 페이지 수를 받아 돌린다.
	for (var i = forStart; i <= forEnd; i++) {
		if (startPage == i) {
			
			pagination  +=  '<li class="c-pagination__item"><a class="c-pagination__link" name="page_move" start_page="'+i+'" style="background-color: skyblue;" disabled>'
					+ i + '</a></li>';
		} else {
			pagination += '<li class="c-pagination__item"><a href="#" class="c-pagination__link" name="page_move" start_page="'+i+'"  style="cursor:pointer;">'
					+ i + '</a></li>';
		}
	}

	//하단 페이지 부분에 붙인다.
	$("#pagination").append('<ul class="c-pagination__list">'+pagination+'</ul>');
	//--페이지 셋팅

	

	//페이지 번호 클릭시 이동
	$(document).on("click","a[name='page_move']",
			function() {
				var visiblePages = 10;//리스트 보여줄 페이지
				$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
				$('#visiblePages').val(visiblePages);
				document.listForm.submit();
			});
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
						<h2 class="c-lnb__heading">채용&middot;입찰정보</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item c-lnb__item--active"><a
								href="public.do" class="c-lnb__link">채용안내</a></li>
							<!-- <li class="c-lnb__item"><a href="notice-service1.do"
								class="c-lnb__link">알림서비스</a></li> -->
								<li class="c-lnb__item"><a href="bid.do?board_id=4" class="c-lnb__link">입찰안내</a></li>
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
								class="breadcrumb__link">채용·입찰정보</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">채용안내</div></li>
						</ul>
					</div>
					<h3 class="c-h2">채용안내</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="r-public">
					<ul class="r-public__steps">
						<li class="r-public__step r-public__step-1">
							<div class="r-public__key">채용공고</div>
							<div class="r-public__value">
								채용공고는 홈페이지에서<br />확인할 수 있습니다.
							</div>
						</li>
						<li class="r-public__step r-public__step-2">
							<div class="r-public__key">서류심사</div>
							<div class="r-public__value">
								실무진 중심에서 지원자의<br />전반적인 업무 능력과<br />역량 중심의이력을<br />평가합니다.
							</div>
						</li>
						<li class="r-public__step r-public__step-3">
							<div class="r-public__key">면접전형</div>
							<div class="r-public__value">
								기본 인성 및 자질을<br />종합 평가하여 진행합니다.
							</div>
						</li>
						<li class="r-public__step r-public__step-4">
							<div class="r-public__key">합격자 발표</div>
							<div class="r-public__value">
								합격자에 한해서<br />개별적으로 연락드립니다.
							</div>
						</li>
					</ul>
					<div class="r-public__box">
						<ul class="r-public__list">
						<c:forEach var="tin" items="${tin}" varStatus="status">
							<li class="r-public__item r-public__item-${status.count }">
								<div class="r-public__headings">
									<div class="r-public__current r-public__current--red" id="color_${status.count }">
									<input type="hidden" value="${tin.chec }" id="thin_chec_hidden_${status.count }" />
											<c:set var="ch" value="${tin.chec }" />
											<c:if test="${ch eq '1' }">
											모집중
											</c:if> <c:if test="${ch ne '1' }">
											마감
											</c:if>
											</div>
									<div class="r-public__heading"><a href="recruit-body.do?all_no=${tin.all_no }"
													class="c-notice__link">${tin.title }</a></div>
								</div>
								<div class="r-public__conts">
									<div class="r-public__cont">
										<a href="recruit-body.do?all_no=${tin.all_no }"
													class="c-notice__link"><em class="r-public--em">${tin.re_en }</em> ${tin.place }
									</a>
									</div>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>

					<div class="r-public__aligner">
						<div class="c-notices">
							<div class="c-notice__utils">
								<div class="c-notices__util">Total ${totalCnt}건 ( ${startPage} /${totalPage} ) 페이지</div>
							</div>
							<div class="c-notice__scroll">
								<table class="c-notice">
									<caption><span class="is-hidden">채용공고 리스트: 번호, 제목, 상태., 작성자, 작성일자, 조회</span></caption>
									<colgroup>
										<col style="width: 10%" />
										<col style="width: 28%" />
										<col style="width: 12%" />
										<col style="width: 18%" />
										<col style="width: 18%" />
										<col style="width: 10%" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">상태</th>
											<th scope="col">작성자</th>
											<th scope="col">작성일자</th>
											<th scope="col">조회</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="boardList" items="${boardList}"
											varStatus="status">
											<tr>
												<td>
												<!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
												<c:set var="startpage" value="${startPage-1}" />
												<c:set var="statuscount" value="${status.count }" />
												${totalCnt+1-(startpage*10+statuscount)}
												 </td>
												<td class="c-notice__left"><a href="recruit-body.do?all_no=${boardList.all_no }"
													class="c-notice__link">${boardList.title}</a></td>
												<td><div class="c-notice__current c-notice__current--red" id="chec_color1_${status.count }">
													<input type="hidden" value="${boardList.chec }" id="chec_hidden1_${status.count }" />
														<c:set var="ch" value="${boardList.chec }" />
														<c:if test="${ch eq '1' }">
														모집중
														</c:if> <c:if test="${ch ne '1' }">
														마감
														</c:if>
													</div></td>
												<td>
												<c:set var="uu" value="${boardList.view_name }" />
														<c:if test="${uu eq null }">
														관리자
														</c:if> <c:if test="${uu ne null }">
														${boardList.view_name }
														</c:if>
												</td>
												<td><c:set var="day_va" value="${boardList.day}" /> ${fn:substring(day_va,0,10) }</td>
												<td>${boardList.check_no}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 페이징 -->
						<form name="listForm"  method="get">
						<input type="hidden" id="startPage" name="startPage" value="">
						<input type="hidden" id="visiblePages" name="visiblePages" value="">
						<!-- 권수추가 -->
						<input type="hidden" id="board_id" name="board_id" value="">
						</form>
						<br>
					</div>
						<!-- /* 
								2018-06-27 오전 10:46
								수정자 : 박권수
								내  용 : 처음 마지막 추가
								
								*/-->
						<div class="c-pagination">
							<a href="public.do?board_id=${board_id}&startPage=1&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
							<a class="c-pagination" id="pagination"> </a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
							<a href="public.do?board_id=${board_id}&startPage=${totalPage}&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
						</div>

				</div>
			</div>
			<!-- // 내용-->
		</div>

		<!-- 바로가기 및 맨위로 -->
		<jsp:include page="../../sub_quick.jsp"></jsp:include>
		<!-- end -->

		<script type="text/javascript">
			var step = new TimelineLite({
				delay : .2
			});
			step.staggerTo('.r-public__step', .5, {
				delay : .2,
				opacity : 1,
				left : 0
			}, .2);
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>