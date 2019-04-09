<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/banner/banner_js.js"></script>
<%@ include file="../../include.jsp"%>
<title>SMS발신내역</title>
</head>
<body>
	<div id="header">
	<jsp:include page="../../header.jsp"></jsp:include></div>
	<div class="left" style="height: 100% ;">
	<jsp:include page="../../setting_submenu.jsp"></jsp:include>
	</div>
	<div align="center" style="padding-left: 200px; width: auto;">
	<br> <br><br><br><br>
		<h1>SMS발신내역</h1><br>
		<table class="table" style="text-align: center; min-width: 1000px;  table-layout: fixed;">
			<tr>
				<th>번호</th>
				<th>수신자 명</th>
				<th>수신 연락처</th>
				<th style="width:300px;">메세지</th>
				<th>날짜</th>
				<th>결과</th>
				<th>발신자</th>
				<th>에러코드</th>
			</tr>
			<c:set var="auth" value="${auth}" />
			<c:set var="auth2" value="${auth2}" />
			<c:choose>
	    	<c:when test="${auth eq '1' || auth2 eq '1'}">
			<c:forEach var="smsList" items="${smsList}" varStatus="status">
			<tr>
				<td>${smsList.sms_no }</td>
				<td>${smsList.user_name }</td>
				<td>${smsList.tell }</td>
				<td id="mas_td_font" style="width: 300px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><font title="${smsList.messages }">${smsList.messages }</font></td>
				<td>${smsList.send_date }</td>
				<td>
				<c:set var="ch" value="${smsList.result}" />
				<c:if test="${ch eq '2' }">
				성공
				</c:if> <c:if test="${ch eq '4' }">
				<a style="color: red;">실패</a>
				</c:if>
				</td>
				<td>${smsList.admin_id }</td>
				<td>
					<c:if test="${ch eq '4' }">
						<a style="color: red;">${smsList.error }</a>
					</c:if>
				</td>
			</tr>
			</c:forEach>
			</c:when>
			</c:choose>
		</table>
	</div>
</body>
</html>