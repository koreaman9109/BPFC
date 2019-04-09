<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<%@ include file="nice_in.jsp"%>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<script src="js/recruit/front_recruit.js"></script>
<title>채용공고 - 상세보기</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#recruit_na').parent().addClass('m-gnb__item--active');
});
</script>
<style type="text/css">
table{
	width: 60%;
	height: 100px;
	margin: auto;
	text-align: center;
}
</style>
<script type="text/javascript">
	function fnPopup() {
		var filter = "win16|win32|win64|mac";
		if(navigator.platform){
			if(0 > filter.indexOf(navigator.platform.toLowerCase())){
				alert("지원하기는 PC에서 이용해주세요");
			}else{
				var k = $("#chec_hidden").val();
				if(k == 1){
				window.name = "Parent_window";
				window.open('nice_iframe.do','popupChk','width=430, height=670, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				}else{
				alert("마감된 공고입니다.");
				}
			}
		}
	}
	function support_go_in(){
		document.nice_ac.submit();
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var j = $("#hi_favo").val();
		var n = j.indexOf("|");
		
		if (n = -1) {
			var arr = j.split("|");
			for (var i = 0; i <= arr.length - 2; i++) {
				if(arr[i]!=''){
				$("#view_fa").append("* " + arr[i] + "<br>");
				}
			}
		}
		
		var k = $("#chec_hidden").val();
		if(k==1){
			$("#chec_color").attr("class", "c-notice2__current c-notice2__current--red");
		}else{
			$("#chec_color").attr("class", "c-notice2__current c-notice2__current--gray");
		}
		
		
	});
</script>
</head>
<body>
	<!-- 배너방 -->
	<jsp:include page="../../banner.jsp"></jsp:include>
	<!-- end -->
	<div class="c-wrap">
		<!-- 상단메뉴 -->
		<jsp:include page="../../sub_topmenu.jsp"></jsp:include>
		<!-- end -->

		<div class="c-container">
			<div class="c-lnbs">
				<div class="c-lnb">
					<div class="c-lnb__aligner">
						<h2 class="c-lnb__heading">채용·입찰정보</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item c-lnb__item--active"><a
								href="public.do" class="c-lnb__link">채용안내</a></li>
							<li class="c-lnb__item"><a
								href="bid.do?board_id=4" class="c-lnb__link">입찰안내</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="c-headings">
				<div class="c-aligner">
					<div class="breadcrumb">
						<ul class="breadcrumb__list">
							<li class="breadcrumb__item breadcrumb__item--home"><div class="breadcrumb__link"><a href="main.do" id="content">홈</a></div></li>
							<li class="breadcrumb__item breadcrumb__item-1"><div
								class="breadcrumb__link">채용·입찰정보</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">채용안내</div></li>
						</ul>
					</div>
					<h3 class="c-h2">채용안내</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="r-recruit">
					<div class="c-align">
						<div class="c-section">
							<div class="c-box">
								<div class="c-notice2">
									<div class="c-notice2__box">
										<div class="c-notice2__headings">
											<div class="c-notice2__heading">${re.title }</div>
											<div class="c-notice2__current c-notice2__current--red" id="chec_color">
											<input type="hidden" value="${re.chec }" id="chec_hidden" />
											<c:set var="ch" value="${re.chec }" />
											<c:if test="${ch eq '1' }">
											모집중
											</c:if> <c:if test="${ch ne '1' }">
											마감
											</c:if></div>
										</div>
									</div>
									<div class="c-notice2__box">
										<div class="c-notice2__infos">
											<div class="c-notice2__info">작성자 : 관리자</div>
											<div class="c-notice2__info">작성일자 : <c:set var="day_va" value="${re.day }" /> ${fn:substring(day_va,0,10) }</div>
											<div class="c-notice2__info">조회 : ${re.check_no }</div>
										</div>
									</div>
									<div class="c-notice2__box">
										<div class="c-notice__files">
											<div class="c-notice__file">첨부파일</div>
											<div class="c-notice__file">
												<a href="#" onclick="downFile('${re.file2 }');" class="c-notice__file-link c-notice__file-link--pdf" style="cursor:pointer;">${re.file }</a>
												<a href="#" onclick="downFile2('111.hwp');" class="c-notice__file-link c-notice__file-link--hangle" style="cursor:pointer;">입사지원서.hwp</a>
											</div>
										</div>
									</div>
									<div class="c-notice2__box">
										<div class="c-notice2__cont">
											<br />
											<input type="hidden" value="${re.favorable }" id="hi_favo">
											<table class="r-table">
												<caption><span class="is-hidden">채용공고 내용: 모집분야(모집분야,채용인원,우대조건), 근무개요(채용조건,근무조건,근무지,급여수준), 전형방법(접수기간,접수방법,채용일자,비고)</span></caption>
												<colgroup>
													<col style="width: 30%" />
													<col style="width: 20%" />
													<col style="width: 50%" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col">제목</th>
														<th scope="col" colspan="2">${re.title }</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td rowspan="3" class="r-table__heading">모집분야</td>
														<td class="r-table__sheading">모집분야</td>
														<td>${re.re_en }</td>
													<tr>
														<td class="r-table__sheading">채용인원</td>
														<td>${re.no }명</td>
													</tr>
													<tr>
														<td class="r-table__sheading">우대조건</td>
														<td id="view_fa"></td>
													</tr>
													<tr>
														<td rowspan="4" class="r-table__heading">근무개요</td>
														<td class="r-table__sheading">채용조건</td>
														<td>
														<c:set var="employment" value="${re.employment }" />
														<c:if test="${employment eq '1' }">
														신입
														</c:if> <c:if test="${employment eq '2' }">
														경력
														</c:if>
														<c:if test="${employment ne '1' and employment ne '2' }">${re.employment }
														</c:if>
														</td>
														
													</tr>
													<tr>
														<td class="r-table__sheading">근무조건</td>
														<td>${re.cond }</td>
													</tr>
													<tr>
														<td class="r-table__sheading">근무지</td>
														<td>${re.place }</td>
													</tr>
													<tr>
														<td class="r-table__sheading">급여수준</td>
														<td>${re.salary }</td>
													</tr>
													<tr>
														<td rowspan="4" class="r-table__heading">전형방법</td>
														<td class="r-table__sheading">접수기간</td>
														<td>~ ${re.period }</td>
													</tr>
													<tr>
														<td class="r-table__sheading">접수방법</td>
														<td>${re.way }</td>
													</tr>
													<tr>
														<td class="r-table__sheading">채용일자</td>
														<td>${re.date }</td>
													</tr>
													<tr>
														<td colspan="2">
														<c:set var="etcval" value="${re.etc }" />
														<c:if test="${etcval eq '1' }">
														*서류전형 합격자에 한해 면접 시간 및 장소 개별통보<br />
														*자세한 사항은 당사 채용공고를 확인바랍니다.
														</c:if>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									
									</div>
								</div>
							</div>
						</div>
						
						<form name="form_chk" method="post">
							<input type="hidden" name="m" value="checkplusSerivce"> <input
								type="hidden" name="EncodeData" value="<%=sEncData%>">
						</form>

								
								<br>
						<div class="c-section">
							<div class="c-buttons c-buttons--half c-buttons--center">
								<button onclick="location.href='public.do'"
									class="c-button c-button--large c-button--white">목록</button>
								<button onclick="javascript:fnPopup();"
									class="c-button c-button--large c-button--blue" id="button_re">지원하기</button>
									<button onclick="gogogogogogogo();"
									class="c-button c-button--large c-button--blue" id="button_re">지원하기2</button>
							</div>
						</div>
							<div class="writings">
									<c:forEach var="preView" items="${preView}"  varStatus="status">
									<a href="recruit-body.do?all_no=${preView.all_no}"
										class="writing__box writing__box--prev">
										<div class="writing__key">이전 글</div>
										<div class="writing__value">
										<div class="writing__link">${preView.title}</div>
										</div>
									</a> 
									</c:forEach>
								
									<c:forEach var="nextView" items="${nextView}"  varStatus="status">	
									<a href="recruit-body.do?all_no=${nextView.all_no}"
										class="writing__box writing__box--next">
										<div class="writing__key">다음 글</div>
										<div class="writing__value">
											<div class="writing__link">${nextView.title}</div>
										</div>
									</a>
									</c:forEach>
								</div> 
						
					</div>
				</div>
			</div>
			<!-- // 내용-->
		</div>
		<form action="nice_ac.do" name="nice_ac" method="post">
			<input type="hidden" value="" name="name2" id="name2" />
			<input type="hidden" value="" name="mobileno2" id="mobileno2" />
		</form>
		<!-- 바로가기 및 맨위로 -->
		<jsp:include page="../../sub_quick.jsp"></jsp:include>
		<!-- end -->

		<script type="text/javascript">
			var step = new TimelineLite({
				delay : .2
			});
			step.staggerTo('.r-public__step', .5, {
				delay : .2,
				opacity : 1,
				scale : 1
			}, .2);
		</script>
		<script type="text/javascript">
		function downFile(fileName){
			location.href="filedown.do?filename="+encodeURI(fileName);
		}
		function downFile2(fileName){
			location.href="filedown2.do?filename="+encodeURI(fileName);
		}
		function gogogogogogogo() {
			$("#name2").val("김영정");
			$("#mobileno2").val("01031663135");
			document.nice_ac.submit();
		}
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>
