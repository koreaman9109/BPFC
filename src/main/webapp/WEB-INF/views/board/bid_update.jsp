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
<script src="js/recruit/recruit.js"></script>
<title>입찰안내 수정</title>
<script type="text/javascript">

$(document).ready(function(){
    
    CKEDITOR.replace( 'content' );
    CKEDITOR.config.height = 500;
     
    $("#list").click(function() {
		if (confirm("목록으로 돌아가시겠습니까? 작성중인 내용은 저장되지 않습니다.") == true){
		location.href = "bid_list.do?board_id=4";
	}else{
		return;
		}
			});

});
//이중폼 보내는 방법
function detailSubmit(index) {
			if(confirm("정말로 수정 하시겠습니까?")) {
				
				if (document.listForm.title.value == "") {
		            alert("제목을 입력해주세요.")
		            document.listForm.title.focus()

		            return false;

		        }
				if (CKEDITOR.instances.content.getData() == "") {
		            alert("내용을 입력해주세요.")
		            document.listForm.content.focus()

		            return false;

		        }	
		        
				// 폼에 입력한 데이터를 서버로 전송
				document.listForm.action='bidBoardUpdate.do';
											
				}else{
					alert("취소 되었습니다.");
					return;
					//location.href = "board_list.do?board_id=" + $("#board_id").val();
				}	

			document.listForm.submit();
	  };
		
	  /* 파일추가버튼 */
		function addbt() {
			var fileIndex = $('.addtable').children().length+1-1;
			$('#addtd').append(
					'<tr><td>' + '   <input style="width: 100%;"  type="file" name="uploadfile[' + fileIndex + ']" id="file_up[' + fileIndex + ']"  />' + '</td></tr>');
		};
	  
		function delFile(idx){
			var obj = $('#flist_' + idx);
			
			//alert($(obj).find('#flag').val());
			$(obj).find('#flag').val("D");
			$(obj).hide();
		}
		
        </script>

</head>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<div>
		<div class="left" style="height: 100%;"><jsp:include page="../board/board_submenu.jsp"></jsp:include></div>
		<form name="listForm"  method="post" enctype="multipart/form-data">
		<input type="hidden" id="seq_id" name="seq_id" value="${board_detail.seq_id}">
		<input type="hidden" id="board_id" name="board_id" value="${board_id}" />
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
       			<h1>입찰안내</h1>

		<br>
			<table class="table table-hover" style="margin-bottom: 0;">

				<tr>
					<td class="table-info">작성자</td>
					<td colspan="1">
						 <input type="text"
						id="admin_id" name="admin_id" style="width: 100%; border: none;" maxlength="10" readonly="readonly"
						placeholder="작성자" value="${board_detail.admin_id}" />
						<!-- <input type="hidden" id="board_id" name="board_id"
						style="width: 400px;" placeholder="게시판번호"
						value="1" /> -->
					</td>
				</tr>
				 <tr>
					<td class="table-info">작성자</td>
					<td colspan="1">
						 <input type="text" style="width: 100%; border: none; "
						id="admin_name" name="admin_name"  readonly="readonly" 
						 value="${board_detail.view_name}" />
						<!-- <input type="hidden" id="board_id" name="board_id"
						style="width: 400px;" placeholder="게시판번호"
						value="1" /> -->
					</td>
				</tr>
				<tr>	
					<td class="table-info">	 	 
						제목</td><td> <input type="text" id="title" name="title"
						style="width: 100%;" placeholder="제목을 입력해주세요" value="${board_detail.title}" />
					</td>
				</tr>
				</table>
								</div>
					
			<div align="center" style=" padding-left: 200px; width: auto;">
			<table class="table table-hover">
				<tr style="margin: 0;">
					<td>
						<textarea name="content" id="content" rows="10" cols="50">${board_detail.content}</textarea>
					</td>
				</tr>
				</table>
				</div>
				
				<div align="center" style=" padding-left: 200px; width: auto;">
				<table class="table table-hover">

					<c:choose>
						<c:when test="${fn:length(file_list) == 0}">												
							<tr>
							<td width="100%" align="left">첨부된 파일이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>		
							<c:forEach var="file_list" items="${file_list}"  varStatus="status">
							<tr id="flist_${status.count}">
								<c:if test="${file_list.use_yn eq 'Y'}">
								 <td>
									<input style="border: 0; width: 500px;" type="text" id="fName" name="fName" value="${file_list.file_name}">
									<button class="btn btn-primary" id="downBtn" onclick="delFile('${status.count}');">삭제</button>
									<input type="hidden" name="file_key" id="file_key" value="${file_list.file_key}" />
									<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
									<input type="hidden"  name="flag" id="flag" value="C" />
								</td>
								</c:if>
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
						<tbody class="addtable" id="addtd" >
						<tr>
							<td>
							<input  type="file" style="width: 100%;" name="uploadfile[0]" required="required" id="file_up[0]"/>
							</td>
							<td>
							<input class="btn btn-primary" type="button" value="파일 추가" onclick="addbt()" />
							</td>
						</tr>
						</tbody>
				<tr>
					<td align="left">
						<button class="btn btn-primary" id="list" name="list">목록</button>
						
					</td>
					<td align="right">
						<button class="btn btn-primary" id="btnSave" name="btnSave" onclick="detailSubmit(1)">저장</button>
					</td>
				</tr>
			</table>
			</div>
				</form>

			<div>
			<br>
			
				
				
		</div>
		
	</div>

</body>
</html>