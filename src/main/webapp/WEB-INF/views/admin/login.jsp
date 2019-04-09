<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include.jsp"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
    $("#btnLogin").click(function(){
        // 태크.val() : 태그에 입력된 값
        // 태크.val("값") : 태그의 값을 변경 
        var adminId = $("#admin_id").val();
        var adminPasswd = $("#admin_passwd").val()
        if(adminId == ""){
            alert("아이디를 입력하세요.");
            $("#admin_id").focus(); // 입력포커스 이동
            return; // 함수 종료
        }
        if(adminPasswd == ""){
            alert("패스워드를를 입력하세요.");
            $("#admin_passwd").focus();
            return;
        }
        // 폼 내부의 데이터를 전송할 주소
        document.form1.action="loginCheck.do"
        // 제출
        document.form1.submit();
    });
});

</script>

</head>
<body>
<%-- 	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div> --%>

		<div align="center" style="padding-top: 100px;">
		<%-- <%@ include file="../include/menu.jsp" %> --%>
<h2>로그인</h2>
    <form name="form1" method="post">
        <table width="420px" style="border: 1px solid #a1a1a1; color: #a1a1a1; box-shadow: 3px 3px #e1e1e1">
            <tr>
                <td style="padding-top: 55px; text-align: center;">아이디</td>
                <td style="padding-top: 55px;"><input class="searchForm" name="admin_id" id="admin_id" placeholder="username"></td>
            </tr>
            <tr>
                <td style="padding: 30px; text-align: center;">비밀번호</td>
                <td><input class="searchForm" type="password" name="admin_passwd" id="admin_passwd" placeholder="password"></td>
            </tr>
            <tr>
                <td style="padding: 35px;" colspan="2" align="center">
                    <input class="btn btn-primary btn-lg btn-block" type="button" id="btnLogin" value="로그인" />
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
