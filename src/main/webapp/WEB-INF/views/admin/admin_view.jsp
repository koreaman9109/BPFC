<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
<link href="css/board.css" rel="stylesheet"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 상세보기</title>
<script type="text/javascript">
$(document).ready(
		
		function() {
			//목록으로 가기
			$("#list").click(function() {	
				location.href = "admin_list.do";
			});
			
			//글수정
			$("#modify")
					.click(
							function() {
								if (confirm("수정 하시겠습니까??") == true){
								location.href = "adminUpdateForm.do?board_id=10&board_id2=7&admin_id=" + $("#admin_id").val();
								}else{
									return;
								}
										});

		});
function detailSubmit(index) {
    if (index == 1) {
		if(confirm("정말로 삭제 하시겠습니까?")) {
			document.listForm.action='adminDelete.do';
			

					alert("삭제 되었습니다.");
			}else{
				alert("취소 되었습니다.");
				location.href = "admin_list.do";
			}	
    }
    if (index == 2) {
      document.listForm.action='#';
    }
    document.listForm.submit();
  };

						
</script>
<style>
.mouseOverHighlight {
	cursor: pointer !important;
	color: blue;
	pointer-events: auto;
}

</style>
</head>
<body>
		<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
		<div class="left" style="height: 100% ;">
		<jsp:include page="../setting_submenu.jsp"></jsp:include>
		</div>
		<form name="listForm"  method="get">
		<input type="hidden" id="admin_num" name="admin_num" value="${admin_view.admin_num}" />
		<input type="hidden" id="admin_id" name="admin_id" value="${admin_view.admin_id}" />
		</form>
		
		<div align="center" style="margin: 0 auto; width: 500px; padding-top: 100px; ">
			
		<h1>사용자 정보</h1>
		
		<br>
			<table border="1" style="border-color: gray; width: 500px; font-size: large;" >
					<tr>
					<td class="table-info" colspan="1" width="130px;" align="left">
					<label class="col-form-label" style="font-size: large;">&ensp;&ensp;ID(사번)</label>
					</td>
					<td align="left" colspan="2">&ensp;&ensp;${admin_view.admin_id}</td>
					</tr>
					<tr>
					<td class="table-info" align="left">
					<label class="col-form-label" style="font-size: large;">&ensp;&ensp;성명</label>
					</td>
					<td align="left" colspan="2">&ensp;&ensp;${admin_view.admin_name}</td>
					</tr>
					<tr>
					<td class="table-info" align="left">
					<label class="col-form-label" style="font-size: large;">&ensp;&ensp;직급</label>
					</td>
					<td align="left" colspan="2">&ensp;&ensp;${admin_view.admin_rank}</td>
					</tr>
					<tr>
					<td class="table-info" align="left">
					<label class="col-form-label" style="font-size: large;">&ensp;&ensp;부서</label>
					</td>
					<td align="left" colspan="2">&ensp;&ensp;${admin_view.admin_department}</td>
					</tr>
					<tr>
					<td class="table-info" align="left">
					<label class="col-form-label" style="font-size: large;">&ensp;&ensp;업무</label>
					</td>
					<td align="left" colspan="2">&ensp;&ensp;${admin_view.admin_task}</td>
					</tr>
					<tr>
					<td class="table-info" align="left">
					<label class="col-form-label" style="font-size: large;">&ensp;&ensp;별칭</label>
					</td>
					<td align="left" colspan="2">&ensp;&ensp;${admin_view.admin_nickname}</td>
					</tr>
					<tr>
					<td class="table-info" align="left">
					<label class="col-form-label" style="font-size: large;">&ensp;&ensp;E-mail</label>
					</td>
					<td align="left" colspan="2">&ensp;&ensp;${admin_view.admin_email}</td>
					</tr>
					</table>
					<br />
					<table border="1" style="border-color: gray; width: 500px" >
					<tr style="font-size: large;">
					<td class="table-info" align="center" width="130px;">
					<label class="col-form-label" style="font-size: large;">&ensp;&ensp;권한</label>
					</td><td align="center" class="table-info">게시물에 보여질 항목</td>
					</tr>
					<c:forEach var="auuuuuu" items="${auuuuuu}">
					<tr style="font-size: large;">
					<td align="left" class="col-form-label">&ensp;&ensp;
					<c:set var="vn" value="${auuuuuu.view_name}" />
					<c:set var="ch" value="${auuuuuu.board_id}" />
                     <c:if test="${ch eq '1' }">
                        	공지사항
                     </c:if> 
                     <c:if test="${ch eq '2' }">
                        	BPFC 소식지
                     </c:if>
                     <c:if test="${ch eq '3' }">
                        	포토갤러리
                     </c:if> 
                     <c:if test="${ch eq '4' }">
                        	입찰안내
                     </c:if>
                     <c:if test="${ch eq '5' }">
                        	문의사항
                     </c:if> 
                     <c:if test="${ch eq '6' }">
                        	분실물안내
                     </c:if>
                     <c:if test="${ch eq '7' }">
                        	채용안내
                     </c:if> 
                     <c:if test="${ch eq '8' }">
                        	컨벤션센터
                     </c:if>
                     <c:if test="${ch eq '9' }">
                        	자료실
                     </c:if>
                     <c:if test="${ch eq '10' }">
                        	단문메시지
                     </c:if>
					<%-- </c:forEach> --%>
					<br>
					</td>
					<td align="center" class="col-form-label">
<%-- 					<c:forEach var="auuuuuu" items="${auuuuuu}"> --%>
					 <c:if test="${vn eq '1' }">
                        	성명
                     </c:if>
                     <c:if test="${vn eq '2' }">
                    		부서
                     </c:if>
                     <c:if test="${vn eq '3' }">
                    		별칭
                     </c:if>
                     <c:if test="${vn eq '0' }">
                     &ensp;
                     </c:if>
					</td>
					</tr>
                     </c:forEach>

			</table>
			<br>
			<table style="border-color: gray; width: 500px; font-size: large;" >
				<tr>
					<td align="left">
						<button class="btn btn-primary" id="list" name="list">목록</button>
					</td>
					<td>
					<td colspan="2" align="right">
						<c:if test="${sessionScope.admin_id eq 'bpfcadmin' || sessionScope.admin_id eq 'interlink'}">
						<button class="btn btn-primary" id="modify" name="modify">정보 수정</button>
						<button class="btn btn-danger" id="delete" name="delete" onclick="detailSubmit(1)">정보 삭제</button>
						</c:if>
					</td>
				</tr>
			</table>
		</div>


</body>
</html>