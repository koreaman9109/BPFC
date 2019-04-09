<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="include.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 메인 페이지</title>
	<!-- 접속 IP 출력 -->
	<%! String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR"); 
			if (ip == null || ip.length() == 0) {
				 ip= request.getHeader("Proxy-Client-IP");
				
				  }
			if (ip == null || ip.length() == 0) {
			
			    ip= request.getHeader("WL-Proxy-Client-IP");  
			
			  }
			if (ip == null || ip.length() == 0) {
			
			    ip= request.getRemoteAddr() ;
			
			  }
			return ip;
			}
			%>
	
</head>
<body>
	<div id="header"><jsp:include page="header.jsp"></jsp:include></div>
	<br><br><br>
	<div align="center" style="padding-top:50px;">
		<h2>${sessionScope.admin_name}(${sessionScope.admin_id})님환영합니다.</h2>
		<div style="border: 3px solid yellow; width: 200px; background-color: yellow;"><a href="resources/20180816_usermanual_ver1.1.pdf" target="_blank">사용자메뉴얼(ver1.1) 열기</a></div>
	</div>
	<br>
	<div align="center" style="margin: 0 auto; width: 600px;">
				
		<!--좌측에 들어가는 테이블-->
		<div class="card text-white bg-dark mb-3">
		  <div class="card-header">관리자 정보</div>
		  <div class="card-body">
		    <p class="card-text">&ensp;아이디&ensp;:&ensp; ${sessionScope.admin_id}</p>
		     <p class="card-text">&ensp;이름 (MAIL)&ensp;:&ensp; ${sessionScope.admin_name} (${sessionScope.admin_email})</p>
		     <p class="card-text">최근 접속 시간: <%=new java.util.Date(session.getCreationTime()).toString() %></p>
		    <p class="card-text">&ensp;접속 IP&ensp;:&ensp; <%=getClientIP(request)%></p> <!-- 접속 IP  -->
		  </div>
		</div>
		<!--우측에 들어가는 테이블-->
		<div class="card text-white bg-success mb-3">
		  <div class="card-header">호스팅 정보</div>
		  <div class="card-body">
		    <p class="card-text">도메인 정보&ensp;:&ensp;www.bpfmc.or.kr</p>
		    <!-- <p class="card-text">사용용량: HDD 120 / 200M</p> -->
		  </div>
		</div>
		<!--좌측에 들어가는 테이블-->
		<div class="card text-white bg-danger mb-3">
		  <div class="card-header">게시판 정보</div>
		  <div class="card-body">
		    <!-- <p class="card-text">현재 게시판 수: 10 개</p>
		    <p class="card-text">오늘 생성한 게시판 수: 1 개</p> -->
		    <p class="card-text">전체 글 수&ensp;:&ensp;${allCnt} 개</p>
		  </div>
		</div>
		<!--우측에 들어가는 테이블-->
		<!-- <div class="card text-white bg-warning mb-3">
		  <div class="card-header">방문자 정보</div>
		  <div class="card-body">
		    <p class="card-text">오늘 방문자: 7 명</p>
		    <p class="card-text">전체 방문자:  50,000,000 명</p>
		  </div>
		</div> -->
		
	</div>


</body>
</html>