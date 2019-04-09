<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include.jsp"%>
<script src="js/recruit/recruit.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.center_input{
		margin-left: 80px;
	}
	#checkbox_wid{
		width: 60px;
	}
	#pagination{
	margin-left: -200px;
	}
	#pagination li{
	padding-left: 5px;
	}
}
</style>
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
			pagination += '<li><a name="page_move" id="pagingtionid" start_page="'+i+'" style="background:gray; color:#fff; cursor:pointer;">'
					+ i + '</a></li>';
		} else {
			pagination += '<li><a name="page_move" id="pagingtionid" start_page="'+i+'" style="background:#fff; color:gray; cursor:pointer;">'
					+ i + '</a></li>';
		}
	}

	//하단 페이지 부분에 붙인다.
	$("#pagination").append('<ul>'+pagination+'</ul>');
	//--페이지 셋팅
	//페이지 번호 클릭시 이동
	$(document).on("click", "a[name='page_move']",function() {
		var visiblePages = 5;//리스트 보여줄 페이지
		$('#startPage').val(
				$(this).attr("start_page"));//보고 싶은 페이지
		$('#visiblePages').val(visiblePages);
		document.listForm.submit();
	});
});
</script>
</head>
<body>
<br>
	<h1 align="center">근무지 추가</h1>
	<br>
	<form name="place_del_action" action="place_del_action.do" method="get">
		<table class="table table-hover" style="width: 400px !important; padding-left:10px;">
			<tr>
				<th class="table-info" id="checkbox_wid">no</th>
				<th class="table-info" id="checkbox_wid">선택</th>
				<th class="table-info" colspan="2">근무지</th>
			</tr>
			<c:forEach var="plList" items="${plList}" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td><input class="searchForm" type="checkbox" name="no" value="${plList.no }"
						id="check_pl"></td>
					<td>${plList.place }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	
	<!-- 페이징 -->
	<form name="listForm" method="get">
		<input type="hidden" id="startPage" name="startPage" value="">
		<input type="hidden" id="visiblePages" name="visiblePages" value="">
	</form>
	<br>
	<div align="center" style="padding-left: 200px; width: auto;" id="pagination"></div>
	<!-- 페이징 뷰 -->
	<!-- 페이징 end -->

	<form name="place_add_action" action="place_add_action.do" method="post">
		<!-- <input type="hidden" name="no"> -->
		<div class="center_input">
		<input class="searchForm" type="text" name="place" value="" id="textd">
		<input class="btn btn-info" type="button" value="추가" onclick="place_add_but()">
		</div>
		<br>
	<input class="btn btn-info" type="button" value="삭제" onclick="place_del_but()">
	</form>
	

</body>
</html>