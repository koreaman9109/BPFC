<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/board.css" rel="stylesheet">
<script src="js/board/inquiry.js"></script>
<title>분실물안내 작성</title>
<script type="text/javascript">
	$(document).ready(function() {

		CKEDITOR.replace('content');
		CKEDITOR.config.height = 500;

		$("#list").click(function() {
			if (confirm("목록으로 돌아가시겠습니까? 작성중인 내용은 저장되지 않습니다.") == true) {
				javascript: history.back();
			} else {
				return;
			}
		});

	});
	/* 파일추가버튼 */
	function addbt() {
		var fileIndex = $('.addtable tr').children().length+1;
		$('#addtd').append(
				'<tr><td colspan="2">' + '   <input type="file" name="uploadfile['
						+ fileIndex + ']" id="file_up["' + fileIndex + '] />' + '</td></tr>');
	};
</script>

</head>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<div>
		<div class="left" style="height: 100%;">
		<jsp:include page="../board/lost_submenu.jsp"></jsp:include></div>
		<!--  	<div class="right"><h1>센터소식 페이지</h1></div> -->
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
       			<h1>분실물안내</h1>
		<br>
			<form name="lost_insert" method="post" action="lost_insert.do"
				enctype="multipart/form-data">
				<table class="table table-hover" style="margin-bottom: 0;">

					<tr>
						<td class="table-info">ID</td>
						<td colspan="1"> 
						<input type="text" style="width: 100%; border: none;" id="admin_id" name="admin_id" readonly="readonly"
						maxlength="10" placeholder="작성자"
						value="${sessionScope.admin_id}"/> 
						<input style="width: 100%;" type="hidden" id="board_id" name="board_id" value="${board_id}" />
						<input style="width: 100%;" type="hidden" id="admin_name" name="admin_name" value="${sessionScope.admin_name}" />
						<input style="width: 100%;" type="hidden" id="admin_rank" name="admin_rank" value="${sessionScope.admin_rank}" />
						<input style="width: 100%;" type="hidden" id="admin_task" name="admin_task" value="${sessionScope.admin_task}" />
						<input style="width: 100%;" type="hidden" id="admin_email" name="admin_email" value="${sessionScope.admin_email}" />
						<input style="width: 100%;" type="hidden" id="admin_department" name="admin_department" value="${sessionScope.admin_department}" />
						<input style="width: 100%;" type="hidden" id="admin_nickname" name="admin_nickname" value="${sessionScope.admin_nickname}" />
						</td>
					</tr>
					<tr>
						<td class="table-info">작성자</td>
						<td>
						<c:if test="${view_name eq '1'}"> 
						<input type="text" style="width: 100%; border:none; " id="view_name" name="view_name" readonly="readonly"
						maxlength="10" 
						value="${sessionScope.admin_name}"/>
						</c:if>
						
						<c:if test="${view_name eq '3'}"> 
						<input type="text" style="width: 100%; border:none; " id="view_name" name="view_name" readonly="readonly"
						maxlength="10" 
						value="${sessionScope.admin_nickname}"/>
						</c:if>
						
						<c:if test="${view_name eq '2'}"> 
						<input type="text" style="width: 100%; border:none; " id="view_name" name="view_name" readonly="readonly"
						maxlength="10" 
						value="${sessionScope.admin_department}"/>
						</c:if>    
						<input style="width: 100%;" type="hidden" id="board_id" name="board_id" value="${board_id}" />
						
						</td>
					</tr>
					<tr>
						<td class="table-info">습득장소</td> 
						<td><input type="text" style="width: 100%;"  name="organization" id="lost_organization" />
						</td>
					</tr>
					<tr>
						<td class="table-info">습득경위</td> 
						<td><input type="text" style="width: 100%;" name="learn" id="lost_learn" />
						</td>
					</tr>
					<tr>
						<td class="table-info">습득물</td> 
						<td><input type="text" style="width: 100%;"  name="title" id="lost_title" />
						</td>
					</tr>
					<tr>
						<td class="table-info">습득일</td> 
						<td><input type="text" style="width: 100%;" name="lost_date" id="lost_date" placeholder="ex)2018-01-01"/>
						</td>
					</tr>
					<tr>
						<td class="table-info">담당자</td> 
						<td><input type="text" style="width: 100%;" name="lost_name" id="lost_name" />
						</td>
					</tr>
					<tr>
					<td class="table-info">연락처</td> 
						<td><input type="text" style="width: 100%;" name="contact" id="lost_contact" />
						</td>
					</tr>
					<tr>
						<td class="table-info">보관장소</td> 
						<td><input type="text" style="width: 100%;"  name="storage_site" id="lost_storage_site" />
						</td>
					</tr>
					<tr>
						<td class="table-info">처리상태</td> 
						<td><input type="text" style="width: 100%;" name="lost_status" id="lost_status" />
						</td>
					</tr>
				</table>
				<table class="table table-hover">
					<tr>
						<td><textarea name="content" id="content" rows="10" cols="50">(***********)을 보관중입니다.<br>

이미지 확인하시고 신분증 지참하시어 (***********)로 방문수령해주세요</textarea>
						</td>
					</tr>
				</table>	
				<table class="table table-hover">
					<tr>
					
					<td class="table-info">분실물 이미지</td>
					 <td colspan="1" id="addtd" class="addtable">
						<input type="file" name="uploadfile[0]" style="width: 100%;" required="required" id="file_up[0]" accept="image/gif, image/jpeg, image/png, image/bmp"/>
					</td>
					</tr>
				</table>
			</form>
			<br>

			<table class="table table-hover">
				<tr>
					<td align="left">
						<button class="btn btn-primary" id="list" name="list">목록</button>

					</td>
					<td align="right">
						<!-- <button class="btn btn-primary" id="btnSave" name="btnSave">저장</button> -->
						<input type="button" value="저장" class="btn btn-primary" id="btnSave" onclick="lost_send_bt(1)" />
					</td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>