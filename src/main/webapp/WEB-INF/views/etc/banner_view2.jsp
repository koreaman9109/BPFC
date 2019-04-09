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
<%@ include file="../include.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../setting_submenu.jsp"></jsp:include>
	<br><br>
	<h1>배너설정</h1>
	<div align="center" style="padding-top:100px; padding-left: 200px; width: auto;">
	<table class="table">
		<tr>
			<th>no</th>
			<th>이미지</th>
			<th>추가</th>
			<th>삭제</th>
		</tr>
		<tr>
			<td>1</td>
			<td><img alt="banner1" src="${banner_1.banner_path }${banner_1.banner_filename}" style="width: 300px; hight: 200px;"></td>
			<td><button class="btn btn-info" value="1" id="bt1" onclick="bt1()">추가/수정</button><input type="hidden" value="${banner_1.banner_no }" id="img1" /></td>
			<td><button class="btn btn-info" onclick="del_bt1()">삭제</button></td>
		</tr>
		<tr>
			<td>2</td>
			<td><img alt="banner2" src="${banner_2.banner_path }${banner_2.banner_filename}" style="width: 300px; hight: 200px;"></td>
			<td><button class="btn btn-info" value="2" id="bt2" onclick="bt2()">추가/수정</button><input type="hidden" value="${banner_2.banner_no }" id="img2" /></td>
			<td><button class="btn btn-info" onclick="del_bt2()">삭제</button></td>
		</tr>
		<tr>
			<td>3</td>
			<td><img alt="banner3" src="${banner_3.banner_path }${banner_3.banner_filename}" style="width: 300px; hight: 200px;"></td>
			<td><button class="btn btn-info" value="3" id="bt3" onclick="bt3()">추가/수정</button><input type="hidden" value="${banner_3.banner_no }" id="img3" /></td>
			<td><button class="btn btn-info" onclick="del_bt3()">삭제</button></td>
		</tr>
		<tr>
			<td>4</td>
			<td><img alt="banner4" src="${banner_4.banner_path }${banner_4.banner_filename}" style="width: 300px; hight: 200px;"></td>
			<td><button class="btn btn-info" value="4" id="bt4" onclick="bt4()">추가/수정</button><input type="hidden" value="${banner_4.banner_no }" id="img4" /></td>
			<td><button class="btn btn-info" onclick="del_bt4()">삭제</button></td>
		</tr>
	</table>
	</div>
</body>
</html>