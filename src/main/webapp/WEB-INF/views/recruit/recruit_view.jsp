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
<script type="text/javascript">
	$(document).ready(function() {
		var j = $("#hi_favo").val();
		var n = j.indexOf("|");

		if (n = -1) {
			var arr = j.split("|");
			for (var i = 0; i <= arr.length - 2; i++) {
				$("#view_fa").append("* " + arr[i] + "<br>");
			}
		}
		var k = $("#etc").val();
		if(k=1) $("#etc_text").append("*서류전형 합격자에 한해 면접 시간 및 장소 개별통보");
	});
</script>
<title>채용관리</title>
</head>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<jsp:include page="recruit_left_bar.jsp"></jsp:include>
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
	<h1>${re.title }</h1>

	<input type="hidden" value="${re.favorable }" id="hi_favo">
	<table class="table table-hover">
		<tr>
			<td class="table-warning" style="width: 200px;">제목</td>
			<td colspan="2">${re.title }</td>
		</tr>
		<tr>
			<td rowspan="3" class="table-warning">모집분야</td>
			<td class="table-info" style="width: 200px;">모집분야</td>
			<td>${re.re_en }</td>
		<tr>
			<td class="table-info">채용인원</td>
			<td>${re.no }명</td>
		</tr>
		<tr>
			<td class="table-info">우대조건</td>
			<td id="view_fa"></td>
		</tr>
		<tr>
			<td rowspan="4" class="table-warning">근무개요</td>
			<td class="table-info">채용조건</td>
			<td>
			<c:set var="employment" value="${re.employment }" />
			<c:if test="${employment eq '1' }">
			신입
			</c:if> <c:if test="${employment eq '2' }">
			경력
			</c:if>
			<c:if test="${employment ne '1' and employment ne '2' }">${re.employment }
			</c:if>
			</td>
		</tr>
		<tr>
			<td class="table-info">근무조건</td>
			<td>${re.cond }</td>
		</tr>
		<tr>
			<td class="table-info">근무지</td>
			<td>${re.place }</td>
		</tr>
		<tr>
			<td class="table-info">급여수준</td>
			<td>${re.salary }</td>
		</tr>
		<tr>
			<td rowspan="4" class="table-warning">전형방법</td>
			<td class="table-info">접수기간</td>
			<td>${re.period }</td>
		</tr>
		<tr>
			<td class="table-info">접수방법</td>
			<td>${re.way }</td>
		</tr>
		<tr>
			<td class="table-info">채용일자</td>
			<td>${re.date }</td>
		</tr>
		<tr>
			<td colspan="2"><a id="etc_text"></a></td>
		</tr>
		<tr>
			<td class="table-warning">첨부파일</td>
			<td colspan="2">
			<a id="z" style="cursor:pointer">${re.file }</a></td>
		</tr>
	</table>
		<input type="hidden" value="${re.file2 }" id="file2" />
		<input type="hidden" value="${re.etc }" id="etc" />
	<hr>
	<a class="btn btn-info" onclick="back_bt();" style="color: white;">뒤로가기</a>
	<!--
	일자 : 2018-06-14 16:18
	내용 : 권한추가
	이름 : 박권수
	-->
	<c:if test="${auth eq '1'}">
	<a class="btn btn-info" href="recruit_write_update.do?all_no=${re.all_no }">수정</a>
	</c:if>
	<!--===============================================================================  -->
	</div>
	<br>
</body>
<script type="text/javascript">
$("#z").on("click", function(){
	var i = $("#file2").val();
	location.href="filedown.do?filename="+encodeURI(i);
});
</script>
</html>