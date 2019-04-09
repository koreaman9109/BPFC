<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%@ include file="../include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/board.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴지통 본문</title>
<script type="text/javascript">


	
	$(document)
			.ready(
					function() {

						
 						//목록으로 가기
						
						$("#list").click(function() {
							
							location.href = "del_list.do?board_id=" + $("#board_id").val();
						}); 
					});
	
	function downFile(fileName){
		location.href="delFileDown.do?file_name="+encodeURI(fileName) + "&board_id=" + $("#board_id").val();
	}
	
	
	//이중폼 보내는 방법
	 function detailSubmit(index) {
		 if (index == 1) {
		    	if(confirm("휴지통에 저장된 게시물 및 파일을 완전히 삭제하시겠습니까?") == true){
				if(confirm("휴지통에서 삭제된 게시물 및 파일은 다시 복구 할 수 없습니다. 그래도 삭제 하시겠습니까?") == true) {
			           document.listForm.action='boardDelListDelete.do';
						  alert("삭제 되었습니다.");
			             }else{
			        	  alert("취소 되었습니다.");
			            return;
			             }
							
						}else{
							alert("취소 되었습니다.");
							return;
						}	

		    
		    }
		    if (index == 2) {
				if(confirm("삭제된 게시물을 복구 하시겠습니까?") == true) {
					if(confirm("휴지통에서 복구된 게시물 및 파일은 수정한 파일까지 모두 복구됩니다. 그래도 복구 하시겠습니까?") == true) {
			           document.listForm.action='boardDelListRestore.do';
						alert("복구 되었습니다.");
			          }else{
			        	alert("취소 되었습니다.");
			            return;
			             }
						}else{
						alert("취소 되었습니다.");
						return;
					}		
				 }
		    document.listForm.submit();
		  };
	
</script>
</head>
<style>
textarea {
	width: 100%;
}

.reply_reply {
	border: 2px solid #FF50CF;
}
</style>

<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	
		<div class="left" style="height: 100%;"><jsp:include page="../setting_submenu.jsp"></jsp:include></div>
		<form name="listForm"  method="get">
		<input type="hidden" id="seq_id" name="seq_id" value="${board_detail.seq_id}" />
		<input type="hidden" id="file_key" name="file_key" value="${file_list}" />
		<input type="hidden" id="board_id" name="board_id" value="${board_detail.board_id}" />
		</form>
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		
		
        		<h1>휴지통</h1>
    		
		
		<br>
			<table border="0" class="table table-hover" style="margin-bottom: 0;">

				<tr>
					<td class="table-info" colspan="1" width="100px">제목</td>
					<td>&ensp;${board_detail.title}</td>
				</tr>
				<tr>
					<td class="table-info">작성자</td>
					<td>&ensp;${board_detail.update_id}</td>
					</tr>
					<tr>
					<td class="table-info">작성일자</td>
					<td>&ensp;${board_detail.register_date}</td>
					</tr>
					<tr>
					<td class="table-info">조회수</td>
					<td>&ensp;${board_detail.hit}</td>
					</tr> 
					<tr height="200px">
					<td class="table-info">내용</td>
					<td valign="top">

					<br>
					${board_detail.content}
					</td>
					</tr>
			</table>
			</div>
			<div align="center" style=" padding-left: 200px; width: auto;">
			<table border="0" class="table table-hover">
					<c:choose>
						<c:when test="${fn:length(file_list) == 0}">												
							<tr>
								<td class="table-info" colspan="1" width="100px">첨부파일</td>
								<td colspan="2" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>		
							<tr>
								 <td class="table-info" width="100px">첨부파일</td>
								 <td align="left" colspan="2">
								 <c:forEach var="file_list" items="${file_list}"  varStatus="status">
								 <c:if test="${file_list.use_yn eq 'N' }">
									<button class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${file_list.file_name2}');">다운로드</button>	
									<input  style="width: 600px; border:0;" type="text" id="view_fa" value="${file_list.file_name}"><br>
								</c:if>
								</c:forEach>
								</td>
							</tr>
							
						</c:otherwise>
					</c:choose>
					
			</table>
			</div>
					

			 
			<br>
			<div align="center" style=" padding-left: 200px; width: auto;">
			<table class="table table-hover">
				<tr>
					<td align="left">
						<button  class="btn btn-primary" id="list" name="list">목록</button>
					</td>
					<td>
					<td colspan="2" align="right">
						<button class="btn btn-primary" id="delete" name="delete" onclick="detailSubmit(1)">게시물 삭제</button>
		        		<button class="btn btn-primary" id="modify" name="modify" onclick="detailSubmit(2)">게시물 복구</button>
					</td>
			
				</tr>
			</table>
			</div>
			<div align="center">
				<table width="800px">
			<tr>
			<td align="left">
<!-- 			<button id="preBtn" name="preBtn">이전글</button>
			<button id="afterBtn" name="afterBtn">다음글</button> -->
			</td>
			</tr>
			</table>
			</div>

</body>
</html>