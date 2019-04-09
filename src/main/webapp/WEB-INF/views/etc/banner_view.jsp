<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- <%@ include file="../include.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/cms.css?ver=1" rel="stylesheet">
<link href="css/convention_css/datepicker.min.css" rel="stylesheet" type="text/css">
<link href="css/wickedpicker.css" rel="stylesheet" type="text/css">
<link href="css/cms/bootstrap.min.css" rel="stylesheet">
<link href="css/cms/bootstrap.css" rel="stylesheet">
<link href="css/board.css" rel="stylesheet">
<script src="js/cms/jquery-3.3.1.min.js"></script>
<script src="js/cms/popper.min.js"></script>
<script src="js/cms/bootstrap.min.js"></script>
<script src="ckeditor/ckeditor.js"></script>
<script src="js/convention_js/datepicker.min.js"></script>
<script src="js/convention_js/datepicker.en.js"></script>
<script src="js/convention_js/wickedpicker.js"></script>
<style>	.err { color: red; font-size: 20px;  } </style>
<script src="js/banner/banner_js.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="header">
	<jsp:include page="../header.jsp"></jsp:include></div>
	<div class="left" style="height: 100% ;">
	<jsp:include page="../setting_submenu.jsp"></jsp:include>
	</div>
	<div align="center" style="padding-left: 200px; width: auto;">
		<br> <br><br><br><br>
		<h1>배너설정</h1><br>
		<table class="table" style="text-align: center;">
			<tr>
				<th>no</th>
				<th>이미지</th>
				<th>내용</th>
				<th>기간</th>
				<th>삭제</th>
			</tr>
			<tr>
			<tr>
					<td>0</td>
					<td><a href="banner_c1.do?board_id=10&board_id2=7&banner_no=1"><img alt="배너이미지"
						src="${banner_only.banner_path }${banner_only.banner_filename}"
						style="width: 150px;"></a></td>
					<td><a href="banner_c1.do?board_id=10&board_id2=7&banner_no=1">${banner_only.banner_ex }</a></td>
					<td> 영구 </td>
					<td><button class="btn btn-info">삭제불가</button></td>
				</tr>
			<c:forEach var="banner_list" items="${banner_list}"
				varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td><a href="banner_c1.do?board_id=10&board_id2=7&banner_no=${banner_list.banner_no }"><img alt="배너이미지"
						src="${banner_list.banner_path }${banner_list.banner_filename}"
						style="width: 150px;"></a></td>
					<td><a href="banner_c1.do?board_id=10&board_id2=7&banner_no=${banner_list.banner_no }">${banner_list.banner_ex }</a></td>
					<td> ~ ${banner_list.banner_last_date }</td>
					<td>
					<c:if test="${sessionScope.admin_id eq 'bpfcadmin' || sessionScope.admin_id eq 'interlink'}">
					<button class="btn btn-info"
							onclick="del_bt(${banner_list.banner_no })">삭제</button>
					</c:if>		
					</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${sessionScope.admin_id eq 'bpfcadmin' || sessionScope.admin_id eq 'interlink'}">
		<button class="btn btn-info" onclick="bt()">추가</button>
		</c:if>
	</div>
</body>
</html>