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
	$(document)
			.ready(
					function() {
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
						$(".re_en").val("${re.re_en}").attr("selected", "selected");
						$(".employment").val("${re.employment}").attr("selected", "selected");
						$(".place").val("${re.place}").attr("selected", "selected");
						var c = $("#favorable").val();
						var n = c.indexOf("|"); // , 있는지 체크  1=있을때 -1=없을때
						var arr = c.split("|");
						var cont = $("#fa_rt input").length - 1;

						if (n = 1) {
							for (var g = 1; g <= cont; g++) {
								$("#fa_rt br").remove();
								$('#favorable' + g + '').remove();
							}
						}

						/* 배열일때 input 증가후 배열로 나열 */
						if (n = -1) {
							$('#favorable').val(arr[0]);
							console.log(arr[0]);
							for (var h = 1; h <= arr.length - 2; h++) {
								$("#fa_rt")
										.append(
												"<br><input class='searchForm' type='text' id='favorable" + h + "' value='" + arr[h] + "'>");
							}
						}
					    var fileTarget = $('.addtable .upload-hidden'); 
					    fileTarget.on('change', function(){ // 값이 변경되면 
					    	if(window.FileReader){ // modern browser 
					    		var filename = $(this)[0].files[0].name; 
					    	} else { // old IE 
					    		var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
					    		} // 추출한 파일명 삽입
					    		$(this).siblings('.searchForm2').val(filename);
					    		$("#flag").val("D");
					});
    });
</script>
<title>채용관리</title>
</head>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<jsp:include page="recruit_left_bar.jsp"></jsp:include>
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
	<h1>${re.title }수정페이지</h1>
	<br>
	<form name="write_update_ac" action="write_update_ac.do" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${re.all_no }" name="all_no" />
		<table class="table table-hover">
			<tr>
				<td class="table-warning" style="width: 200px;">제목</td>
				<td colspan="2"><input class="searchForm" type="text" style="width: 100%"
					value="${re.title }" name="title"></td>
			</tr>
			<tr>
				<td rowspan="1" class="table-warning">상태</td>
				<td><select id="sch_type" class="chec_select" name="chec"><option value="1">모집중</option>
						<option value="2">마감</option></select></td>
			</tr>
			<tr>
				<td rowspan="3" class="table-warning">모집분야</td>
				<td class="table-info" style="width: 200px;">모집분야</td>
				<td><input class="searchForm" type="text" value="${re.re_en }" name="re_en"></td>
			<tr>
				<td class="table-info">채용인원</td>
				<td><input class="searchForm" type="text" value="${re.no }" name="no" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" id="re_num">
				<input class="btn btn-info" type="button" value="▲" onclick="up()">
				<input class="btn btn-info" type="button" value="▼" onclick="down()">
				</td>
			</tr>
			<tr>
				<td class="table-info">우대조건</td>
				<td id="fa_rt"><input class="searchForm" type="text" value="${re.favorable }"
					name="favorable" id="favorable"> <input class="btn btn-info" type="button"
					value="+" onclick="write_favorable_add()"></td>
			</tr>
			<tr>
				<td rowspan="4" class="table-warning">근무개요</td>
				<td class="table-info">채용조건</td>
				<td><select name="employment" id="sch_type" class="employment">
						<option value="무관">무관</option>
						<option value="신입">신입</option>
						<option value="경력">경력</option >
						<option value="단순계약직">단순계약직</option>
				</select></td>
			</tr>
			<tr>
				<td class="table-info">근무조건</td>
				<td><input class="searchForm" type="text" value="${re.cond }" name="cond"></td>
			</tr>
			<tr>
				<td class="table-info">근무지</td>
				<td><input class="searchForm" type="text" value="${re.place }" name="place"></td>
			</tr>
			<tr>
				<td class="table-info">급여수준</td>
				<td><input class="searchForm" type="text" value="${re.salary }" name="salary"></td>
			</tr>
			<tr>
				<td rowspan="4" class="table-warning">전형방법</td>
				<td class="table-info">접수기간</td>
				<td><input class="searchForm" type="text" value="${re.period }" name="period" id="period_end"></td>
			</tr>
			<tr>
				<td class="table-info">접수방법</td>
				<td><input class="searchForm" type="text" value="${re.way }" name="way"></td>
			</tr>
			<tr>
				<td class="table-info">채용일자</td>
				<td><input class="searchForm" type="text" value="${re.date }" name="date"></td>
			</tr>
			<tr>
				<td colspan="2"><input class="searchForm" type="text" value="${re.etc }"
					style="width: 100%" id="etc"></td>
			</tr>
			<tr>
				<td class="table-warning">첨부파일</td>
				<td colspan="2" id="addtd" class="addtable">
				<input class="searchForm2" value="${re.file }" disabled="disabled" >
					<label for="file_up[0]" class="btn btn-info" style="margin-bottom: 0px;">파일 수정</label>
					<input class="upload-hidden" type="file" name="uploadfile[0]" required="required" id="file_up[0]" style="display: none;" /></td>
			</tr>
			<tr>
				<td colspan="3">
				<a class="btn btn-info" onclick="back_bt();" style="color: white;">뒤로가기</a>
				<input class="btn btn-info" type="button" value="수정등록" onclick="re_write_update_bt()"></td>
			</tr>
		</table>
			<input type="hidden" id="fName" name="fName" value="${re.file2}">
			<input type="hidden"  name="flag" id="flag" value="C" />
	</form>
	</div>
</body>
</html>