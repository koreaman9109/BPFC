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

<h2>게시판 선택</h2>

	<select id="all_no_pop">
		<option>선택</option>
		
		<c:forEach var="boardList" items="${boardList }">
		<option value="${boardList.all_no }">${boardList.all_no } / ${boardList.title } / ${boardList.re_en }</option>
		</c:forEach>
	</select>
	
	<button onclick="sendAll_no1()">확인</button>

</body>
</html>