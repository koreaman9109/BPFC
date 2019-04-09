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
/* DOM */
$(document).ready(function(){
    var fileTarget = $('.addtable .upload-hidden'); 
    fileTarget.on('change', function(){ // 값이 변경되면
    	if(window.FileReader){ // modern browser
    		var filename = $(this)[0].files[0].name;
    	} else { // old IE
    		var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
    		} // 추출한 파일명 삽입
    		$(this).siblings('.searchForm2').val(filename);
    });
    $('#period_end').datepicker({
	    language: 'en',
	    /* 날짜클릭이벤트 */
	    onSelect: function(){
	    	$('#period_end').datepicker("hide");
	    	$('#period_end').blur();
		}
	});
    $('#date').datepicker({
	    language: 'en',
	    /* 날짜클릭이벤트 */
	    onSelect: function(){
	    	$('#date').datepicker("hide");
	    	$('#date').blur();
		}
	});
});
function addbt() {
	var fileIndex = $('.addtable tr').children().length+1;
	$('#addtd').append(
			'<tr><td colspan="2" id="addtd" class="addtable">' 
			+ '<input class="searchForm2" value="파일선택" disabled="disabled" >'
			+ '<label for="file_up[' + fileIndex + ']" class="btn btn-info" style="margin-bottom: 0px;">파일 업로드</label>'
			+ '<input class="upload-hidden" type="file" name="uploadfile[' + fileIndex + ']" id="file_up[' + fileIndex + ']" style="display: none;"/>' 
			+ '</td></tr>');
};
</script>
<title>채용관리</title>
</head>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<jsp:include page="recruit_left_bar.jsp"></jsp:include>
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
	<input style="width: 100%;" type="hidden" id="board_id" name="board_id" value="${board_id}" />
	<h1>채용공고 등록</h1>	
	<br>
	<form name="recruit_enrollment" action="recruit_enrollment.do"
		method="post" enctype="multipart/form-data">
		<c:if test="${not empty msg }">
			<span class="err">${msg}</span>
		</c:if>
		<input type="hidden" name="etc" value="1" id="etcdb" /> <input
			type="hidden" name="chec" value="1" id="chec" />
			<input type="hidden" name="check_no" value="1" />
		<table class="table table-hover">
			<tr>
				<td class="table-warning" style="width: 200px;">제목</td>
				<td colspan="2">
					<input class="searchForm" id="titleForm" type="text" placeholder="제목을 입력해주세요" style="width: 100%" value="" name="title" />
				</td>
			</tr>
			<tr>
				<td rowspan="3" class="table-warning">모집분야</td>
				<td class="table-info" style="width: 200px;">모집분야</td>
				<td><select name="re_en" id="sch_type" onchange="javascript:change_re_en(this);">
						<option>선택</option>
						<c:forEach var="reList" items="${reList }" varStatus="status">
							<option value="${reList.re_en }">${reList.re_en }</option>
						</c:forEach>
				</select>  <input class="btn btn-info" type="button" value="등록" onclick="showPopup()" /></td>
			<tr>
				<td class="table-info">채용인원</td>
				<td>
					<input class="searchForm" type="text" value="1" name="no" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" id="re_num" />
					<input class="btn btn-info" type="button" value="▲" onclick="up()" />
					<input class="btn btn-info" type="button" value="▼" onclick="down()" />
				</td>
			</tr>
			<tr>
				<td class="table-info">우대조건</td>
				<td id="fa_rt"><input class="searchForm" type="text" placeholder="우대조건" value="" name="favorable"
					id="favorable" /> <input class="btn btn-info" type="button" value="+"
					onclick="write_favorable_add()" /></td>
			</tr>
			<tr>
				<td rowspan="4" class="table-warning">근무개요</td>
				<td class="table-info">채용조건</td>
				<td><select name="employment" id="sch_type">
						<option value="무관">무관</option>
						<option value="신입">신입</option>
						<option value="경력">경력</option>
						<option value="단순계약직">단순계약직</option>
				</select></td>
			</tr>
			<tr>
				<td class="table-info">근무조건</td>
				<td><input class="searchForm" type="text" value="" placeholder="ex)주5일근무" name="cond" /></td>
			</tr>
			<tr>
				<td class="table-info">근무지</td>
				<td><select id="sch_type" name="place"
					onchange="change_place_select();">
						<option>선택</option>
						<c:forEach var="plList" items="${plList}" varStatus="status">
							<option>${plList.place }</option>
						</c:forEach>
				</select>  <input class="btn btn-info" type="button" value="등록" onclick="place_add()" /></td>
			</tr>
			<tr>
				<td class="table-info">급여수준</td>
				<td><input class="searchForm" type="text" placeholder="ex)협의, 연2400"value="" name="salary" /></td>
			</tr>
			<tr>
				<td rowspan="4" class="table-warning">전형방법</td>
				<td class="table-info">접수기간</td>
				<td> ~ <input class="searchForm" type="text" placeholder="YYYY/MM/DD" value="" name="period" id="period_end" /></td>
			</tr>
			<tr>
				<td class="table-info">접수방법</td>
				<td><input class="searchForm" type="text" placeholder="ex)온라인지원" value="" name="way" /></td>
			</tr>
			<tr>
				<td class="table-info">채용일자</td>
				<td><input class="searchForm" type="text" placeholder="YYYY/MM/DD 까지" value="" name="date"/></td>
			</tr>
			<tr>
				<td colspan="2"><input class="searchForm" type="text" value="" style="width: 100%"
					id="etc" /></td>
			</tr>
			<tr>
				<td class="table-warning">첨부파일</td>
				<td colspan="2" id="addtd" class="addtable">
					<input class="searchForm2" id="sefileForm2" value="파일선택" disabled="disabled" >
					<label for="file_up[0]" class="btn btn-info" style="margin-bottom: 0px;">파일 업로드</label>
					<input class="upload-hidden" type="file" name="uploadfile[0]" required="required" id="file_up[0]" style="display: none;" />
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<a class="btn btn-info" onclick="back_bt();" style="color: white;">뒤로가기</a>
				<input class="btn btn-info" type="button" value="확인" onclick="recruit_enrollment_onclick()" />
			</tr>
		</table>
	</form>
	</div>
</body>
</html>