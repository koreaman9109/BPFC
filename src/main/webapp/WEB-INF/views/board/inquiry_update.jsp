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
<title>문의사항 수정</title>
<script type="text/javascript">

$(document).ready(function(){
    
    CKEDITOR.replace( 'content' );
    CKEDITOR.config.height = 500;
     
    $("#list").click(function() {
		if (confirm("목록으로 돌아가시겠습니까? 작성중인 내용은 저장되지 않습니다.") == true){
		location.href = "inquiry_list.do?board_id=" + $("#board_id").val();
	}else{
		return;
		}
			});
     
/*       $("#btnSave").click(function(){
         
        //에디터 내용 가져옴
        var content = CKEDITOR.instances.content.getData();
        
       
         
         
    });  */
     
});
//이중폼 보내는 방법
function detailSubmit(index) {
	    if (index == 1) {
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
				document.listForm.action='inquiryBoardUpdate.do';

				

						alert("수정 되었습니다.");
						
				}else{
					alert("취소 되었습니다.");
					location.href = "inquiry_list.do?board_id=" + $("#board_id").val();
				}	
	    }
	    if (index == 2) {
	      document.listForm.action='#';
	    }
	    document.listForm.submit();
	  };
	  
		function delFile(idx){

			/* var qqqq = $('#flist_' + idx);
			alert(qqqq);
			for (i = 0; i < 1; i++) {
				 */
			var obj = $('#flist_' + idx);
			var fileIndex = $('#test').children().length+1;
			//alert($(obj).find('#flag').val());
			var ii = $('#flag').val();
			if(ii == "C"){
				
				$('#add_1').append(
						'<tr><td>'+
						'<input style="width: 100%; border: none;" type="file" class="a" name="uploadfile[0]" id="file_up[0]" />' +
						'</td></tr>'
						);
			}else if (ii != "C"){
				$('#add_1').append(
						'<tr><td>'+
						'<input style="width: 100%; border: none;" type="file" class="a" name="uploadfile[1]" id="file_up[1]" />' +
						'</td></tr>'
						);
			}
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
		<input type="hidden" name="top_seq" id="top_seq" value="${board_detail.top_seq}" />
		<input type="hidden" id="board_id" name="board_id" value="${board_id}" />
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">


       			<h1>문의사항</h1>

		<br>
			<table class="table table-hover">

				<tr>
					<td class="table-info">
						작성자
					</td>
					<td colspan="1">
						 <input type="text"
						id="admin_id" name="admin_id" style="width: 100%; border: none;" maxlength="10" readonly="readonly"
						placeholder="작성자" value="${board_detail.admin_id}" />
						<input type="hidden" id="board_id" name="board_id"
						style="width: 400px;" placeholder="게시판번호"
						value="5" />
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
						제목</td>
						<td>
						 <input type="text" id="title" name="title"
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
					<tr style="margin: 0;">
					<td colspan="2" style="width: 900px">
					<h3>※총 1개 파일 업로드 가능</h3>
					</td>
								</tr>
				<c:choose>
						<c:when test="${fn:length(file_list) == 0}">												
							</tr>
								<tr>
								<td>
									<input style="width: 100%; border: none;" type="file" name="uploadfile[0]" required="required" id="file_up[0]" style="width: 100%;" />
								</td>
								</tr>
						</c:when>
						<c:otherwise>		
							<c:forEach var="file_list" items="${file_list}"  varStatus="status">
							<tr id="flist_${status.count}">
								    <c:if test="${file_list.use_yn eq 'Y' }">
								 <td>
									<button class="btn btn-primary" type="button" id="downBtn" onclick="delFile('${status.count}');">삭제</button>
									<input style="border: 0; width: 500px;" type="text" id="fName" name="fName" value="${file_list.file_name}">
									<input type="hidden" name="file_key" id="file_key" value="${file_list.file_key}" />
									<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
									<input type="hidden"  name="flag" id="flag" value="C" />
								</td>
									</c:if>
								
							
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<tbody id="add_1">
					</tbody>
				<tr>
					<td align="left">
					<button type="button" class="btn btn-primary" id="list" name="list">목록</button>
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