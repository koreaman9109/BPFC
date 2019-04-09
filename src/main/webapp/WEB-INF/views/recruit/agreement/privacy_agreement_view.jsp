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
		<h1>알림서비스 동의자 관리</h1>
		<br>
		<form action="privacy_del_at.do" name="privacy_del_at" method="get">
		<table class="table table-hover">
			<tr class="table-info">
				<th>선택</th>
				<th>번호</th>
				<th>이름</th>
				<th>연락처</th>
				<th>수신동의날짜&시간</th>
			</tr>
			<c:forEach var="prilist" items="${prilist}" varStatus="status">
				<tr>
					<td><input type="checkbox" name="privacy_no"
						value="${prilist.privacy_no}" /></td>
					<td>${status.count }</td>
					<td>${prilist.privacy_name}</td>
					<td>${prilist.phone}</td>
					<td>${prilist.agreement_date}</td>
				</tr>
			</c:forEach>
		</table>
		</form>
		<input class="btn btn-info" type="button" value="선택삭제" onclick="privacy_del_bt()" />
	</div>
</body>
</html>