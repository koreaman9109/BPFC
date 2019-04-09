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
<title>BPFC 소식지 수정</title>
<script type="text/javascript">

$(document).ready(function(){
    
    CKEDITOR.replace( 'content' );
    CKEDITOR.config.height = 500;
     
    $("#list").click(function() {
		if (confirm("목록으로 돌아가시겠습니까? 작성중인 내용은 저장되지 않습니다.") == true){
		location.href = "newsletter_list.do?board_id=2";
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
				
		        if($("#title").val().trim() == ""){
		            alert("제목을 입력하세요.");
		            $("#title").focus();
		            return false;
		        }
				// 폼에 입력한 데이터를 서버로 전송
				document.listForm.action='newsletterBoardUpdate.do';

				

						alert("수정 되었습니다.");
						
				}else{
					alert("취소 되었습니다.");
					location.href = "newsletter_list.do?board_id=" + $("#board_id").val();
				}	
	    }
	    if (index == 2) {
	      document.listForm.action='#';
	    }
	    document.listForm.submit();
	  };
	  
	  /* 파일추가버튼 */
		function addbt() {
			var fileIndex = $('.addtable tr').children().length+1;
			$('#addtd').append(
					'<tr><td colspan="2">' + '   <input type="file" name="uploadfile['
							+ fileIndex + ']" id="file_up["' + fileIndex + '] />' + '</td></tr>');
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
						'<tr><td width="100%">'+
						'<input type="file" style="border: 0; width: 100%;"  class="a" name="uploadfile[0]" id="file_up[0]" />' +
						'</td></tr>'
						);
			}else if (ii != "C"){
				$('#add_1').append(
						'<tr><td>'+
						'<input type="file" style="border: 0; width: 100%;" class="a" name="uploadfile[1]" id="file_up[1]" />' +
						'</td></tr>'
						);
			}
			$(obj).find('#flag').val("D");
			$(obj).hide();
			
		}

		function delFile2(idx){

			var obj = $('#flist_' + idx);
			var fileIndex = $('#test').children().length+1;
			//alert($(obj).find('#flag').val());
			var ii = $('#flag').val();
			if(ii == "C"){
				
				$('#add_1').append(
						'<tr><td>'+
						'<input type="file" style="border: 0; width: 100%;" class="a" name="uploadfile[1]" id="file_up[1]" />' +
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
		<input type="hidden" id="seq_id" name="seq_id" value="${newsletter_detail.seq_id}">
		<input type="hidden" id="board_id" name="board_id" value="${board_id}" />
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		
       			<h1>BPFC 소식지</h1>

		<br>
				
			<table class="table table-hover"  style="margin-bottom: 0;">

				<tr>
					<td class="table-info">
						작성자
					</td>
					<td colspan="1">	
					<input type="text" 
						id="admin_id" name="admin_id" style="width: 100%; border: none;" maxlength="10"
						placeholder="작성자" readonly="readonly"   value="${newsletter_detail.admin_id}" />
						<%-- <input type="hidden" id="board_id" name="board_id"
						style="width: 400px;" placeholder="게시판번호"
						value="${newsletter_detail.board_id}" /> --%>
					</td>
				</tr>
				 
				
				<tr>	
					<td class="table-info">	 
						제목
					</td>
					 <td>
					 <input type="text" id="title" name="title"
						style="width: 100%;" placeholder="제목을 입력해주세요" value="${newsletter_detail.title}" />
					</td>
				</tr>

				
			</table>
			</div>
			<div align="center" style=" padding-left: 200px; width: auto;">
			<table class="table table-hover">
				<tr style="margin: 0;">
					<td>
						<textarea name="content" id="content" rows="10" cols="50">${newsletter_detail.content}</textarea>
					</td>
				</tr>
				</table>
				</div>
					
			<div align="center" style=" padding-left: 200px; width: auto;">
			<table class="table table-hover">
				<tr style="margin: 0;">
					<td colspan="2" style="width: 900px">
					<h3>※반드시 썸네일이미지( img파일1개 ) 와 사보 ( pdf파일1개 )를 올려주세요. 
					<!-- <br>※썸네일이미지는 가로 : 284px, 세로 : 344px로 맞춰주세요. -->
					</h3>
					</td>
								</tr>
				
					<c:choose>
						<c:when test="${fn:length(file_list) == 0}">												
							<tr>
								<td colspan="2" id="addtd" class="addtable">
									
									<!-- <input class="btn btn-primary" class="btn btn-primary" type="button" value="File Add" onclick="addbt()" /> -->
									<input type="file" name="uploadfile[0]" style="width: 100%;" required="required" id="file_up[0]" />
								</td>
								</tr>
								<tr>
								<td colspan="2" id="addtd" class="addtable">
									<input type="file" name="uploadfile[1]" style="width: 100%;" required="required" id="file_up[1]" />
									
								</td>
								</tr>
						</c:when>
						<c:when test="${fn:length(file_list) == 1}">												
								<c:forEach var="file_list" items="${file_list}"  varStatus="status">
							<tr id="flist_${status.count}">
								    <c:if test="${file_list.use_yn eq 'Y' }">
								 <td>
								 	<c:if test="${file_list.extention_name eq '.pdf' }">
								 	<iframe style="width: 150px; height: 180px; " src="<c:url value="resources/board/newsletter/${file_list.file_name2}"/>"></iframe>
								 	&ensp;&ensp;<input style="border: 0; width: 500px; vertical-align: bottom;" type="text" id="fName" name="fName" value="${file_list.file_name}">
									<button class="btn btn-primary" style="vertical-align: bottom;" type="button" id="downBtn" onclick="delFile2('${status.count}');">삭제</button>
									<input type="hidden" name="file_key" id="file_key" value="${file_list.file_key}" />
									<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
									<input type="hidden"  name="flag" id="flag" value="C" />
								 	</c:if>
								 	<c:if test="${file_list.extention_name ne '.pdf' }">
								 	<img style="width: 150px; height: 200px;" src="resources/board/newsletter/${file_list.file_name2}">
								 	&ensp;&ensp;<input style="border: 0; width: 500px; vertical-align: bottom;" type="text" id="fName" name="fName" value="${file_list.file_name}">
									<button class="btn btn-primary" style="vertical-align: bottom;" type="button" id="downBtn" onclick="delFile2('${status.count}');">삭제</button>
									<input type="hidden" name="file_key" id="file_key" value="${file_list.file_key}" />
									<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
									<input type="hidden"  name="flag" id="flag" value="C" />
								 	</c:if>
									
								</td>
									</c:if>
								
							</tr>
							
							</c:forEach>
							<tr>
								<td><input type="file" name="uploadfile[0]" required="required" id="file_up[0]" style="width: 100%;" /></td>
								
							</tr>
							
						</c:when>
						<c:otherwise>		
							<c:forEach var="file_list" items="${file_list}"  varStatus="status">
							<tr id="flist_${status.count}">
								    <c:if test="${file_list.use_yn eq 'Y' }">
								 <td>
								 	<c:if test="${file_list.extention_name eq '.pdf' }">
								 	<iframe style="width: 150px; height: 180px; " src="<c:url value="resources/board/newsletter/${file_list.file_name2}"/>"></iframe>
								 	&ensp;&ensp;<input style="border: 0; width: 500px; vertical-align: bottom;" type="text" id="fName" name="fName" value="${file_list.file_name}">
									<button class="btn btn-primary" style="vertical-align: bottom;" type="button" id="downBtn" onclick="delFile('${status.count}');">삭제</button>
									<input type="hidden" name="file_key" id="file_key" value="${file_list.file_key}" />
									<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
									<input type="hidden"  name="flag" id="flag" value="C" />
								 	</c:if>
								 	<c:if test="${file_list.extention_name ne '.pdf' }">
								 	<img style="width: 150px; height: 200px;" src="resources/board/newsletter/${file_list.file_name2}">
								 	&ensp;&ensp;<input style="border: 0; width: 500px; vertical-align: bottom;" type="text" id="fName" name="fName" value="${file_list.file_name}">
									<button class="btn btn-primary" style="vertical-align: bottom;" type="button" id="downBtn" onclick="delFile('${status.count}');">삭제</button>
									<input type="hidden" name="file_key" id="file_key" value="${file_list.file_key}" />
									<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
									<input type="hidden"  name="flag" id="flag" value="C" />
								 	</c:if>
									
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
			<br><br><br>
			


		</div>
		
	</div>

</body>
</html>