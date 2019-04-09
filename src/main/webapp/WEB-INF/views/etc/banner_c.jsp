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
<style type="text/css">
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="header">
	<jsp:include page="../header.jsp"></jsp:include>
	</div>
	<div class="left" style="height: 100% ;">
	<jsp:include page="../setting_submenu.jsp"></jsp:include>
	</div>
	<div align="center" style="padding-left: 200px; width: auto;">
		<br> <br> <br> <br> <br>
		<h1>배너 추가</h1>
		<br>
		<form name="banner_add" action="banner_add.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" value="null" name="admin_id"> <input
				type="hidden" value="null" name="update_id"> <input
				type="hidden" value="null" name="update_date">
			<table class="table table-hover">
			<tr>
			<td>파일</td>
			<td><input type="file" name="uploadfile[0]" required="required" /></td>
			</tr>
			<tr>
			<td>상세정보</td>
			<td><input type="text" class="form-control" value="" name="banner_ex" placeholder="예)연안여객터미널바로가기 Go" /></td>
			</tr>
			<tr>
			<td>연결 url</td>
			<td><input type="text" class="form-control" value="http://" name="banner_url" /></td>
			</tr>
			<tr>
			<td>시작일</td>
			<td><input type="text" class="form-control" value="" name="banner_start_date" id="start_date" placeholder=" YYYY-MM-DD / click" readonly /></td>
			</tr>
			<tr>
			<td>종료일</td>
			<td><input type="text" class="form-control" value="" name="banner_last_date" id="last_date" placeholder=" YYYY-MM-DD / click" readonly /></td>
			</tr>
			</table>
		</form>
		<a class="btn btn-info" href="javascript:history.back();">뒤로가기</a> 
		<c:if test="${sessionScope.admin_id eq 'bpfcadmin' || sessionScope.admin_id eq 'interlink'}">
		<a class="btn btn-info" onclick="banner_add_bt()">확인</a>
		</c:if>
	</div>
	
	<script type="text/javascript">
	jQuery(document).ready(function() {
		//datePicker
		$('#last_date').datepicker({
			dateFormat : 'yyyy-mm-dd',
			language : 'en',
			/* 날짜클릭이벤트 */
		    onSelect: function(){
		    	$('#last_date').datepicker("hide");
		    	$('#last_date').blur();
			}
		})
		$('#start_date').datepicker({
			dateFormat : 'yyyy-mm-dd',
			language : 'en',
			/* 날짜클릭이벤트 */
		    onSelect: function(){
		    	$('#start_date').datepicker("hide");
		    	$('#start_date').blur();
			}
		})
	});
</script>
</body>
</html>