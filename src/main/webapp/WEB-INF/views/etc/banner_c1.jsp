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
<script src="js/banner/banner_js.js"></script>
</head>
<body>
<div id="header">
	<jsp:include page="../header.jsp"></jsp:include></div>
	<div class="left" style="height: 100% ;">
	<jsp:include page="../setting_submenu.jsp"></jsp:include></div>
	<div align="center" style="padding-left: 200px; width: auto;">
		<br> <br> <br> <br> <br>
		<h1>${banner_no }.배너수정</h1>
		<br>
		<form name="banner_add1" action="banner_add1.do" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${banner_no }" name="banner_no" />
			<input type="hidden" value="null" name="admin_id" />
			<input type="hidden" value="null" name="update_id" />
			<input type="hidden" value="null" name="update_date" /> 
				<table class="table table-hover">
				<tr>
				<td>파일</td>
				<td>
				<input  class="form-control" style="width:400px !important; float: left;" value="${view.banner_filename }" id="searchForm2" disabled="disabled" />
				<label for="file_up[0]" class="btn btn-info" style="margin-bottom: 0px; margin-left: 10px; float: left;">파일 수정</label>
				<input class="upload-hidden" type="file" name="uploadfile[0]" required="required" id="file_up[0]" style="display: none;" />
				</td>
				</tr>
				<tr>
				<td>상세정보</td>
				<td><input type="text"  class="form-control" value="${view.banner_ex }" name="banner_ex" /></td>
				</tr>
				<tr>
				<td>연결 url</td>
				<td><input type="text"  class="form-control" value="${view.banner_url }" name="banner_url" /></td>
				</tr>
				<tr>
				<td>시작일</td>
				<td><input type="text"  class="form-control" value="${view.banner_start_date }" name="banner_start_date" id="start_date" /></td>
				</tr>
				<tr>
				<td>종료일</td>
				<td><input type="text"  class="form-control" value="${view.banner_last_date }" name="banner_last_date" id="last_date" /></td>
				</tr> 
				</table>
				
				<input type="hidden" id="fName" name="fName" value="${view.banner_filename }" />
				<input type="hidden" name="flag" id="flag" value="C" />

		</form>
		<a class="btn btn-info" href="javascript:history.back();">뒤로가기</a>
		<c:if test="${sessionScope.admin_id eq 'bpfcadmin' || sessionScope.admin_id eq 'interlink'}">
		<a class="btn btn-info" onclick="banner_add_bt1()">확인</a>
		</c:if>
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var fileTarget = $('.upload-hidden');
					fileTarget.on('change', function() { // 값이 변경되면 
						if (window.FileReader) { // modern browser 
							var filename = $(this)[0].files[0].name;
						} else { // old IE 
							var filename = $(this).val().split('/').pop()
									.split('\\').pop(); // 파일명만 추출 
						} // 추출한 파일명 삽입

						$(this).siblings('#searchForm2').val(filename);
						$("#flag").val("D");
					});
					//datePicker
					$('#last_date').datepicker({
						dateFormat : 'yyyy-mm-dd',
						language : 'en',
						/* 날짜클릭이벤트 */
					    onSelect: function(){
					    	$('#last_date').datepicker("hide");
					    	$('#last_date').blur();
						}
					});
					$('#start_date').datepicker({
						dateFormat : 'yyyy-mm-dd',
						language : 'en',
						/* 날짜클릭이벤트 */
					    onSelect: function(){
					    	$('#start_date').datepicker("hide");
					    	$('#start_date').blur();
						}
					});
					
				});
	</script>
</body>
</html>