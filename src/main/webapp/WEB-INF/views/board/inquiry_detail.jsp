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
<title>문의사항 본문</title>
<script type="text/javascript">

/* 	$(document).ready(function() {

						
 						//목록으로 가기
						
						$("#list").click(function() {
							
							location.href = "inquiry_list.do?board_id=" + $("#board_id").val();
						}); 		 																	

					});
	 */
	function downFile(fileName){
		location.href="inquiryUserFileDown.do?file_name="+encodeURI(fileName);
	}
	
	function downFile2(fileName){
		location.href="inquiryFileDown.do?file_name="+encodeURI(fileName);
	}
	//이중폼 보내는 방법
	 function detailSubmit(index) {
		    if (index == 1) {
		    }
		    if (index == 2) {
		    	if(confirm("답글을 작성하시겠습니까?")) {
		      		document.listForm.action='inquiry_write.do';
		      			
		    		}else{
						return;
	
		    }
		    }
		     document.listForm.submit(); 
		  };
		  
			   
		   /* 2018-10-04 답글 수정 */
		   function re_modify(seq_id) {
					if(confirm("정말로 수정 하시겠습니까?")) {
						
						var q = seq_id;
						document.getElementById("seq_id").value = q; //해당 seq_id 값으로 변환
						document.listForm.action='inquiryBoardUpdateForm.do?seq_id='+ q;
						}else{
							return;
							
						}	
					document.listForm.submit();
			  };
			   
		  /* 2018-10-04 답글 삭제 */
		   function re_delete(seq_id) {
					if(confirm("정말로 삭제 하시겠습니까?")) {
						
						var q = seq_id;
						document.getElementById("seq_id").value = q; //해당 seq_id 값으로 변환
						document.listForm.action='inquiryBoardDelete.do';
						alert("삭제 되었습니다.");
						}else{
							return;

						}	
					document.listForm.submit();
			  };
			  
			  /* 2018-10-04 원글 삭제  */
			  $(function(){
				  $("#ori_delete").click(function(){
					  var dynamicTag = 
					  	  '<c:forEach var="board_detail2" items="${board_detail2}"  varStatus="status">' +
						  '<input type="hidden" id="seq_id" name="seq_id" value="${board_detail2.seq_id}" />' +
						  '</c:forEach>' +
						  '<input type="hidden" id="useyn" name="useyn" value="N" />';   
					  $("#delete_seq").html(dynamicTag);
					  if(confirm("정말로 삭제 하시겠습니까?")) {
						  $('#listForm').attr('action','inquiryBoardDelete.do').submit();

					  }
					  }) 
					})

			 
			  
			  


		  

	
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
		<form id="listForm" name="listForm"  method="get">
		<input type="hidden" id="board_id" name="board_id" value="${board_detail.board_id}" />
		<div id="delete_seq">
		<input type="hidden" id="seq_id" name="seq_id" value="${board_detail.seq_id}" />
		<input type="hidden" id="useyn" name="useyn" value="${useyn.use_yn}" />
		</div>
		<input type="hidden" id="top_seq" name="top_seq" value="${board_detail.top_seq}" />
		<input type="hidden" id="step" name="step" value="${board_detail.step}" />
		<input type="hidden" id="flag" name="flag" value="R" />
		<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
		
		</form>
		<div>
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;" >
	
       			<h1>문의사항</h1>
		</div>
		<c:forEach var="board_detail2" items="${board_detail2}"  varStatus="status">
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">		
		
			<table class="table table-hover" style="margin-bottom: 0;">

				<tr>
					<td class="table-info" colspan="1" width="100px">제목</td>
					<c:if test="${board_detail2.step eq 0 }">
					<td>&ensp;${board_detail2.title}</td>
					</c:if>
					<c:if test="${board_detail2.step ne 0 }">
					<td>&ensp;[답글] ${board_detail2.title}</td>
					</c:if>
				</tr>
				<tr>
					<c:if test="${board_detail2.step eq '0'}">
					<td class="table-info">이름</td>
					<td>&ensp;${board_detail2.user_name2}</td>
					</c:if>
					<c:if test="${board_detail2.step ne '0'}">
					<td class="table-info">ID</td>
					<td>&ensp;${board_detail2.admin_id }</td>
					</c:if>
					</tr>
					<c:if test="${board_detail2.step ne '0'}">
					<tr>
					<td class="table-info">작성자</td>
					<td>&ensp;${board_detail2.admin_name}</td>
					</tr>
					<tr>
					<td class="table-info">직급</td>
					<td>&ensp;${board_detail2.admin_rank}</td>
					</tr>
					<tr>
					<td class="table-info">부서</td>
					<td>&ensp;${board_detail2.admin_department}</td>
					</tr>
					<tr>
					<td class="table-info">email</td>
					<td>&ensp;${board_detail2.admin_email}</td>
					</tr>
					</c:if>
					<tr>
					<td class="table-info">작성일자</td>
					<td>&ensp;${board_detail2.register_date}</td>
					</tr>
					<tr>
					<td class="table-info">조회수</td>
					<td>&ensp;${board_detail2.hit}</td>
					</tr>
					<tr height="200px">
					<td class="table-info">내용</td>
					<td colspan="2" valign="top">
					${board_detail2.content}
					</td>
					</tr>
			</table>
			</div>
			<div align="center" style=" padding-left: 200px; width: auto;">
			<table class="table table-hover">
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
								<c:if test="${file_list.use_yn eq 'Y'}">
									<c:if test="${board_detail2.step eq '0' }">
									<c:if test="${board_detail2.use_yn_file eq 'Y' }">
									<button class="btn btn-primary" id="downBtn" onclick="downFile('${board_detail2.file_name2}');">다운로드</button>
									<input style="width: 600px ; border: 0;" type="text" id="view_fa" value="${board_detail2.file_name}"><br>
									</c:if>
									<c:if test="${board_detail2.use_yn_file ne 'Y' }">
									<button class="btn btn-primary" id="downBtn" onclick="downFile('${board_detail2.file_name2}');">성공</button>
									<input style="width: 600px ; border: 0;" type="text" id="view_fa" value="${board_detail2.file_name}"><br>
									</c:if>
									</c:if>
									<c:if test="${board_detail2.step ne '0' }">
									<c:if test="${board_detail2.use_yn_file eq 'Y' }">
									<button class="btn btn-primary" id="downBtn" onclick="downFile2('${board_detail2.file_name2}');">다운로드</button>
									<input style="width: 600px ; border: 0;" type="text" id="view_fa" value="${board_detail2.file_name}"><br>
									</c:if>
									<c:if test="${board_detail2.use_yn_file ne 'Y' }">
									첨부된 파일이 없습니다.
									</c:if>
									</c:if>
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
						<button type="button" class="btn btn-primary" onclick="location.href='inquiry_list.do?board_id=5'" >목록</button>
					</td>
					<td>
					
					<c:set var="auth" value="${auth}" />
							<c:choose>
					    		<c:when test="${auth eq '1'}">
							
					<td colspan="2" align="right">
						<c:if test="${board_detail2.step eq 0}"  >
						<button class="btn btn-primary" id="reply" name="reply" onclick="detailSubmit(2)">답글</button>
						<input type="button" class="btn btn-primary" id="ori_delete" name="ori_delete" value="원글 삭제" />
						</c:if>
						<c:if test="${board_detail2.step eq 1 }">
						<button class="btn btn-primary" id="re_modify" name="re_modify" onclick="re_modify(${board_detail2.seq_id})">글 수정</button>
						<%-- <button class="btn btn-primary" id="modify" name="modify" onclick="location.href='inquiryBoardUpdateForm.do?board_id=${board_detail2.board_id}&seq_id=${board_detail2.seq_id}'">글 수정</button> --%>
						<input type="button" class="btn btn-primary" id="re_delete" name="re_delete" value="답글 삭제" onclick="re_delete(${board_detail2.seq_id})" />
						</c:if>
					</td>
					    		</c:when>
							</c:choose> 
			
				</tr>
			</table>
			</div>
			</c:forEach>
			</div>

			
		





</body>
</html>