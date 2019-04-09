<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page session="true"%> 
<!DOCTYPE html>
<html>
<head>
<link href="css/board.css" rel="stylesheet">
<link href="css/pages.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의하기 사용자 게시글 삭제 비밀번호 확인</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	
	$("#password").keydown(function(e) {
        if (e.keyCode == 13) {
            $("#btnLogin").click();
        }
    });
	
	
    $("#btnLogin").click(function(){
		

        var password = $("#password").val()
        if(password == ""){
            alert("패스워드를를 입력하세요.");
            $("#password").focus();
            return;
        }
        // 폼 내부의 데이터를 전송할 주소
        // 제출
		window.opener.name = "passwordDeleteCheck"; // 부모창의 이름 설정
        document.form1.target = "passwordDeleteCheck"; // 타켓을 부모창으로 설정
        document.form1.action = "passwordDeleteCheck.do";
        document.form1.submit();
        self.close();

      



        
    });
});



</script>

</head>
<body>
<%-- 	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div> --%>
<div class="i-password">
		<%-- <%@ include file="../include/menu.jsp" %> --%>
<h2 class="i-heading">문의사항 비밀번호</h2>
    <form name="form1" method="post">
    	<div class="i-tables">
	        <table class="i-table">
	       		<caption><span class="is-hidden">문의사항 비밀번호 입력</span></caption>
	        	<colgroup>
		        	<col style="width: 30%" />
		        	<col style="width: 70%" />
		        </colgroup>
	        	<tbody>
		<!--        <tr>
		                <td>아이디</td>
		                <td><input name="admin_id" id="admin_id"></td>
		            </tr> -->
		            <tr>
		                <td><label for="password" class="i-label">비밀번호</label></td>
		                
		                <td>
		                <c:forEach var="board_detail2" items="${board_detail2}"  varStatus="status">
		                <input type="hidden" name="seq_id" id="seq_id" value="${board_detail2.seq_id}">
		                </c:forEach>
		                <input class="i-input searchForm" type="password" name="password" id="password"></td>
		            </tr>
	            </tbody>
	        </table>
        </div>
        <div class="c-buttons c-buttons--center">
        	<button class="c-button c-button--middle c-button--blue" type="button" id="btnLogin">로그인</button>
        </div>
    </form>
</div>
</body>
</html>
