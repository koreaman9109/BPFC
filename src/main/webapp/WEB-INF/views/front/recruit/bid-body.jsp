<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>입찰안내 본문</title>
<script>
function downFile(fileName){
	location.href="bidFileDown.do?file_name="+encodeURI(fileName);
}
/* 
2018-06-27 오전 10:46
수정자 : 박권수
내  용 : 입찰안내 파일 목록 보기 추가
*/
function file_list_btn(){
	/* $("#test1").hide(); */
	$('#file_icon_plus').css({"display":"none"});
	$('#file_icon_mainus').css({"display":"inline-block"});
	$('#file_list').css({"display":"inline-block"});
	/* $("#file_list").show(); */
	/* $("#test4").show(); */
	 }

function file_list_btn2(){
	/* $("#test4").hide(); */
	$('#file_icon_mainus').css({"display":"none"});
	$('#file_icon_plus').css({"display":"inline-block"});	
	$('#file_list').css({"display":"none"});	
	 }
	 
</script>
<script type="text/javascript">
$(document).ready(function() {
	$('#recruit_na').parent().addClass('m-gnb__item--active');
	/* 
	2018-06-27 오전 10:46
	수정자 : 박권수
	내  용 : 입찰안내 파일 목록 보기 추가
	*/
	$("#file_list").hide();
	$("#file_icon_mainus").hide();
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
							<li class="c-lnb__item"><a
								href="public.do" class="c-lnb__link">채용안내</a></li>
							<!-- <li class="c-lnb__item"><a href="notice-service1.do"
								class="c-lnb__link">알림서비스</a></li> -->
								<li class="c-lnb__item c-lnb__item--active"><a
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
								class="breadcrumb__link">고객지원</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">입찰안내</div></li>
						</ul>
					</div>
					<h3 class="c-h2">입찰안내</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
					<input type="hidden" id="seq_id" name="seq_id" value="${board_detail.seq_id}" />
					<input type="hidden" id="file_key" name="file_key" value="${file_list}" />
					<input type="hidden" id="board_id" name="board_id" value="${board_detail.board_id}" />
				<div class="r-recruit">
					<div class="c-align">
						<div class="c-section">
							<div class="c-box">
								<div class="c-notice2">
									<div class="c-notice2__box">
										<div class="c-notice2__heading">${board_detail.title}</div>
									</div>
									<div class="c-notice2__box">
										<div class="c-notice2__infos">
											<c:if test="${board_detail.admin_name ne null}">										
											<div class="c-notice2__info">작성자 : ${board_detail.admin_name}</div>
											</c:if>
											<c:if test="${board_detail.admin_name eq null}">										
											<div class="c-notice2__info">작성자 : 관리자</div>
											</c:if>
											<c:if test="${board_detail.admin_department ne null}">
											<div class="c-notice2__info">담당 부서 : ${board_detail.admin_department}</div>
											</c:if>
											<div class="c-notice2__info">작성일자 : <c:set var="day_va" value="${board_detail.register_date}" /> ${fn:substring(day_va,0,10) }</div>
											<div class="c-notice2__info">조회 : ${board_detail.hit}</div>
										</div>
									</div>
									<div class="c-notice2__box">
										<div class="c-notice__files">
											<div class="c-notice__file">첨부파일</div>
											<div class="c-notice__file">
											<c:if test="${fn:length(file_list) == 0}">												
													첨부파일이  없습니다.
											</c:if>
											</div>
											<!--  
											2018-06-27 오전 10:46
											수정자 : 박권수
											내  용 : 입찰안내 파일 목록 보기 추가
											 -->
								  
											<c:if test="${fn:length(file_list) <= 2}">
											<div class="c-notice__file">	
											<c:forEach var="file_list" items="${file_list}"  varStatus="status">
											<c:if test="${file_list.use_yn eq 'Y'}">
											
												<c:if test="${file_list.seq_id eq board_detail.seq_id}">
											
													<c:choose>
													<c:when test="${file_list.extention_name eq '.hwp'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--hangle" title="첨부파일 다운로드" download>${file_list.file_name}</a>
													</c:when>
													<c:when test="${file_list.extention_name eq '.pdf'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--pdf" title="첨부파일 다운로드" download>${file_list.file_name}</a>
													</c:when>
													<c:when test="${file_list.extention_name eq '.pptx'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--ppt" title="첨부파일 다운로드" download>${file_list.file_name}</a>
													</c:when>
													<c:when test="${file_list.extention_name eq '.xlsx'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--excel" title="첨부파일 다운로드" download>${file_list.file_name}</a>
													</c:when>
													<c:when test="${file_list.extention_name eq '.jpg' || file_list.extention_name eq '.png' || 
																	file_list.extention_name eq '.gif' || file_list.extention_name eq '.bmp' || 
																	file_list.extention_name eq '.tif'}">
													<a href="#" style="cursor: pointer;"  onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--capture" title="첨부파일 다운로드" download>${file_list.file_name}</a>
													</c:when>
													<c:otherwise>
													<a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--down" title="첨부파일 다운로드" download>${file_list.file_name}</a>
													</c:otherwise>
													</c:choose>
													</c:if>
											</c:if>		
													
													</c:forEach>
											</div>
											</c:if>
											
											<!--  
											2018-06-27 오전 10:46
											수정자 : 박권수
											내  용 : 입찰안내 파일 목록 보기 추가
											 -->										  
											<c:if test="${fn:length(file_list) >= 3}">
											<div class="c-notice__file">	
											<a href="#" class="c-notice__file-link c-notice__file-link--plus" onclick="file_list_btn();" id="file_icon_plus" style=" cursor: pointer;" title="첨부파일 목록">첨부파일 (+${fn:length(file_list)})</a>
											<a href="#" class="c-notice__file-link c-notice__file-link--mainus" onclick="file_list_btn2();" id="file_icon_mainus" style="margin-left:0%; cursor: pointer;" title="첨부파일 목록">첨부파일 (+${fn:length(file_list)})</a><br /><br />
											<div id="file_list">
											<c:forEach var="file_list" items="${file_list}"  varStatus="status">
		
											<c:if test="${file_list.use_yn eq 'Y'}">
											
												<c:if test="${file_list.seq_id eq board_detail.seq_id}">
													<c:choose>
													<c:when test="${file_list.extention_name eq '.hwp'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--hangle" title="첨부파일 다운로드" download>${file_list.file_name}</a><br /><br />
													</c:when>
													<c:when test="${file_list.extention_name eq '.pdf'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--pdf" title="첨부파일 다운로드" download>${file_list.file_name}</a><br /><br />
													</c:when>
													<c:when test="${file_list.extention_name eq '.pptx'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--ppt" title="첨부파일 다운로드" download>${file_list.file_name}</a><br /><br />
													</c:when>
													<c:when test="${file_list.extention_name eq '.xlsx'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--excel" title="첨부파일 다운로드" download>${file_list.file_name}</a><br /><br />
													</c:when>
													<c:when test="${file_list.extention_name eq '.jpg' || file_list.extention_name eq '.png' || 
																	file_list.extention_name eq '.gif' || file_list.extention_name eq '.bmp' || 
																	file_list.extention_name eq '.tif'}">
													<a href="#" style="cursor: pointer;"  onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--capture" title="첨부파일 다운로드" download>${file_list.file_name}</a><br /><br />
													</c:when>
													<c:otherwise>
													<a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
													class="c-notice__file-link c-notice__file-link--down" title="첨부파일 다운로드" download>${file_list.file_name}</a><br /><br />
													</c:otherwise>
													</c:choose>
													</c:if>
											</c:if>		
											</c:forEach>
											</div>

											</div>
											</c:if>
										</div>
									</div>
									<div class="c-notice2__box">
										<div class="c-notice2__cont"  style="max-width: 1000px; margin: 0 auto;">
										<div align="center">
									<c:forEach var="file_list" items="${file_list}"  varStatus="status">
											<c:if test="${file_list.use_yn eq 'Y'}">
											<c:if test="${file_list.extention_name eq '.jpg' ||
														  file_list.extention_name eq '.png' || 
														  file_list.extention_name eq '.gif' || 
														  file_list.extention_name eq '.bmp' || 
														  file_list.extention_name eq '.tif'}">
											
												<img style="display: block;" src="resources/board/bid/${file_list.file_name2}" alt="${board_detail.title}">
											</c:if>
											</c:if>
									</c:forEach>
									</div>
									<div>
										<br />
										${board_detail.content}
										<br />
										</div>
										</div>

									</div>
								</div>
								<div class="writings">
									<c:forEach var="preView" items="${preView}"  varStatus="status">
									<a href="bid-body.do?board_id=${preView.board_id}&seq_id=${preView.seq_id}"
										class="writing__box writing__box--prev">
										<div class="writing__key">이전 글</div>
										<div class="writing__value">
										<div class="writing__link">${preView.title}</div>
										</div>
									</a> 
									</c:forEach>
								
									<c:forEach var="nextView" items="${nextView}"  varStatus="status">	
									<a href="bid-body.do?board_id=${nextView.board_id}&seq_id=${nextView.seq_id}"
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
						<div class="c-section">
							<div class="c-buttons c-buttons--center">
								<button onclick="location.href='bid.do?board_id=4'"
									class="c-button c-button--large c-button--white">목록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // 내용-->
		</div>

		<!-- 바로가기 및 맨위로 -->
		<jsp:include page="../../sub_quick.jsp"></jsp:include>
		<!-- end -->

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>
