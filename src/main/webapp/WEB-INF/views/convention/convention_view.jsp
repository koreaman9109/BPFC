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
<script src="js/convention_js/cms_convention.js"></script>
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
		<h1>${con_view.event_name } <font title="1. 해당 게시물의 상세정보를 확인할 수 있습니다.
2. 하단의 뒤로가기 버튼 클릭시 이전 페이지로 이동 됩니다.
3. 하단의 수정 버튼을 클릭하면 해당 게시물의 수정페이지로 이동 됩니다.
"><img alt="" src="images/questionmark.png" style="width: 30px;"></font></h1>
		<table class="table table-hover">
			<tr>
				<td>행사구분</td>
				<td>${con_view.con_division }</td>
			</tr>
			<tr>
				<td>행사명</td>
				<td>${con_view.event_name }</td>
			</tr>
			<tr>
				<td>시작일자</td>
				<td>${con_view.con_start_date }</td>
			</tr>
			<tr>
				<td>종료일자</td>
				<td>${con_view.con_end_date }</td>
			</tr>
			<tr>
				<td>시간</td>
				<td>${con_view.con_time }</td>
			</tr>
			<tr>
				<td>장소</td>
				<td>${con_view.con_place }</td>
			</tr>
			<tr>
				<td>용도</td>
				<td>${con_view.con_usage }</td>
			</tr>
			<tr>
				<td>세팅형태</td>
				<td>${con_view.con_setting }</td>
			</tr>
			<tr>
				<td>참가인원(명)</td>
				<td>${con_view.con_paricipants }</td>
			</tr>
			<tr>
				<td>행사주관업체</td>
				<td>${con_view.con_organizer }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${con_view.con_phone }</td>
			</tr>
			<tr>
				<td>계약체결여부</td>
				<td>${con_view.con_check }</td>
			</tr>
			<tr>
				<td>임대료(원,VAT별도)</td>
				<td>${con_view.con_rent }</td>
			</tr>
			<tr>
				<td>예치금(원)</td>
				<td>${con_view.con_deposit }</td>
			</tr>
			<tr>
				<td>납부일자</td>
				<td>${con_view.con_paymentdate }</td>
			</tr>
			<tr>
				<td>납부여부</td>
				<td>${con_view.con_payment }</td>
			</tr>
			<tr>
				<td>비고</td>
				<td>${con_view.con_etc1 }</td>
			</tr>
			<tr>
				<td>공실</td>
				<td>${con_view.con_etc2 }</td>
			</tr>
		</table>
		<hr>
		<form action="convention_re_add.do" name="convention_re_add" method="post">
			<input class="btn btn-info" type="hidden" name="con_no" value="${con_view.con_no }" />
		</form>
			<a class="btn btn-info" onclick="back_bt();" style="color: white;">뒤로가기</a>
			
			<!--
			일자 : 2018-06-14 16:18
			내용 : 권한추가
			이름 : 박권수
			-->
			<c:if test="${auth eq '1'}">
			<input class="btn btn-info" type="button" onclick="convention_re_add_bt();" value="수정" />
		    </c:if>
		    <!-- end -->
		    
					        		
	</div>
	<br>
</body>
</html>