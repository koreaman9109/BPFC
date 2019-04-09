<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>문의사항  목록</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#customer_na').parent().addClass('m-gnb__item--active');
});
</script>
<script type="text/javascript">
		function loginPopup(seq_id){
			window.name = "inquiry.do";     
		   	window.open("passwordLoginForm.do?seq_id=" + seq_id,
		            "childForm", "width=400, height=400, resizable = no, scrollbars = no");  
		}
		
		
		function fnPopup() {
			
			var filter = "win16|win32|win64|mac";

			 

			if(navigator.platform){

			if(0 > filter.indexOf(navigator.platform.toLowerCase())){

			/* alert("Mobile"); */
		    alert("문의하기 글 작성은 PC에서 이용해주세요.");
			 
			}else{

			/* alert("PC"); */
			window.name = "Parent_window";
			window.open('inquiry_nice_iframe.do','popupChk','width=420, height=670, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			/* popgo.do */

			}

			}
			
		}
		
		
		function inquiry_go_in() {
		document.inquiry_nice_ac.submit();
		}
</script>
<script type="text/javascript">

		$(document).ready(function() {
		
		if($('#rtn').val()){
		
		alert("비밀번호가 틀립니다. 확인후 다시 이용 바랍니다.");
		}
		
		});
</script>


<script type="text/javascript">


 	
	
	$(document).ready(function() {
		
		
		
		
		/* //--검색 초기값 세팅
		$("select option[value='title']").attr("selected", true); */
		
		//--페이지 셋팅
		var totalPage = ${totalPage}; //전체 페이지
		var startPage = ${startPage}; //현재 페이지
		/* console.log("-------콘솔내용------>" + startPage); */
		
		
		var pagination = "";
	
		//--페이지네이션에 항상 10개가 보이도록 조절
		var forStart = 0;
		var forEnd = 0;
	
		if ((startPage - 5) < 1) {
			forStart = 1;
		} else {
			forStart = startPage - 5;
		}
	
		if (forStart == 1) {
	
			if (totalPage > 9) {
				forEnd = 10;
			} else {
				forEnd = totalPage;
			}
	
		} else {
	
			if ((startPage + 4) > totalPage) {
	
				forEnd = totalPage;
	
				if (forEnd > 9) {
					forStart = forEnd - 9
				}
	
			} else {
				forEnd = startPage + 4;
			}
		}
		//--페이지네이션에 항상 10개가 보이도록 조절
	
		//전체 페이지 수를 받아 돌린다.
		for (var i = forStart; i <= forEnd; i++) {
			if (startPage == i) {
				
				pagination  +=   '<li class="c-pagination__item">'+ '<a class="c-pagination__link" name="page_move" start_page="'+i+'"style="background-color: skyblue;" disabled>'
						+ i + '</a>' + '</li>';
			} else {
				pagination  +=   '<li class="c-pagination__item">' + ' <a href="#" class="c-pagination__link" name="page_move" start_page="'+i+'" style="cursor:pointer;" >'
						+ i + '</a>'  + '</li>';
			}
		}


	//하단 페이지 부분에 붙인다.
	$("#pagination").append('<ul class="c-pagination__list">' + pagination + '</ul>');
	//--페이지 셋팅
	
	//페이지 번호 클릭시 이동
	$(document).on("click","a[name='page_move']",
			function() {
				var visiblePages = 10;//리스트 보여줄 페이지
				
				$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
				$('#visiblePages').val(visiblePages);
				document.listForm.submit();
			});
	


	});
	
		$(document).ready(function() { 
		$("#searchBtn").click(function() {
			
			document.listForm.submit();
		});
	});
		
	</script>
	<script type="text/javascript">
/* document.listForm.sch_type.value = "${sch_type}"; */
  $(document).ready(function() { 
 
  	$("#sch_type > option[value="+'<c:out value="${sch_type}"/>'+"]").attr("selected","selected");

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

				<div class="s-news">
					<div class="c-align">
						<div class="s-news__searchs">
						<form name="listForm"  method="get">
											<input type="hidden" id="board_id" name="board_id" value="${board_id}">
											<input type="hidden" id="startPage" name="startPage" value="">
											<input type="hidden" id="visiblePages" name="visiblePages" value="">
																	
							<div class="s-news__search-boxs">
								<div class="s-news__search-box s-news__search-box-1">
									<div class="s-news__selects">
										<label for="s-news__select" class="is-hidden">문의사항 글 검색 선택</label>
										<select name="sch_type" id="sch_type" class="s-news__select">
										   
										    <option value="#">선택</option>
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="user_name">작성자</option>
										</select>
									</div>
								</div>
							</div>
							<div class="s-news__search-box s-news__search-box-2">
								<div class="s-news__search">
									<label for="s-news__search" class="s-news__search-label">센터소식 글 검색 입력</label>
									<input type="text" id="sch_value" name="sch_value" value="${sch_value}"	class="s-news__search-input" />
									<button class="s-news__search-button" id="searchBtn">검색버튼</button>
								</div>
							</div>
						</form>
						</div>
						
					
									
						<div class="c-section">
							<div class="c-notices">
								<div class="c-notice__utils">
									<div class="c-notices__util">Total  ${totalCnt}건 ( ${startPage} /${totalPage} ) 페이지</div>
								</div>
								<div class="c-notice__scroll">
									<table class="c-notice">
										<caption><span class="is-hidden">문의사항: 번호, 분류, 제목, 작성자, 작성일자, 조회</span></caption>
										<colgroup>
											<col style="width: 6%" />
											<col style="width: 14%" />
											<col style="width: 45%" />
											<col style="width: 10%" />
											<col style="width: 5%" />
											<col style="width: 15%" />
											<col style="width: 5%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">분류</th>
												<th scope="col">제목</th>
												<th scope="col">진행상태</th>
												<th scope="col">작성자</th>
												<th scope="col">작성일자</th>
												<th scope="col">조회</th>
											</tr>
										</thead>
										<tbody>
										<c:choose>
										<c:when test="${fn:length(inquiry_list) == 0}">												

											<tr>
												<td colspan="9" align="center">조회결과가 없습니다.</td>
											</tr>
										</c:when>
											<c:otherwise>
											<c:forEach var="inquiry_list" items="${inquiry_list}"  varStatus="status">
											<c:if test="${inquiry_list.step eq '0'}">
											<tr>
												<td>
				                                    <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
				                                    <c:set var="startpage" value="${startPage-1}" />
				                                    <c:set var="statuscount" value="${status.count }" />
				                                    ${totalCnt+1-(startpage*10+statuscount)}
				                                     </td>
																

												<td>
													<c:set var="inquiry" value="${inquiry_list.inquiry_division}" />
													<c:choose>
    													<c:when test="${inquiry eq '1'}">
        													<div class="c-notice__current c-notice__current--mint">문의</div>
    													</c:when>
    													<c:when test="${inquiry eq '2'}">
        													<div class="c-notice__current c-notice__current--purple">건의</div>
    													</c:when>
    													<c:when test="${inquiry eq '3'}">
        													<div class="c-notice__current c-notice__current--red">불만</div>
    													</c:when>
    													<c:when test="${inquiry eq '4'}">
        													<div class="c-notice__current c-notice__current--dark-red">삭제</div>
    													</c:when>
													</c:choose>

													
												</td>
																										
														<c:if test="${inquiry_list.use_yn eq 'Y'}">
														<%-- <a href="inquiry-body.do?seq_id=${inquiry_list.seq_id}" class="c-notice__link">${inquiry_list.title}</a> --%>
														<c:if test="${inquiry_list.password ne null}">
												<td class="c-notice__left">
														<a href="#" onclick="javascript:loginPopup('${inquiry_list.seq_id}');" class="c-notice__link c-notice__link--lock">${inquiry_list.title}</a>
														<!-- 'c-notice__link--lock'클래스추가하면 자물쇠 아이콘 추가 -->
												</td>
														</c:if>
														<c:if test="${inquiry_list.password eq null}">
														<td class="c-notice__left">
														<!-- 
														2018-09-28 
														오전 10:48
														수정자 박권수
														문의사항 답글 패스워드 추가
														 -->
														<%-- <a href="inquiry-body.do?seq_id=${inquiry_list.seq_id}" class="c-notice__link">${inquiry_list.title}</a> --%>
														<%-- <a href="#" onclick="javascript:loginPopup('${inquiry_list.seq_id}');" class="c-notice__link c-notice__link--lock">${inquiry_list.title}</a> --%>
														<a href="#" onclick="javascript:loginPopup('${inquiry_list.top_seq}');" class="c-notice__link c-notice__link--lock">${inquiry_list.title}</a>
														</td>
														</c:if>
														
													</c:if>
													<c:if test="${inquiry_list.use_yn ne 'Y'}">
														<c:if test="${inquiry_list.user_name2 ne null}">
														<td class="c-notice__left">
														해당 글은 사용자에 의해 삭제된 글입니다.
														</td>
														</c:if>
														<c:if test="${inquiry_list.user_name2 eq null}">
														<td class="c-notice__left">
													    &nbsp;&nbsp;&nbsp;&nbsp;☞[답글] 삭제된 답글입니다.
													    </td>
														</c:if>
													</c:if>
												
												<c:choose>	
												<c:when test="${inquiry_list.recnt eq '1'}">
												<td>진행중</td>
												</c:when>
												<c:otherwise>												
												<td>답변완료</td>
												</c:otherwise>
												</c:choose>
												
									<td>
									<c:if test="${inquiry_list.step eq '0' }">
									${inquiry_list.user_name2}
									</c:if>
									<c:if test="${inquiry_list.step eq '1' }">
									<c:choose>
									<c:when test="${inquiry_list.view_name eq null }">
									관리자
									</c:when>
									<c:otherwise>
									${inquiry_list.view_name}
									</c:otherwise>
									</c:choose>	
									</c:if>

											
												
											
												</td>
												<td>${inquiry_list.register_date}</td>
												<td>${inquiry_list.hit}</td>
											</tr>
												</c:if>
											</c:forEach>
																						
									</c:otherwise>
									</c:choose>
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="c-section c-section--x-small">
							<div class="c-buttons c-buttons--right">
								<button onclick="javascript:fnPopup();"
									class="c-button c-button--blue" title="새창열림">문의하기</button>
									
							</div>
						</div>
						<div class="c-notice__buttons">
									<!-- <button class="c-notice__button">문의하기</button> -->
								</div> 

						<c:if test="${fn:length(inquiry_list) >= 1}">
						<div class="c-pagination">
							<a href="inquiry.do?board_id=${board_id}&startPage=1&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
							<a class="c-pagination" id="pagination"></a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
							<a href="inquiry.do?board_id=${board_id}&startPage=${totalPage}&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
						</div>
						</c:if>
					</div>
				</div>
			</div>
				
			
			<!-- // 내용-->

		
		</div>
		<!-- <form action="inquiry_nice_ac.do" name="inquiry_nice_ac" method="post"> -->
		<form action="inquiry_nice_ac.do" name="inquiry_nice_ac" method="post">
			<input type="hidden" value="" name="name2" id="name2" />
			<input type="hidden" value="" name="mobileno2" id="mobileno2" />
		</form>

		<!-- 바로가기 및 맨위로 -->
		<jsp:include page="../../sub_quick.jsp"></jsp:include>
		<!-- end -->

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>



</html>
