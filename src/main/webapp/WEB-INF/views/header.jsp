<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
function wait() {
		alert("준비중입니다");
		
	};
</script>
<!-- <script type="text/javascript">
/* 전역 변수 */
var initMinute; // 최초 섫정할 시간(min)
var remainSecond; // 남은시간(sec)

$(document).ready(function () {
	clearTime(10); //세션 만료 적용 시간
	setTimer();    //문서 로드시 타이머 시작
});

function clearTime(min) {
	initMinute = min;
	remainSecond = min*60;
}

function setTimer(){ //1초 간격으로 호출할 타이머 함수 
	
	// hh : mm 으로 남은시간 표기하기 위한 변수
	remainMinute_ = parseInt(remainSecond/60);
	remainSecond_ = remainSecond%60;
	
	if(remainSecond > 0){
		$("#timer").empty();
		$("#timer").append(Lpad(remainMinute_,2) + ":" + Lpad(remainSecond_,2));    // hh:mm 표기
		remainSecond--;
		setTimeout("setTimer()", 1000); //1초간격으로 재귀호출!!
	}else{
		alert('세션종료');
		/* 세션 종료시 작동할 이벤트 */
		
	}
}

function Lpad(str,len) {
	str = str+"";
	while(str.length<len){
		str = "0"+str;
	}
	return str;
	
}
 
</script>
 -->


<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
<img class="navbar-brand" alt="인터링크앤씨 로고" src="images/inter_logo.png" style="width: 120px; padding: 0px; height: 43px;">
	<a class="navbar-brand" href="cms_main.do">BPFC Admin Page</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
	  <span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="adminUpdateForm.do?board_id=10&board_id2=7&admin_id=">환경설정<span class="sr-only"></span></a></li>
			<li class="nav-item active"><a class="nav-link" href="centernews_list.do?board_id=1">게시판관리<span class="sr-only"></span></a></li>
			<li class="nav-item active"><a class="nav-link" onclick="wait()">화물요율관리<span class="sr-only"></span></a></li>
			<li class="nav-item active"><a class="nav-link" href="convention_list.do?board_id=8">컨벤션센터관리<span class="sr-only"></span></a></li>
			<li class="nav-item active"><a class="nav-link" href="recruit_list.do?board_id=7">채용관리<span class="sr-only"></span></a></li>
			<li class="nav-item active"><a class="nav-link" href="lost_list.do?board_id=6">분실물관리<span class="sr-only"></span></a></li>
			
			
			
			<c:choose>
			    <c:when test="${sessionScope.admin_id == null}">
			        <a href="login.do">로그인</a>
			    </c:when>
			    <c:otherwise>		        	
		        	<div class="btn-group" role="group" aria-label="Button group with nested dropdown" style="position: absolute; right: 10px;">
		        <!-- 	<table>
		        	<tr>
		        	<td id="timer">
		        	</td>
		        	</tr>
		        	
		        	</table> -->
		        	  <a href="https://www.bpfmc.or.kr/main.do" class="btn btn-warning" target="_blank">BPFC 홈페이지 이동</a>
		        	  <button type="button" class="btn btn-info">${sessionScope.admin_name}(${sessionScope.admin_id})님이 로그인중입니다.</button>
					  <a href="logout.do" class="btn btn-danger">logout</a>
					</div>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>
