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
<script src="js/recruit/recruit.js"></script>
<title>채용관리</title>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var j = $("#favorable_update_val").val();
						var n = j.indexOf("|");

						if (n = 1) {
							$("#favorable_update_val").val(j);
						}

						if (n = -1) {
							var arr = j.split("|");
							$("#favorable_update_val").val(arr[0]);
							for (var i = 1; i <= arr.length - 2; i++) {
								$("#fccc")
										.append(
												"<br><input class='searchForm' type='text' value='"+arr[i]+"' id='favorable_update_val"+i+"'>");
								console.log(arr[i]);
							}
						}
					});
</script>
<style type="text/css">
input {
	border: none;
}
</style>
</head>
<body>
	<br>
	<h1 align="center">${add.re_en } 수정</h1>
	<br>
	<form name="add_update_re" action="add_update_re.do" method="post">
		<input type="hidden" value="${add.re_en_no }" name="re_en_no" />
		<table class="table table-hover" style="width: 400px !important;">
			<tr>
				<td class="table-info">모집분야</td>
				<td><input class="searchForm" type="text" value="${add.re_en }" name="re_en" /></td>
			</tr>
			<tr>
				<td class="table-info">우대조건</td>
				<td id="fccc" class="favorable_rd"><input class="searchForm" type="text" value="${add.favorable }"
					name="favorable" id="favorable_update_val" /><input class="btn btn-info" type="button"
					value="+" onclick="favorable_add1()"></td>
			</tr>
			<tr>
				<td class="table-info">근무조건</td>
				<td><input class="searchForm" type="text" value="${add.cond }" name="cond" /></td>
			</tr>
			<tr>
				<td class="table-info">급여수준</td>
				<td><input class="searchForm" type="text" value="${add.salary }" name="salary" /></td>
			</tr>
		</table>
		<input type="hidden" value="${add.re_en_no}" id="re_en_no_hidden" />
		<a class="btn btn-info" href="javascript:history.back();">뒤로가기</a> <input class="btn btn-info" type="button"
			value="수정" onclick="re_en_add_update_but()" />
	</form>
</body>
</html>