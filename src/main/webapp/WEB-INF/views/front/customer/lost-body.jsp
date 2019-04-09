<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 	
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>분실물 안내 상세보기</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#customer_na').parent().addClass('m-gnb__item--active');
});
</script>
<script type="text/javascript">

/* 	$(document).ready(function() {
		var j = $("#file_key").val();
		var n = j.indexOf(",");
	
		if (n = -1) {
			var arr = j.split(",");
			for (var i = 0; i <= arr.length - 2; i++) {
				$("#view_fa").append("* " + arr[i] + "<br />");
			}
		}
		}); */
	
	$(document)
			.ready(
					function() {

						
 						//목록으로 가기
						
						$("#list").click(function() {
							
							location.href = "lost_list.do?board_id=6";
						}); 
				 
				

			
					

						//글수정
						$("#modify")
								.click(
										function() {
											if (confirm("수정 하시겠습니까??") == true){
											location.href = "lostBoardUpdateForm.do?seq_id=" + $("#seq_id").val();
											}else{
												return;
											}
													});
					
										
										

		/*  단일 다운만가능 가져옴 2018.04.20 박권수 */
		/* location.href="boardfiledown.do?file_name="+encodeURI("첨부파일"); */ 
						
					});
						function downFile(fileName){
							location.href="lostFileDown.do?file_name="+encodeURI(fileName);
						}
	//이중폼 보내는 방법
	 function detailSubmit(index) {
		    if (index == 1) {
				if(confirm("정말로 삭제 하시겠습니까?")) {
					document.listForm.action='lostBoardDelete.do';
					

							alert("삭제 되었습니다.");
					}else{
						alert("취소 되었습니다.");
						location.href = "lost_list.do?board_id=" + $("#board_id").val();
					}	
		    }
		    if (index == 2) {
		      document.listForm.action='#';
		    }
		    document.listForm.submit();
		  };
	
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
							<li class="c-lnb__item c-lnb__item--active"><a href="lost.do?board_id=6"
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
								class="breadcrumb__link">분실물안내</div></li>
						</ul>
					</div>
					<h3 class="c-h2">분실물안내</h3>
				</div>
			</div>
			<!-- 내용-->
		<form name="listForm"  method="get">
	 	<input type="hidden" id="seq_id" name="seq_id" value="${board_detail.seq_id}" />
		<input type="hidden" id="file_key" name="file_key" value="${file_list}" />
		<input type="hidden" id="board_id" name="board_id" value="${board_detail.board_id}" />
		</form>
			<div class="c-contents">
				<div class="s-lost">
					<div class="c-align">
						<div class="c-box__heading">분실물 정보</div>
						<div class="c-box">
							<div class="c-section">
								<div class="s-lost__infos">
									<div class="s-lost__image">
										<c:forEach var="file_list" items="${file_list}">
										<c:if test="${file_list.use_yn eq 'Y'}">
										<img src="resources/board/lost/${file_list.file_name2}" style="width: 100%; max-width: 600px; margin: 0 auto;" alt="${board_detail.title}" />
										</c:if>
											</c:forEach>
									</div>
									<div class="s-lost__info">
										<div class="s-lost__list">
											<div class="s-lost__item">
												<div class="s-lost__key">습득장소</div>
												<div class="s-lost__value">${board_detail.organization}</div>
											</div>
											<div class="s-lost__item">
												<div class="s-lost__key">습득경위</div>
												<div class="s-lost__value">${board_detail.learn}</div>
											</div>
											<div class="s-lost__item">
												<div class="s-lost__key">습득물</div>
												<div class="s-lost__value">${board_detail.title}</div>
											</div>
											<div class="s-lost__item">
												<div class="s-lost__key">습득일</div>
												<div class="s-lost__value">${board_detail.lost_date}</div>
											</div>
											<div class="s-lost__item">
												<div class="s-lost__key">담당자</div>
												<div class="s-lost__value">${board_detail.lost_name}</div>
											</div>
											<div class="s-lost__item">
												<div class="s-lost__key">연락처</div>
												<div class="s-lost__value">${board_detail.contact}</div>
											</div>
											<div class="s-lost__item">
												<div class="s-lost__key">보관장소</div>
												<div class="s-lost__value">${board_detail.storage_site}</div>
											</div>
											<div class="s-lost__item">
												<div class="s-lost__key">처리상태</div>
												<div class="s-lost__value">${board_detail.lost_status}</div>
											</div>
										</div>
									</div>
								</div>
								<div class="s-lost__txt">
									${board_detail.content}
								</div>
							</div>
							<div class="c-section c-section--small">
								<div class="c-buttons c-buttons--center">
									<button onclick="location.href='lost.do?board_id=6'"
										class="c-button c-button--large c-button--white">목록</button>
								</div>
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
