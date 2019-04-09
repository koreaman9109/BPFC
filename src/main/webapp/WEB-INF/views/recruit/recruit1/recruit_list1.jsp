<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../include.jsp"%>
<script src="js/recruit/recruit.js"></script>
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
								
								pagination  +=  '<li class="c-pagination__item">'+ '<a class="c-pagination__link" name="page_move" start_page="'+i+'"style="background-color: skyblue;" disabled>'
										+ i + '</a>' + '</li>';
							} else {
								pagination += '<li class="c-pagination__item">' + ' <a class="c-pagination__link" name="page_move" start_page="'+i+'" style="cursor:pointer;" >'
										+ i + '</a>'  + '</li>';
							}
						}

						//하단 페이지 부분에 붙인다.
						$("#pagination").append('<ul class="c-pagination__list">' + pagination + '</ul>');
						//--페이지 셋팅

						//페이지 번호 클릭시 이동
						$(document).on("click", "a[name='page_move']",function() {
									var visiblePages = 10;//리스트 보여줄 페이지
									$('#startPage').val(
											$(this).attr("start_page"));//보고 싶은 페이지
									$('#visiblePages').val(visiblePages);
									document.listForm.submit();
								});
					});
</script>
<style type="text/css">
	#pagination li{
	padding-left: 5px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="header"><jsp:include page="../../header.jsp"></jsp:include></div>
	<jsp:include page="../recruit_left_bar.jsp"></jsp:include>
	<div align="center"
		style="padding-top: 100px; padding-left: 200px; width: auto;">
		<h1>채용관리</h1>
		<table style="border:0px; width:900px;">
			<tr>
				<td colspan="2" align="left" width="100px">PAGE : ${startPage}
					/ ${totalPage}</td>
				<td colspan="5" align="right">전체 ${totalCnt}개의 게시물이 등록되어 있습니다.</td>
			</tr>
		</table>
		<br>
		<form name="delete_check" action="delete_check1.do?board_id=7" method="get">
			<table class="table table-hover">
				<tr class="table-info" align="center">
					<th>번호</th>
					<th>선택</th>
					<th>제목</th>
					<th>상태</th>
					<th>작성일자</th>
					<th>조회</th>
				</tr>
				<c:forEach var="boardList" items="${boardList}" varStatus="status">
					<tr id="tdd">
						<td align="center">${boardList.all_no}</td>
						<td><input type="checkbox" id="check_box" name="all_no"
							value="${boardList.all_no}" /></td>
						<td align="center"><a
							href="recruit_view.do?board_id=7&all_no=${boardList.all_no}">${boardList.title}</a></td>
						<td align="center"><c:set var="ch" value="${boardList.chec}" />
							<c:if test="${ch eq '1' }">
								<span class="badge badge-success">모집중</span>
							</c:if> <c:if test="${ch ne '1' }">
								<span class="badge badge-danger">마감</span>
							</c:if></td>
						<td align="center">${boardList.day}</td>
						<td align="center">${boardList.check_no}</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<form name="re_update" action="recruit_write_update.do" method="post">
			<input type="hidden" name="all_no" value="" id="up_all_no" />
		</form>
		<!--
		일자 : 2018-06-14 16:18
		내용 : 권한추가
		이름 : 박권수
		-->
		<div style="width: 900px;">
		<c:if test="${auth eq '1'}">
		<input class="btn btn-info" type="button" value="선택삭제" id="" onclick="sel_check1();" style="float:left;" />
		<input class="btn btn-info" type="button" value="등록" id="re_write" onclick="re_write()" style="float:right;" />
		</c:if>
		</div>	
		<!-- =====================================================================================  -->
			<!-- 삭제버튼 -->
			<!-- <input type="button" value="del_test" onclick="sel_check()" /> -->
	
	<!-- 페이징 -->
	<form name="listForm" method="get">
		<input type="hidden" id="startPage" name="startPage" value="">
		<input type="hidden" id="visiblePages" name="visiblePages" value="">
		<input type="hidden" id="board_id" name="board_id" value="${board_id }">
	</form>
	<br>
			<!-- /* 
					2018-06-27 오전 10:46
					수정자 : 박권수
					내  용 : 입찰안내 파일 목록 보기 추가
					*/ -->
	<!-- 페이징 view -->
			<div class="c-pagination" align="center" >
				<a href="recruit_list.do?board_id=${board_id}&startPage=1&visiblePages=10"
					class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
				<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
				<a href="#" class="c-pagination" id="pagination"></a>
				<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
				<a href="recruit_list.do?board_id=${board_id}&startPage=${totalPage}&visiblePages=10"
					class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
			</div>
			</div>
	<!-- 페이징 end -->
</body>
</html>