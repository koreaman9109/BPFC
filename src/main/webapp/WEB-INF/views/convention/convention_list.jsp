<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="js/convention_js/cms_convention.js"></script>
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
								
								pagination  +=  '<li class="c-pagination__item">'+ '<a class="c-pagination__link" name="page_move" start_page="'+i+'" style="background-color: skyblue;" disabled>'
										+ i + '</a>' + '</li>';
							} else {
								pagination += '<li class="c-pagination__item">' + ' <a class="c-pagination__link" name="page_move" start_page="'+i+'" style="cursor:pointer;">'
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
						/* 검색어 유지  */
						var i = $("#hidden_type").val();
						$("#sch_type > option[value='"+i+"']").attr("selected","selected");
					});
</script>
<style type="text/css">
	#pagination li{
	padding-left: 5px;
	}
	.table{
		width: 1100px !important;
		font-size: 13;
	}
	table #wid_td {
	 	display: inline-block;
		width: 300px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	table #wid_td1 {
	 	display: inline-block;
		width: 160px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	table #wid_td2 {
	 	display: inline-block;
		width: 120px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	table #wid_td3{
		width: 100px;
	}
</style>
<title>컨벤션센터관리</title>
</head>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<div class="navLeft">
		<ul>
			<li style="font-size: large;">컨벤션센터관리</li>
		</ul>
	</div>
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
	<h1>컨벤션센터관리 <font title="1. 컨벤션센터 리스트상의 번호는 게시판 고유번호가 표기됨으로 번호가 일정하지 않습니다.
2. 컨벤션센터의 게시물 개수관련은 좌측상단에 카운트 됩니다.
3. 검색은 우측상단에서 행사명, 주관업체, 일자 별로 가능 합니다.
	(-> 일자 검색 시 YYYYMMDD 유형(ex - 20180701)으로 검색해야하며, 일자가 포함된 일정을 표시해줍니다.)
4. 행사명 클릭 시 미리보기 화면으로 이동됩니다.
5. 삭제 : 선택 칸 클릭(☑) 후 좌측하단의 선택삭제 클릭 시 해당 게시물이 삭제됩니다.
6. 등록 : 우측 하단의 등록 버튼 클릭 시 등록 페이지로 이동됩니다.
7. 수정 : 수정은 미리보기 화면으로 이동 후 하단의 수정버튼을 클릭하면 수정페이지로 이동됩니다.
8. 페이징 처리는 하단에 첫째 페이지, 각 페이지, 마지막 페이지로 구성되어있습니다.
"><img alt="" src="images/questionmark.png" style="width: 30px;"></font></h1>
		<form name="listForm" method="get">
		<!-- 페이징 -->

		<input type="hidden" id="startPage" name="startPage" value="">
		<input type="hidden" id="visiblePages" name="visiblePages" value="">
		<input type="hidden" id="board_id" name="board_id" value="${board_id}">
		
					<table style="border: 0px; width:900px;">		
					<tbody>	
					<tr>
					<td colspan="2" align="left" width="100px">TOTAL : ${totalCnt}건 ( ${startPage} / ${totalPage} ) 페이지</td>
					
												<!-- 검색 view  -->
												<!--    /*  날   짜: 2018-06-27 16:10
														 * 	내   용: 검색추가
														 * 	이   름: 박권수
														 */ -->
														 
														 
					<td colspan="5" align="right">
 					<select class="selectForm" name="sch_type" id="sch_type" >
						<option value="event_name">행사명</option>
						<option value="con_organizer">주관업체</option>
						<option value="con_date">일자</option>
					</select> 
					<input type="text" class="searchForm" id="sch_value" name="sch_value" value="${sch_value}"/>
					<input class="btn btn-secondary" type="button" onclick="searchBtn()" value="검색"/>
					<input type="hidden" value="${sch_type }" id="hidden_type" />
					</td>
					<!-- 검색 end  -->
					</tr>
					</tbody>
					</table>
				</form>
					<br>
	
		<form action="convention_list_del1.do" name="convention_list_del" method="get">
		<table class="table table-hover">
			<tr>
				<td>선택</td>
				<td>번호</td>
				<td>일자</td>
				<td id="wid_td">행사명</td>
				<td id="wid_td1">장소</td>
				<td id="wid_td3">참가인원</td>
				<td id="wid_td1">행사주관업체</td>
				<td id="wid_td2">연락처</td>
			</tr>
			<c:forEach var="con_list" items="${con_list }" varStatus="status">
				<tr>
					<td><input type="checkbox" name="con_no" value="${con_list.con_no }" /></td>
					<td>${con_list.con_no }</td>
					<td>${con_list.con_start_date } ~ ${con_list.con_end_date }</td>
					<td id="wid_td"><a href="convention_view.do?board_id=8&con_no=${con_list.con_no }">${con_list.event_name}</a></td>
					<td id="wid_td1">${con_list.con_place }</td>
					<td id="wid_td3">${con_list.con_paricipants }</td>
					<td id="wid_td1">${con_list.con_organizer }</td>
					<td id="wid_td2">${con_list.con_phone }</td>
				</tr>
			</c:forEach>
		</table>
		</form>
	
	
	<!--
	일자 : 2018-06-14 16:18
	내용 : 권한추가
	이름 : 박권수
	-->
	<div style="width: 1000px;">
	<c:set var="auth" value="${auth}" />
	<c:choose>
   		<c:when test="${auth eq '1'}">
		<input class="btn btn-info" type="button" value="선택삭제" onclick="convention_list_del_bt()" style="float:left;" /> 
		<input class="btn btn-info" type="button" value="등록" onclick="convention_add_bt()" style="float:right;" />
   		</c:when>
	</c:choose>
	</div>
	<!-- end -->
	
		<!-- 페이징 view -->
			<!--    /*  날   짜: 2018-06-27 16:10
					 * 	내   용: 처음 다음 추가
					 * 	이   름: 박권수
					 */ -->			
			<div class="c-pagination" style="align: center;">
				<a href="convention_list.do?board_id=${board_id}&startPage=1&visiblePages=10"
					class="c-pagination__arrow c-pagination__arrow--allprev">첫페이지로</a>
				<a href="#" class="c-pagination" id="pagination"></a>
				<a href="convention_list.do?board_id=${board_id}&startPage=${totalPage}&visiblePages=10"
					class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
			</div>
	<!-- 페이징 end -->
	
	</div>
		
	
</body>
</html>