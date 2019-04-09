<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../include.jsp"%>
<script src="js/recruit/recruit.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.searchForm{
		width: 150px;
	}
	#textarea_msg{
		max-height: 98px;
	}
	.textareadiv{
	position: relative;
	}
	.textareadiv #textarea_count{
	position: absolute;
	left: 63%;
	top: 70%;
	opacity: 0.7;
	}
</style>
</head>
<body>
	<div id="header"><jsp:include page="../../header.jsp"></jsp:include></div>
	<jsp:include page="../recruit_left_bar.jsp"></jsp:include>
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
	<h1>SMS</h1>
	<br>
	<select class="form-control" name="all_no" onchange="javascript:change_sms(this);">
		<option>선택</option>
			<c:forEach var="boardList" items="${boardList }">
			<option value="${boardList.all_no }">${boardList.all_no } / ${boardList.title } / ${boardList.re_en }</option>
			</c:forEach>
	</select>
	<br><br>
	<form name="send" action="send.do" method="post">
	<div class="textareadiv">
			<textarea class="form-control" name="Msg" maxlength="80" id="textarea_msg">
(사)부산항관리센터
SMS 입력란
수신거부:051-400-3104</textarea><a id="textarea_count"></a>
</div><br>
			<input type="hidden" value="admin" name="SendId" />
			<input type="hidden" value="admin" name="SendName" /> 
			<input type="hidden" value="https://www.bpfmc.or.kr" name="Url" /> 
			<input type="hidden" value="0" name="Rdate" /> 
			<input type="hidden" value="0" name="Rtime" /> 
			<input type="hidden" value="0" name="Result" /> 
			<input type="hidden" value="S" name="Kind" /> 
			<input type="hidden" value="0" name="ErrCode" /> 
			<input type="hidden" value="0" name="Retry1" /> 
			<input type="hidden" value="0" name="Retry2" /> 
			<input type="hidden" value="0" name="LastTime" />
			<br />
			<br />
			<!--
			일자 : 2018-06-14 16:18
			내용 : 권한추가
			이름 : 박권수
			-->
			<c:if test="${auth eq '1'}">
			<input class="btn btn-info" type="button" value="추가" onclick="sms_add_bt()"/>
			<input class="btn btn-info" type="button" value="전송" onclick="send_bt()" />
			</c:if>
			<!--===============================================================================  -->
			
			<br />
			<br />
			<table class="table table-hover" id="sms_table">
				<tr class="table-info">
					<td>구분</td>
					<td>성함</td>
					<td>휴대전화번호</td>
				</tr>
				<tr id="sms_table1">
					<td></td>
					<td><input class="searchForm" type="text" value="이름" name="name" id="name1" /></td>
					<td><input class="searchForm" type="text" name="phone1" id="phone1" />&nbsp;&nbsp;-&nbsp;&nbsp;<input class="searchForm" type="text"
						name="phone2" id="phone2_1" />&nbsp;&nbsp;-&nbsp;&nbsp;<input class="searchForm" type="text" name="phone3" id="phone3_1" /></td>
				</tr>
			</table>
	</form>
	</div>
</body>
</html>