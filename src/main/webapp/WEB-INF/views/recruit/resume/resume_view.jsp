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
<title>Insert title here</title>
</head>
<body>
	<div id="header"><jsp:include page="../../header.jsp"></jsp:include></div>
	<jsp:include page="../recruit_left_bar.jsp"></jsp:include>
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		<h1>이력서 관리</h1>
		<br>
		<!-- 타이틀선택 -->
		<form action="resume_list_re.do?board_id=7" name="resume_list_re" method="post">
		<select name="all_no" id="sch_type">
			<option>선택</option>
			<c:forEach var="boardList" items="${boardList }">
			<option value="${boardList.all_no }">${boardList.all_no } / ${boardList.title } / ${boardList.re_en }</option>
			</c:forEach>
		</select> 
		<!--
		일자 : 2018-06-14 16:18
		내용 : 권한추가
		이름 : 박권수
		-->
		<c:if test="${auth eq '1' }">
		<input class="btn btn-info" type="button" value="검색" onclick="resume_list_view();">
		</c:if>
		<!-- ======================================================================================= -->
		</form>
		<br>
		<form name="resume_list_del_action" action="resume_list_del1.do" method="get">
		<input type="hidden" value="A" id="del_move" name="del_move">
		<input type="hidden" value="1" id="all_no_opener" name="all_no1">
		<div style="width: 900px;">
		<h3 style="float: right;">총 지원자 수 : ${resumeCount }</h3><br>
		<table class="table table-hover">
			<tr class="table-info">
				<th>선택</th>
				<th>번호</th>
				<th>이름</th>
				<th>접수일자</th>
				<th>이력서</th>
			</tr>
			<c:forEach var="resume_list" items="${resume_list}" varStatus="status">
			<tr>
				<td><input type="checkbox" id="resume_noCheck" name="resume_no" value="${resume_list.resume_no }" /></td>
				<td>${status.count}</td>
				<td>${resume_list.name }</td>
				<td>${resume_list.re_date }</td>
				<td><a onclick="redown('${resume_list.resume_file2 }');" style="cursor:pointer">다운 </a></td>
			</tr>
			</c:forEach>
		</table>
		</div>
		</form>
		<input class="btn btn-info" type="button" value="선택삭제" onclick="resume_list_del_bt();" />
		<input class="btn btn-info" type="button" value="선택이동" onclick="resume_list_move_bt()" />
		<br>
	</div>
</body>
</html>