<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 	
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>BPFC 소식지 상세보기</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#customer_na').parent().addClass('m-gnb__item--active');
});
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						
 						//목록으로 가기
						
						$("#list").click(function() {
							
							location.href = "newsletter_list.do?board_id=" + $("#board_id").val();
						}); 

					});
	function downFile(fileName){
		   location.href="newsletterFileDown.do?file_name="+encodeURI(fileName);
		}
	
	
</script>
<script type="text/javascript">


			$(document).ready(function() {
			var filter = "win16|win32|win64|mac";
			
			if(navigator.platform){
			if(0 > filter.indexOf(navigator.platform.toLowerCase())){
			
				/* mobile일 경우*/
				/* $('.c-notice2__cont').remove();  */
				$('.mobile_view1').append('BPFC 소식지 미리보기는 <br />PC에서 확인하시기 바랍니다.<br /><br />');
			}else{
				/* PC일 경우 */
				$(".c-notice2__cont").append('<iframe src="<c:url value="resources/board/newsletter/${pdfFile.file_name2}"/>" width="800px" height="850px"></iframe>'); 
			}
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
		<form name="listForm"  method="get">
		<input type="hidden" id="seq_id" name="seq_id" value="${board_detail.seq_id}" />

		<input type="hidden" id="board_id" name="board_id" value="${board_detail.board_id}" />
		</form>
		<div class="c-container">
			<div class="c-lnbs">
				<div class="c-lnb">
					<div class="c-lnb__aligner">
						<h2 class="c-lnb__heading">고객마당</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a
								href="center-news.do?board_id=1" class="c-lnb__link">공지사항</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="newsletter.do?board_id=2"
								class="c-lnb__link">BPFC 소식지</a></li>
							<li class="c-lnb__item"><a href="photo.do?board_id=3"
								class="c-lnb__link">포토갤러리</a></li>
							<li class="c-lnb__item"><a href="lost.do?board_id=6"
								class="c-lnb__link">분실물안내</a></li>
							<li class="c-lnb__item"><a href="inquiry.do?board_id=5"
								class="c-lnb__link">문의사항</a></li>
							<li class="c-lnb__item"><a href="data.do?board_id=9"
								class="c-lnb__link">자료실</a></li>		
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
								class="breadcrumb__link">고객마당</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">BPFC 소식지</div></li>
						</ul>
					</div>
					<h3 class="c-h2">BPFC 소식지</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-section">
					<div class="c-align">
						<div class="s-lost__stxt">
							브라우저에서 PDF 파일을 보기를 위해서는 Acrobat Reader가 필요합니다.&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="http://get.adobe.com/kr/reader/" target="_blank" title="새창으로 열기" class="c-notice__file-link c-notice__file-link--pdf" >PDF뷰어 다운로드</a>
							<br />
						</div>
					</div>
				</div>
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
											<c:if test="${board_detail.admin_name ne null }">
											<div class="c-notice2__info">작성자 : ${board_detail.admin_name}</div>
											</c:if>
											<c:if test="${board_detail.admin_name eq null }">
											<div class="c-notice2__info">작성자 : 관리자</div>
											</c:if>
											<c:if test="${board_detail.admin_department ne null }">
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
													첨부된 파일이  없습니다.
												</c:if>
												<c:if test="${pdfFile.use_yn eq 'Y'}">
												<a href="#" style="cursor: pointer;" onclick="downFile('${pdfFile.file_name2}');"
			                                       class="c-notice__file-link c-notice__file-link--pdf" title="첨부파일 다운로드" download>${pdfFile.file_name}</a>
			                                     </c:if>
											</div>
											</div>
										</div>
									</div>
									<div align="center" class="c-notice2__box">
										<c:if test="${pdfFile.use_yn eq 'Y'}">
										<div class="c-notice2__cont">
										<%-- <iframe src="<c:url value="resources/board/newsletter/${pdfFile.file_name2}"/>" width="800px" height="850px"></iframe> --%>
										</div>
										</c:if>
										<c:if test="${board_detail.content ne null}">
										<div align="center" style="width: 800px;">
										${board_detail.content}
										</div>
										</c:if>	
								<div align="center" class="mobile_view1">
								</div>
								<br />
								<br />
								<br />
									</div>
								</div>
								<div class="writings">
									<c:forEach var="preView" items="${preView}"  varStatus="status">
									<a href="newsletter-body.do?board_id=${preView.board_id}&seq_id=${preView.seq_id}"
										class="writing__box writing__box--prev">
										<div class="writing__key">이전 글</div>
										<div class="writing__value">
										<div class="writing__link">${preView.title}</div>
										</div>
									</a> 
									</c:forEach>
								
									<c:forEach var="nextView" items="${nextView}"  varStatus="status">	
									<a href="newsletter-body.do?board_id=${nextView.board_id}&seq_id=${nextView.seq_id}"
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
							<div class="c-buttons c-buttons--center" style="padding: 0 10px; margin-top: 20px;">
								<button onclick="location.href='newsletter.do?board_id=2'"
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
