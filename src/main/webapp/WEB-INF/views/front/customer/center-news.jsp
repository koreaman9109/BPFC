<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 	
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>공지사항 목록</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#customer_na').parent().addClass('m-gnb__item--active');
});
</script>
<script type="text/javascript">



$(document).ready(function() {
	
	/* //--검색 초기값 세팅
	$("select option[value='title']").attr("selected", true); */

	
	//--페이지 셋팅
	var totalPage = ${totalPage}; //전체 페이지
	var startPage = ${startPage}; //현재 페이지
	/* console.log("-------콘솔내용------>" + startPage); */
	
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
			
			pagination  +=  '<li class="c-pagination__item">'+ '<a class="c-pagination__link" name="page_move" start_page="'+i+'"style="background-color: skyblue;" disabled>'
					+ i + '</a>' + '</li>';
		} else {
			pagination += '<li class="c-pagination__item">' + ' <a href="#" class="c-pagination__link" name="page_move" start_page="'+i+'" style="cursor:pointer;" >'
					+ i + '</a>'  + '</li>';
		}
	}


	//하단 페이지 부분에 붙인다.
	$("#pagination").append('<ul class="c-pagination__list">' + pagination + '</ul>');
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
	
$(document).ready(function() { 
	$("#searchBtn").click(function() {
		document.listForm.submit();
	
	});
});
	
	
</script>
	<script type="text/javascript">
/* document.listForm.sch_type.value = "${sch_type}"; */
  $(document).ready(function() { 
 
  $("#sch_type > option[value="+'<c:out value="${sch_type}"/>'+"]").attr("selected","selected");

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
						<h2 class="c-lnb__heading">고객마당</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item c-lnb__item--active"><a
								href="center-news.do?board_id=1" class="c-lnb__link">공지사항</a></li>
							<li class="c-lnb__item"><a href="newsletter.do?board_id=2"
								class="c-lnb__link">BPFC 소식지</a></li>
							<li class="c-lnb__item"><a href="photo.do?board_id=3"
								class="c-lnb__link">포토갤러리</a></li>
							<li class="c-lnb__item"><a href="lost.do?board_id=6"
								class="c-lnb__link">분실물안내</a></li>
							<li class="c-lnb__item"><a href="inquiry.do?board_id=5"
								class="c-lnb__link">문의사항</a></li>
							<li class="c-lnb__item"><a href="data.do?board_id=9"
								class="c-lnb__link">자료실</a></li>	
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
								class="breadcrumb__link">고객마당</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">공지사항</div></li>
						</ul>
					</div>
					<h3 class="c-h2">공지사항</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="s-news">
					<div class="c-align">
						<div class="s-news__searchs">
								<form name="listForm"  method="get">
												<input type="hidden" id="board_id" name="board_id" value="${board_id}">
												<input type="hidden" id="startPage" name="startPage" value="">
												<input type="hidden" id="visiblePages" name="visiblePages" value="">
							<div class="s-news__search-boxs">
								<div class="s-news__search-box s-news__search-box-1">
									<div class="s-news__selects">
										<label for="s-news__select" class="is-hidden">공지사항 글 검색 선택</label>
										<select name="sch_type" id="sch_type" class="s-news__select" title="선택">
																									
											<option value="title" >제목</option>
											<option value="content">내용</option>
											<option value="admin_id">작성자</option>
										</select>
									</div>
								</div>
							</div>
							<div class="s-news__search-box s-news__search-box-2">
								<div class="s-news__search">
									<label for="s-news__search" class="s-news__search-label">공지사항 글 검색 입력</label>
									<input type="text" id="sch_value" name="sch_value" value="${sch_value}"	class="s-news__search-input" title="검색"/>
									<button class="s-news__search-button" id="searchBtn">검색버튼</button>
								</div>
							</div>
							</form>
						</div>
						<div class="c-notices">
							<div class="c-notice__utils">
								<div class="c-notices__util">Total ${totalCnt}건 ( ${startPage} / ${totalPage} ) 페이지</div>
												
							</div>
							<div class="c-notice__scroll">
								<table class="c-notice">
									<caption><span class="is-hidden">공지사항: 번호, 제목, 첨부., 작성자, 작성일자, 조회</span></caption>
									<colgroup>
										<col style="width: 10%" />
										<col style="width: 52%" />
										<%-- <col style="width: 10%" /> --%>
										<col style="width: 12%" />
										<col style="width: 12%" />
										<col style="width: 10%" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<!-- <th scope="col">첨부</th> -->
											<th scope="col">작성자</th>
											<th scope="col">작성일자</th>
											<th scope="col">조회</th>
										</tr>
									</thead>
									<tbody>
									<c:choose>
										<c:when test="${fn:length(board_list) == 0}">												
											<tr>
												<td colspan="9" align="center">조회결과가 없습니다.</td>
											</tr>
										</c:when>
									<c:otherwise>
									<c:forEach var="board_list" items="${board_list}"  varStatus="status">
										<tr>
											<%-- <td>${board_list.num}</td> --%>
									<td>
                                    <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                                    <c:set var="startpage" value="${startPage-1}" />
                                    <c:set var="statuscount" value="${status.count }" />
                                    ${totalCnt+1-(startpage*10+statuscount)}
                                     </td>
											<td class="c-notice__left"><a href="center-news-body.do?board_id=${board_list.board_id}&seq_id=${board_list.seq_id}"
												class="c-notice__link">${board_list.title}</a>
												</td>
											<c:choose>
											<c:when test="${board_list.view_name eq null}">
											<td>관리자</td>
											</c:when>
											<c:otherwise>
											<td>${board_list.view_name}</td>
											</c:otherwise>	
											</c:choose>
											<td><c:set var="day_va" value="${board_list.register_date}" /> ${fn:substring(day_va,0,10) }</td>
											<td>${board_list.hit}</td>
										</tr>
										</c:forEach>
									</c:otherwise>
									</c:choose>
										
									</tbody>
								</table>
							</div>
						</div>

						<div class="c-pagination">
							<a href="center-news.do?board_id=${board_id}&startPage=1&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
							<a class="c-pagination" id="pagination"></a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
							<a href="center-news.do?board_id=${board_id}&startPage=${totalPage}&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
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
