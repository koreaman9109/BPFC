<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>


<title>문의사항 상세보기</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#customer_na').parent().addClass('m-gnb__item--active');
});
</script>
		
<script>
		
/*   		 $(document).ready(function() {	
			
			
			if(("${inquiry_detail.step}") == 0){
				if(("${inquiry_detail.seq_id}") != ("${sessionScope.seq_id}")){
				  alert('잘못 된 접속 경로입니다. 다시 확인해주세요.');
				  location.href = history.go(-1); 

				  return;
			} 
				 }
					});   
		
		 */
		var openWin;
		
		 function modifyPopup(){ 
				var filter = "win16|win32|win64|mac";

				 

				if(navigator.platform){

				if(0 > filter.indexOf(navigator.platform.toLowerCase())){
					alert("문의하기 글 수정은 PC에서 이용해주세요.");
				}else if (confirm("수정 하시겠습니까??") == true){
					// window.name = "부모창 이름"; 
		            window.name = "inquiry-body.do?seq_id=" + "${inquiry_detail.seq_id}";
		            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
		            openWin = window.open("passwordUpdateForm.do?seq_id=" + "${inquiry_detail.seq_id}",
		                    "childForm", "width=400, height=400, resizable = no, scrollbars = no");  
			}  else{
				return;
			}
			}
			}
			
			function deletePopup(){  
				var filter = "win16|win32|win64|mac";

				 

				if(navigator.platform){

				if(0 > filter.indexOf(navigator.platform.toLowerCase())){
					alert("문의하기 글 삭제는 PC에서 이용해주세요.");
				}else if (confirm("삭제 하시겠습니까??") == true){
					// window.name = "부모창 이름"; 
		            window.name = "inquiry-body.do?seq_id=" + "${inquiry_detail.seq_id}";
		            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
		            openWin = window.open("passwordDeleteForm.do?seq_id=" + "${inquiry_detail.seq_id}",
		                    "childForm", "width=400, height=400, resizable = no, scrollbars = no");  
			}  else{
				return;
			}
			}
			}
		
	    
        
		
		
		function setChildText(){
            openWin.document.getElementById("seq_id").value = document.getElementById("seq_id").value;
        }
 

		function downFile(fileName){
			location.href="inquiryUserFileDown.do?file_name="+encodeURI(fileName);
		}
		
		function downFile2(fileName){
			location.href="inquiryFileDown.do?file_name="+encodeURI(fileName);
		}
		



	
</script>
<script type="text/javascript">

		$(document).ready(function() {
		
		if($('#rtn').val()){
		
		alert("비밀번호가 틀립니다. 확인후 다시 이용 바랍니다.");
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
						<h2 class="c-lnb__heading">고객마당</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a
								href="center-news.do?board_id=1" class="c-lnb__link">공지사항</a></li>
							<li class="c-lnb__item"><a href="newsletter.do?board_id=2"
								class="c-lnb__link">BPFC 소식지</a></li>
							<li class="c-lnb__item"><a href="photo.do?board_id=3"
								class="c-lnb__link">포토갤러리</a></li>
							<li class="c-lnb__item"><a href="lost.do?board_id=6"
								class="c-lnb__link">분실물안내</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="inquiry.do?board_id=5"
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
								class="breadcrumb__link">문의사항</div></li>
						</ul>
					</div>
					<h3 class="c-h2">문의사항</h3>
				</div>
			</div>
			<!-- 내용-->
			<input type="hidden" id="rtn" name="rtn" value="${rtn}" >
			<div class="c-contents">
				<input type="hidden" id="step" name="step" value="${inquiry_detail.step}">
				<div class="r-recruit">
					<div class="c-align">
						<!-- 원글  -->
						<c:forEach var="inquiry_detail2" items="${inquiry_detail2}"  varStatus="status">					
						<div class="c-section">
							<div class="c-box">
								<div class="c-notice2">
									<div class="c-notice2__box">
										<c:if test="${inquiry_detail2.step eq 0 }">
										<div class="c-notice2__heading">${inquiry_detail2.title}</div>
										</c:if>
										<c:if test="${inquiry_detail2.step ne 0 }">
										<div class="c-notice2__heading">[답글] ${inquiry_detail2.title}</div>
										</c:if>
									</div>
									<div class="c-notice2__box">
										<div class="c-notice2__infos">
											<c:if test="${inquiry_detail2.user_name ne null}">
											<div class="c-notice2__info">작성자 : ${inquiry_detail2.user_name}</div>
											</c:if>
											<c:if test="${inquiry_detail2.user_name eq null}">
											<c:if test="${inquiry_detail2.admin_name ne null}">
											<div class="c-notice2__info">작성자 : ${inquiry_detail2.admin_name}</div>
											</c:if>
											<c:if test="${inquiry_detail2.admin_name eq null}">
											<div class="c-notice2__info">작성자 : 관리자</div>
											</c:if>
											<c:if test="${inquiry_detail2.admin_department ne null}">
											<div class="c-notice2__info">담당 부서 : ${inquiry_detail2.admin_department}</div>
											</c:if>
											</c:if>
											<div class="c-notice2__info">작성일자 : ${inquiry_detail2.register_date}</div>
											<c:if test="${inquiry_detail2.step eq '0' }">
											<div class="c-notice2__info">조회 : ${inquiry_detail2.hit}</div>
											</c:if>

										</div>
									</div>
									
									<div class="c-notice2__box">
										<div class="c-notice__files">
											<div class="c-notice__file">첨부파일</div>
											<div class="c-notice__file">
											<c:if test="${fn:length(file_list) == 0}">												
													첨부된 파일이  없습니다.
											</c:if>
											<c:forEach var="file_list" items="${file_list}"  varStatus="status">
											<c:if test="${file_list.use_yn eq 'Y'}">
											<c:if test="${inquiry_detail2.step eq '0' }">
													
													<c:if test="${inquiry_detail2.use_yn_file eq 'Y' }">		
													
													<c:choose>
													<c:when test="${inquiry_detail2.extention_name eq '.hwp'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--hangle" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:when>
													<c:when test="${inquiry_detail2.extention_name eq '.pdf'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--pdf" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:when>
													<c:when test="${inquiry_detail2.extention_name eq '.pptx'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--ppt" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:when>
													<c:when test="${inquiry_detail2.extention_name eq '.xlsx'}">
													<a href="#" style="cursor: pointer;" onclick="downFile('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--excel" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:when>
													<c:when test="${inquiry_detail2.extention_name eq '.jpg' || inquiry_detail2.extention_name eq '.png' || 
																	inquiry_detail2.extention_name eq '.gif' || inquiry_detail2.extention_name eq '.bmp' || 
																	inquiry_detail2.extention_name eq '.tif'}">
													<a href="#" style="cursor: pointer;"  onclick="downFile('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--capture" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:when>
													<c:otherwise>
													<a href="#" style="cursor: pointer;" onclick="downFile('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--down" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:otherwise>
													</c:choose>
													
													</c:if>
											</c:if>
											<c:if test="${inquiry_detail2.step eq '1' }">
											
												<c:if test="${inquiry_detail2.use_yn_file eq 'Y' }">	
											
													<c:choose>
													<c:when test="${inquiry_detail2.extention_name eq '.hwp'}">
													<a href="#" style="cursor: pointer;" onclick="downFile2('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--hangle" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:when>
													<c:when test="${inquiry_detail2.extention_name eq '.pdf'}">
													<a href="#" style="cursor: pointer;" onclick="downFile2('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--pdf" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:when>
													<c:when test="${inquiry_detail2.extention_name eq '.pptx'}">
													<a href="#" style="cursor: pointer;" onclick="downFile2('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--ppt" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:when>
													<c:when test="${inquiry_detail2.extention_name eq '.xlsx'}">
													<a href="#" style="cursor: pointer;" onclick="downFile2('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--excel" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:when>
													<c:when test="${inquiry_detail2.extention_name eq '.jpg' || inquiry_detail2.extention_name eq '.png' || 
																	inquiry_detail2.extention_name eq '.gif' || inquiry_detail2.extention_name eq '.bmp' || 
																	inquiry_detail2.extention_name eq '.tif'}">
													<a href="#" style="cursor: pointer;"  onclick="downFile2('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--capture" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:when>
													<c:otherwise>
													<a href="#" style="cursor: pointer;" onclick="downFile2('${inquiry_detail2.file_name2}');"
													class="c-notice__file-link c-notice__file-link--down" title="첨부파일 다운로드" download>${inquiry_detail2.file_name}</a>
													</c:otherwise>
													</c:choose>
													
													</c:if>
													
													<c:if test="${inquiry_detail2.use_yn_file ne 'Y' }">
														첨부된 파일이 없습니다.
													</c:if>
													
											</c:if>		
													
											</c:if>
													</c:forEach>
													
								
											</div>
										</div>
									</div>
									<div class="c-notice2__box">
										<div class="c-notice2__cont">${inquiry_detail2.content}</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 목록 -->
						<div class="c-section c-section--small">
							<div class="c-buttons c-buttons--justify">
								<div class="c-buttons__left">
									<button onclick="location.href='inquiry.do?board_id=5'"
										class="c-button c-button--small c-button--white">목록</button>
								</div>
								<div class="c-buttons__right">
									<c:if test="${inquiry_detail2.step eq '0' }">
									<button id="modifyPopup" name="modifyPopup" onclick="javascript:modifyPopup();"
										class="c-button c-button--small c-button--white" title="새창열림">수정</button>
									<button id="deletePopup" name="deletePopup" onclick="javascript:deletePopup();"
										class="c-button c-button--small c-button--white" title="새창열림">삭제</button>
									</c:if>

								</div>
							</div>
						</div>
						</c:forEach>
						
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
