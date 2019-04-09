<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<%@ include file="../include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./js/recruit/recruit.js"></script>
<title>채용관리</title>
</head>
<body>
	<br>
	<h1 align="center">모집분야 추가</h1>
	<br>
	<form name="sub1" action="re_en_add_bt.do" method="post">
		<c:if test="${not empty msg }">
			<span class="err">${msg}</span>
		</c:if>
		<table class="table table-hover" style="width: 400px !important;">
			<tr>
				<td class="table-info">모집분야</td>
				<td><input class="searchForm" type="text" value="" name="re_en"></td>
			</tr>
			<tr id="favorable">
				<td class="table-info">우대조건</td>
				<td id="favorable_rd"><input class="searchForm" type="text" value=""
					id="favorable_val_1" name="favorable"> <input class="btn btn-info" type="button"
					value="+" onclick="favorable_add()"></td>
			</tr>
			<tr>
				<td class="table-info">근무조건</td>
				<td><input class="searchForm" type="text" value="" name="cond"></td>
			</tr>
			<tr>
				<td class="table-info">급여수준</td>
				<td><input class="searchForm" type="text" value="" name="salary"></td>
			</tr>
		</table>
		<a class="btn btn-info" href="javascript:history.back();">뒤로가기</a> <input class="btn btn-info" type="button"
			value="등록" onclick="re_en_add_bt()">
	</form>
</body>
</html>