<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%@ include file="../include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/board.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 본문</title>
<script type="text/javascript">


	
	$(document)
			.ready(
					function() {

						
 						//목록으로 가기
						
						$("#list").click(function() {
							
							location.href = "centernews_list.do?board_id=" + $("#board_id").val();
						}); 
				 
				

			
					

						//글수정
						$("#modify")
								.click(
										function() {
											if (confirm("수정 하시겠습니까??") == true){
											location.href = "centernewsBoardUpdateForm.do?board_id=" + $("#board_id").val() + "&seq_id=" + $("#seq_id").val();
											}else{
												return;
											}
													});
					
										
										

					});
	
	function downFile(fileName){
		location.href="centernewsFileDown.do?file_name="+encodeURI(fileName);
	}
	
	
	//이중폼 보내는 방법
	 function detailSubmit(index) {
		    if (index == 1) {
				if(confirm("정말로 삭제 하시겠습니까?")) {
					document.listForm.action='centernewsBoardDelete.do';
					

							alert("삭제 되었습니다.");
					}else{
						alert("취소 되었습니다.");
						location.href = "centernews_list.do?board_id=" + $("#board_id").val();
					}	
		    }
		    if (index == 2) {
		      document.listForm.action='#';
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
	
		<div class="left" style="height: 100%;"><jsp:include page="../board/board_submenu.jsp"></jsp:include></div>
		<!--  	<div class="right"><h1>센터소식 페이지</h1></div> -->
		<form name="listForm"  method="get">
		<input type="hidden" id="seq_id" name="seq_id" value="${board_detail.seq_id}" />
		<%-- <input type="hidden" id="file_key" name="file_key" value="${file_list}" /> --%>
		<input type="hidden" id="board_id" name="board_id" value="${board_detail.board_id}" />
		<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
		</form>
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		
		
        		<h1>공지사항</h1>
    		
		
		<br>
			<table border="0" class="table table-hover" style="margin-bottom: 0;">

				<tr>
					<td class="table-info" colspan="1" width="150px">제목</td>
					<td>&ensp;${board_detail.title}</td>
				</tr>
					<tr>
					<td class="table-info">ID</td>
					<td>&ensp;${board_detail.admin_id}</td>
					</tr>
					<tr>
					<td class="table-info">작성자</td>
					<td>&ensp;${board_detail.admin_name}</td>
					</tr>
					<tr>
					<td class="table-info">직급</td>
					<td>&ensp;${board_detail.admin_rank}</td>
					</tr>
					<tr>
					<td class="table-info">부서</td>
					<td>&ensp;${board_detail.admin_department}</td>
					</tr>
					<tr>
					<td class="table-info">email</td>
					<td>&ensp;${board_detail.admin_email}</td>
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
					<c:forEach var="file_list" items="${file_list}"  varStatus="status">
								<c:if test="${file_list.use_yn eq 'Y'}">
								<c:if test="${file_list.extention_name eq '.jpg'}">
								
									<img style="width: 700px; height: 400px; margin-left: auto; margin-right: auto; display: block;" src="resources/board/centernews/${file_list.file_name2}">
								</c:if>
								<c:if test="${file_list.extention_name eq '.png'}">
								
									<img style="width: 700px; height: 400px; margin-left: auto; margin-right: auto; display: block;" src="resources/board/centernews/${file_list.file_name2}">
								</c:if>
								<c:if test="${file_list.extention_name eq '.gif'}">
								
									<img style="width: 700px; height: 400px; margin-left: auto; margin-right: auto; display: block;" src="resources/board/centernews/${file_list.file_name2}">
								</c:if>
								<c:if test="${file_list.extention_name eq '.bmp'}">
								
									<img style="width: 700px; height: 400px; margin-left: auto; margin-right: auto; display: block;" src="resources/board/centernews/${file_list.file_name2}">
								</c:if>
								<c:if test="${file_list.extention_name eq '.tif'}">
								
									<img style="width: 700px; height: 400px; margin-left: auto; margin-right: auto; display: block;" src="resources/board/centernews/${file_list.file_name2}">
								</c:if>
								</c:if>
							</c:forEach>
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
								<td class="table-info" colspan="1" width="150px">첨부파일</td>
								<td colspan="2" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>		
							<tr>
								 <td class="table-info" width="150px">첨부파일</td>
								 <td align="left" colspan="2">
								 <c:forEach var="file_list" items="${file_list}"  varStatus="status">
								 <c:if test="${file_list.use_yn eq 'Y' }">
									<button class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${file_list.file_name2}');">다운로드</button>
									
									<input  style="width: 600px; border:0;" type="text" id="view_fa" value="${file_list.file_name}"><br>
									<%-- <input type="hidden" name="seq_id" id="seq_id" value="${file_list.seq_id}" /> --%>
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
						
					    		<c:if test="${auth eq '1'}">
					        		<button class="btn btn-primary" id="modify" name="modify">글 수정</button>
									<button class="btn btn-primary" id="delete" name="delete" onclick="detailSubmit(1)">글 삭제</button>
					    		</c:if>
							
						
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