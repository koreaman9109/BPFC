<%@page import="com.homepage.interlink.model.Authority"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE>
<html>
<head>
<link href="css/board.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<div class="navLeft">
<ul>
<!-- <li style="font-size: large;">환경설정 (Ver2.0 20180720)</li> -->
<li style="font-size: large;">환경설정 (Ver2.1 20180726)</li>
<br>
<li><a href="adminUpdateForm.do?board_id=10&board_id2=7&admin_id=">내 정보 수정</a></li>
<%
HttpSession ss = request.getSession();
if("bpfcadmin".equals(ss.getAttribute("admin_id")) || "interlink".equals(ss.getAttribute("admin_id"))){%>
<li><a href="banner_view.do?board_id=10&board_id2=7">배너창 설정</a></li>
<li><a href="admin_list.do?board_id=10&board_id2=7">사용자 목록</a></li>
<li><a href="admin_join.do?board_id=10&board_id2=7">신규 사용자 등록</a></li>
<li><a href="admin_sms.do?board_id=10&board_id2=7">문의사항 등록 알림</a></li>
<%}%>

<c:if test="${auth eq '1' || auth2 eq '1' }" >
<li><a href="sms_view1.do?board_id=10&board_id2=7">문자전송</a></li>
<li><a href="sms_result.do?board_id=10&board_id2=7">문자발신내역</a></li>
</c:if>

<!-- <li><a href="del_list.do?board_id=1">휴지통</a></li> -->


</ul>
</div>
