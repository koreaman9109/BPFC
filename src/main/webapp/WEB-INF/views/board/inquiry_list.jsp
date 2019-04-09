<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/board.css" rel="stylesheet"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/recruit/recruit.js"></script>
<title>문의사항 목록</title>
<script type="text/javascript">
	
	$(document).ready(function() {
						//--페이지 셋팅
						var totalPage = ${totalPage}; //전체 페이지
						var startPage = ${startPage}; //현재 페이지
						
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
								
								pagination  +=  '<li class="c-pagination__item">'+ '<a class="c-pagination__link" name="page_move" start_page="'+i+'"style="background-color: skyblue;" disabled>'
										+ i + '</a>' + '</li>';
							} else {
								pagination += '<li class="c-pagination__item">' + ' <a class="c-pagination__link" name="page_move" start_page="'+i+'" style="cursor:pointer;" >'
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
	
	
						// 체크박스 선택제어
						$(document).ready(function() {
									$("#product_check_all").click(function() {
										
												var chk = $(this).is(":checked");
												if (chk) {
													$('input[name*="seq_id"]').prop('checked',true);
												} else {
													$('input[name*="seq_id"]').prop('checked',false);
												}
											});		
						});
						
						$(document).ready(function() { 
							$("#searchBtn").click(function() {
								document.listForm.submit();
							
							});
							

							//게시물 등록 클릭
							$("#write").click(function() {
								location.href = "inquiry_write.do?board_id=" + $("#board_id").val();
							});
						 }); 
					
						//체크박스 값 확인
						function checkboxSelectCount(obj) {
						    var i, sum=0, tag=[], str="";
						    var chk = document.getElementsByName(obj);
						    var tot = chk.length;
						    for (i = 0; i < tot; i++) {
						        if (chk[i].checked == true) {
						            tag[sum] = chk[i].value;
						            sum++;
						        }
						    }
						    str += "선택갯수 : "+sum;
						    if(tag.length > 0) str += "\n값 : "+tag.join(",");
						    alert(str);
						};
						
						function all_check() {

							var chk = $(this).prop("disabled");
							$('input:checkbox[name="check_box"]').each(function() {

								if (chk) {
									$('input[name="check_box"]').each(function() {
										var opt = $(this).prop("disabled");
										if (!opt) {
											$(this).attr("checked", true);
										}
									});
								} else {
									$("input[name='check_box']").attr("checked", false);
								}
							});
						};

						
						// 버튼 선택 제어 
						function checkboxSelectQue(n, obj) {
							var i;
							var chk = document.getElementsByName(obj);
							var tot = chk.length;
							for (i = 0; i < tot; i++) {
								if (n == 1)
									chk[i].checked = true;
								if (n == 2)
									chk[i].checked = false;
							}
						};
						
						//이중폼 보내는 방법
						 function detailSubmit(index) {
							    if (index == 1) {
							    	//체크박스 선택에 따른 삭제 유무
							    	
									 if(confirm("정말로 삭제 하시겠습니까?") == true) {
										if($('input:checkbox[id="checkOne"]').is(":checked") == true)  {
								           document.listForm.action='inquiryListDelete.do';
												alert("삭제 되었습니다.");
								          } else{
								            alert("삭제하실 목록을 체크하여 주십시오.")
								            return;
								             }
												
										
										}else{
											alert("취소 되었습니다.");
											return;
										}	  
							    }
							    if (index == 2) {
							      document.listForm.action='#';
							    }
							    document.listForm.submit();
							  };
							  
							
						

			
</script>
<script type="text/javascript">
/* document.listForm.sch_type.value = "${sch_type}"; */
  $(document).ready(function() { 
 
	  var i = $("#hidden_type").val();
		$("#sch_type > option[value='"+i+"']").attr("selected","selected");

  });

 
	</script>
<style>
.mouseOverHighlight {
	cursor: pointer !important;
	color: blue;
	pointer-events: auto;
}

</style>
</head>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
		<div class="left" style="height: 100%;">
		<jsp:include page="../board/board_submenu.jsp"></jsp:include></div>
		<!--  	<div class="right"><h1>센터소식 페이지</h1></div> -->
		<form name="listForm"  method="get">
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">

       			<h1>문의사항</h1>
   	
				<table style="border: 0; width: 900px;">				
					<tr>
					<td colspan="2" align="left" width="100px">TOTAL : ${totalCnt}건 ( ${startPage} / ${totalPage} ) 페이지</td>
					<td colspan="5" align="right">
					
			 					<select class="selectForm" name="sch_type" id="sch_type" >
		 							<option value="#">선택</option>
		 							<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="admin_id">작성자</option>
								</select> 
								
								<input type="text" class="searchForm" id="sch_value" name="sch_value" value="${sch_value}"/>
								<input class="btn btn-primary" type="button" id="searchBtn" value="검색"/>
								<input type="hidden" value="${sch_type}" id="hidden_type" />
						
					</td>
					</tr>
					</table>
					<br>
					
				<!-- <form name="delete_list_check" action="delete_list_check.do" method="get"> -->
				<input type="hidden" id="board_id" name="board_id" value="${board_id}">
				<input type="hidden" id="startPage" name="startPage" value="">
				<input type="hidden" id="visiblePages" name="visiblePages" value="">
				<input type="hidden" id="admin_name" name="admin_name"  value="${sessionScope.admin_name}" />
				<input type="hidden" id="admin_department" name="admin_department"  value="${sessionScope.admin_department}" />
					
				<table class="table table-hover">
					<tr class="table-info" align="center">
						<td align="center" width="50px">
							<input type="checkbox" id="product_check_all"/> 
						</td>
						<td align="center" width="50px">No</td>
						<td align="center" width="100px">분류</td>
						<td align="center" width="450px">제목</td>
						<td align="center" width="200px">진행상태</td>
						<td align="center" width="200px">작성자</td>
						<td align="center" width="110px">조회수</td>
						<td align="center" width="200px">등록일자</td>
						<!--  <td align="center" width="60px">수&nbsp;&nbsp;정</td> -->
						<!--  <td align="center" width= "60px">삭&nbsp;&nbsp;제</td> -->
<!-- 						<td align="center" width="89px">미리보기</td> -->

					</tr>
					<c:choose>
						<c:when test="${fn:length(inquiry_list) == 0}">												
							<tr>
								<td colspan="7" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="inquiry_list" items="${inquiry_list}"  varStatus="status">
								<tr>
									<td align="center">
									<input type="checkbox" id="checkOne" name="seq_id" value="${inquiry_list.seq_id}"/>
									<input type="hidden" id="top_seq" name="top_seq" value="${inquiry_list.top_seq}" >
									</td>
									<%-- <td align="center">${inquiry_list.num}</td> --%>
									<td align="center">
                                    <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                                    <c:set var="startpage" value="${startPage-1}" />
                                    <c:set var="statuscount" value="${status.count }" />
                                    ${totalCnt+1-(startpage*10+statuscount)}
                                     </td>
                                    <td align="center">
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
									<td>
									<a id="title" class="mouseOverHighlight" onclick="location.href='inquiry_detail.do?board_id=${inquiry_list.board_id}&seq_id=${inquiry_list.seq_id}'">&nbsp;${inquiry_list.title}</a>
									</td>
									</c:if>
									<c:if test="${inquiry_list.use_yn ne 'Y'}">
									<c:if test="${inquiry_list.user_name2 ne null }">
														<td>
														<a id="title" class="mouseOverHighlight" onclick="location.href='inquiry_detail.do?board_id=${inquiry_list.board_id}&seq_id=${inquiry_list.seq_id}'">삭제된 글입니다.</a>
														</td>
									</c:if>
									<c:if test="${inquiry_list.user_name2 eq null}">
														<td class="c-notice__left">
														<a id="title" class="mouseOverHighlight" onclick="location.href='inquiry_detail.do?board_id=${inquiry_list.board_id}&seq_id=${inquiry_list.seq_id}'">&nbsp;&nbsp;&nbsp;&nbsp;☞[답글] 삭제된 답글입니다.</a>
													    </td>
									</c:if>				
									</c:if>
									<c:if test="${inquiry_list.step eq '0' }">
									<c:choose>
									<c:when test="${inquiry_list.recnt eq '1'}">
									<td align="center">진행중</td>
									</c:when>
									<c:otherwise>												
									<td align="center">답변완료</td>
									</c:otherwise>
									</c:choose>
									</c:if>
									<c:if test="${inquiry_list.step ne '0' }">
									<td></td>
									</c:if>
									<c:if test="${inquiry_list.step eq '0' }">
									<td align="center">${inquiry_list.user_name2}</td>
									</c:if>
									<c:if test="${inquiry_list.step eq '1' }">
									<c:choose>
									<c:when test="${inquiry_list.admin_name eq null }">
									<td align="center">관리자</td>
									</c:when>
									<c:otherwise>
									<td align="center">${inquiry_list.admin_name}</td>
									</c:otherwise>
									</c:choose>	
									</c:if>
									
									
									
								
									<td align="center">${inquiry_list.hit}</td>
									<td align="center">${inquiry_list.register_date}</td>
									<!--  <td align="center"><button
											id="modify" name="modify">수정</button></td> -->
									<!--  <td align="center"><button>삭제</button></td> -->
									<td align="center">
									<%-- <input type="button" name="preview" id="${inquiry_list.seq_id}" onclick="location.href='inquiry_detail.do?seq_id=${inquiry_list.seq_id}'" value="미리보기" /> --%>
									</td>		
									
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				
				<div style="padding-top: 30px;" align="center">
					<table style="width: 900px;">
						<tr>
							<td align="left">
							<!-- <input style="font-size: small; margin: 10px;" type="button" id="product_check_all_btn"/> -->
							   <!-- 	<button style="font-size: small;" type="button" name="checkAll" >전체선택</button> -->
							   <input class="btn btn-primary" type="button" value="전체선택" onclick="checkboxSelectQue(1,'seq_id')" />
							   <input class="btn btn-primary" type="button" value="전체해제" onclick="checkboxSelectQue(2,'seq_id')" /> 
							   <!-- <input style="font-size: small;" type="button" value="선택갯수 및 값 확인" onclick="checkboxSelectCount('seq_id')" /> -->
							<!--  	<button style="font-size: small;" type="button" id="#" name="#">선택해제</button>  -->
							</td>
							
							<td align="right">
							<c:set var="auth" value="${auth}" />
							<c:choose>
					    		<c:when test="${auth eq '1'}">
									<input class="btn btn-primary" type="button" value="게시물 삭제" id="delete" name="delete" onclick="detailSubmit(1)" />
									<!-- <input class="btn btn-primary" type="button" value="게시물 등록" id="write" name="write" /> -->
					    		</c:when>
							</c:choose> 
								
							</td>
						</tr>
					</table>
				</div>
			</div>
				<!-- 페이징 view -->
						<div class="c-pagination" align="center" style="padding-left: 200px; padding-bottom:100px; margin-top:-27px; width: auto;">
							<a href="inquiry_list.do?board_id=${board_id}&startPage=1&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
							<a href="#" class="c-pagination" id="pagination"> </a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
							<a href="inquiry_list.do?board_id=${board_id}&startPage=${totalPage}&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
				</div>
				<!-- 페이징 end -->	
				<br>
				</form>
</body>
</html>
