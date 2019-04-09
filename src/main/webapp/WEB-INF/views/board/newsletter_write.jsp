<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/board.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BPFC 소식지 작성</title>
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

	$(document).ready(function() {
		$("#btnSave").click(function() {
			//var title = document.form1.title.value; ==> name속성으로 처리할 경우
			//var content = document.form1.content.value;
			//var writer = document.form1.writer.value;
			if (confirm("저장하시겠습니까? ") == true) {

				var content = CKEDITOR.instances.content.getData();
				 if (form1.title.value == "") {
			            alert("제목을 입력하지 않았습니다.")
			            form1.title.focus()
			            return false;
			        }

				// 폼에 입력한 데이터를 서버로 전송
				document.form1.submit();

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
		<div class="left" style="height: 100%;"><jsp:include
				page="../board/board_submenu.jsp"></jsp:include></div>
				<!-- <div class="right"><h1>센터소식 페이지</h1></div>  -->
			<%-- <input style="width: 100%;" type="hidden" id="board_id" name="board_id" value="${board_id}" /> --%>
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
				<h1>BPFC 소식지</h1>
   		<br>
			<form name="form1" method="post" action="newsletter_insert.do" enctype="multipart/form-data">
				<table class="table table-hover">

					<tr>
						<td class="table-info">작성자</td>
						<td colspan="1"> 
						<input type="text" style="width: 100%; border: none;" id="admin_id" name="admin_id"
						maxlength="10"  readonly="readonly" 
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
						<td class="table-info">제목</td> 
						<td><input type="text" style="width: 100%;" name="title" id="title"/>
						</td>
					</tr>
				</table>
				<table class="table table-hover">
					<tr>
						<td><textarea name="content" id="content" rows="10" cols="50"></textarea>
						</td>
					</tr>
				</table>	
				<table class="table table-hover">
					<tr>
					<td colspan="2" style="width: 900px">
					<h3>※반드시 썸네일이미지( img파일1개 ) 와 사보 ( pdf파일1개 )를 올려주세요. 
					<!-- <br>
					※썸네일이미지는 가로 : 284px, 세로 : 344px로 맞춰주세요. -->
					</h3>
					</td>
					</tr>
					<tr>
					<td class="table-info" width="235px">
						썸네일 이미지
					</td>
					<td colspan="1" id="addtd" class="addtable">
						<input type="file" name="uploadfile[0]" style="width: 100%;" required="required" id="file_up[0]" accept="image/gif, image/jpeg, image/png, image/bmp"/>
					</td>
					</tr>
					<tr>
					<td class="table-info">
						사보파일(PDF)
					</td>
					<td colspan="1" id="addtd" class="addtable">
						<input type="file" name="uploadfile[1]" style="width: 100%;" required="required" id="file_up[1]" accept=".pdf"/>
					</td>
					</tr>					
				</table>
			</form>
			<br>

			<table style="width: 900px;">
				<tr>
					<td align="left">
						<button class="btn btn-primary" id="list" name="list">목록</button>

					</td>
					<td align="right">
						<button class="btn btn-primary" id="btnSave" name="btnSave">저장</button>
					</td>
				</tr>
			</table>
			<br><br><br>
		</div>
	</div>

</body>
</html>