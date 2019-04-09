<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE>
<html>
<head>
<link href="css/board.css" rel="stylesheet"> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/recruit/recruit.js"></script>
<title>휴지통 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>

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
										if($('input:checkbox[id="checkOne"]').is(":checked") == true)  {
							    	if(confirm("휴지통에 저장된 게시물 및 파일을 완전히 삭제하시겠습니까?") == true){
									if(confirm("휴지통에서 삭제된 게시물 및 파일은 다시 복구 할 수 없습니다. 그래도 삭제 하시겠습니까?") == true) {
								           document.listForm.action='boardDelListDelete.do';
											  alert("삭제 되었습니다.");
								             }else{
								        	  alert("취소 되었습니다.");
								            return;
								             }
												
											}else{
												alert("취소 되었습니다.");
												return;
											}	
										}else{
											alert("삭제하실 게시물을 체크하여 주십시오.")
											return;
										}	
							    
							    }
							    if (index == 2) {
							    	//체크박스 선택에 따른 복구 유무
									if($('input:checkbox[id="checkOne"]').is(":checked") == true)  {
									if(confirm("삭제된 게시물을 복구 하시겠습니까?") == true) {
										if(confirm("휴지통에서 복구된 게시물 및 파일은 수정한 파일까지 모두 복구됩니다. 그래도 복구 하시겠습니까?") == true) {
								           document.listForm.action='boardDelListRestore.do';
											alert("복구 되었습니다.");
								          }else{
								        	alert("취소 되었습니다.");
								            return;
								             }
											}else{
											alert("취소 되었습니다.");
											return;
										}		
										
										}else{
											alert("복구하실 목록을 체크하여 주십시오.")
											return;
										}	
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
		<jsp:include page="../setting_submenu.jsp"></jsp:include></div>
		
				<form name="listForm"  method="get">
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		
			<h1>휴지통</h1>
    		
				
				<table  style="border: 0; width: 900px;">		
					<tbody>	
					<tr>
					<td colspan="2" align="left" width="100px">TOTAL : ${totalCnt}건 ( ${startPage} / ${totalPage} )</td>
					<td>
					<c:if test="${board_id eq '1' }">
					<select class="selectForm" name="searchOption" id="searchOption" onchange="location.href=this.value">
					<option value="">선택</option>
					<option value="del_list.do?board_id=1" selected="selected">공지사항</option>
					<option value="del_list.do?board_id=2">BPFC 소식지</option>
					<option value="del_list.do?board_id=3">포토갤러리</option>
					<option value="del_list.do?board_id=4">입찰안내</option>
					<!-- <option value="del_list.do?board_id=5">문의사항</option> -->
					<option value="del_list.do?board_id=6">분실물안내</option>
					<option value="del_list.do?board_id=9">자료실</option>
					<option value="del_list.do?board_id=7">컨벤션센터관리</option>
					<option value="del_list.do?board_id=8">채용관리</option>
					</select> 
					</c:if>
					<c:if test="${board_id eq '2' }">
					<select class="selectForm" name="searchOption" id="searchOption" onchange="location.href=this.value">
					<option value="">선택</option>
					<option value="del_list.do?board_id=1">공지사항</option>
					<option value="del_list.do?board_id=2" selected="selected">BPFC 소식지</option>
					<option value="del_list.do?board_id=3">포토갤러리</option>
					<option value="del_list.do?board_id=4">입찰안내</option>
					<!-- <option value="del_list.do?board_id=5">문의사항</option> -->
					<option value="del_list.do?board_id=6">분실물안내</option>
					<option value="del_list.do?board_id=9">자료실</option>
					<option value="del_list.do?board_id=7">컨벤션센터관리</option>
					<option value="del_list.do?board_id=8">채용관리</option>
					</select> 
					</c:if>
					<c:if test="${board_id eq '3' }">
					<select class="selectForm" name="searchOption" id="searchOption" onchange="location.href=this.value">
					<option value="">선택</option>
					<option value="del_list.do?board_id=1">공지사항</option>
					<option value="del_list.do?board_id=2">BPFC 소식지</option>
					<option value="del_list.do?board_id=3" selected="selected">포토갤러리</option>
					<option value="del_list.do?board_id=4">입찰안내</option>
					<!-- <option value="del_list.do?board_id=5">문의사항</option> -->
					<option value="del_list.do?board_id=6">분실물안내</option>
					<option value="del_list.do?board_id=9">자료실</option>
					<option value="del_list.do?board_id=7">컨벤션센터관리</option>
					<option value="del_list.do?board_id=8">채용관리</option>
					</select> 
					</c:if>
					<c:if test="${board_id eq '4' }">
					<select class="selectForm" name="searchOption" id="searchOption" onchange="location.href=this.value">
					<option value="">선택</option>
					<option value="del_list.do?board_id=1">공지사항</option>
					<option value="del_list.do?board_id=2">BPFC 소식지</option>
					<option value="del_list.do?board_id=3">포토갤러리</option>
					<option value="del_list.do?board_id=4" selected="selected">입찰안내</option>
					<!-- <option value="del_list.do?board_id=5">문의사항</option> -->
					<option value="del_list.do?board_id=6">분실물안내</option>
					<option value="del_list.do?board_id=9">자료실</option>
					<option value="del_list.do?board_id=7">컨벤션센터관리</option>
					<option value="del_list.do?board_id=8">채용관리</option>
					</select> 
					</c:if>
					<c:if test="${board_id eq '5' }">
					<select class="selectForm" name="searchOption" id="searchOption" onchange="location.href=this.value">
					<option value="">선택</option>
					<option value="del_list.do?board_id=1">공지사항</option>
					<option value="del_list.do?board_id=2">BPFC 소식지</option>
					<option value="del_list.do?board_id=3">포토갤러리</option>
					<option value="del_list.do?board_id=4">입찰안내</option>
					<!-- <option value="del_list.do?board_id=5" selected="selected">문의사항</option> -->
					<option value="del_list.do?board_id=6">분실물안내</option>
					<option value="del_list.do?board_id=9">자료실</option>
					<option value="del_list.do?board_id=7">컨벤션센터관리</option>
					<option value="del_list.do?board_id=8">채용관리</option>
					</select> 
					</c:if>
					<c:if test="${board_id eq '6' }">
					<select class="selectForm" name="searchOption" id="searchOption" onchange="location.href=this.value">
					<option value="">선택</option>
					<option value="del_list.do?board_id=1">공지사항</option>
					<option value="del_list.do?board_id=2">BPFC 소식지</option>
					<option value="del_list.do?board_id=3">포토갤러리</option>
					<option value="del_list.do?board_id=4">입찰안내</option>
					<!-- <option value="del_list.do?board_id=5">문의사항</option> -->
					<option value="del_list.do?board_id=6" selected="selected">분실물안내</option>
					<option value="del_list.do?board_id=9">자료실</option>
					<option value="del_list.do?board_id=7">컨벤션센터관리</option>
					<option value="del_list.do?board_id=8">채용관리</option>
					</select> 
					</c:if>
					<c:if test="${board_id eq '7' }">
					<select class="selectForm" name="searchOption" id="searchOption" onchange="location.href=this.value">
					<option value="">선택</option>
					<option value="del_list.do?board_id=1">공지사항</option>
					<option value="del_list.do?board_id=2">BPFC 소식지</option>
					<option value="del_list.do?board_id=3">포토갤러리</option>
					<option value="del_list.do?board_id=4">입찰안내</option>
					<!-- <option value="del_list.do?board_id=5">문의사항</option> -->
					<option value="del_list.do?board_id=6">분실물안내</option>
					<option value="del_list.do?board_id=9">자료실</option>
					<option value="del_list.do?board_id=7" selected="selected">컨벤션센터관리</option>
					<option value="del_list.do?board_id=8">채용관리</option>
					</select> 
					</c:if>
					<c:if test="${board_id eq '8' }">
					<select class="selectForm" name="searchOption" id="searchOption" onchange="location.href=this.value">
					<option value="">선택</option>
					<option value="del_list.do?board_id=1">공지사항</option>
					<option value="del_list.do?board_id=2">BPFC 소식지</option>
					<option value="del_list.do?board_id=3">포토갤러리</option>
					<option value="del_list.do?board_id=4">입찰안내</option>
					<!-- <option value="del_list.do?board_id=5">문의사항</option> -->
					<option value="del_list.do?board_id=6">분실물안내</option>
					<option value="del_list.do?board_id=9">자료실</option>
					<option value="del_list.do?board_id=7">컨벤션센터관리</option>
					<option value="del_list.do?board_id=8" selected="selected">채용관리</option>
					</select> 
					</c:if>
					<c:if test="${board_id eq '9' }">
					<select class="selectForm" name="searchOption" id="searchOption" onchange="location.href=this.value">
					<option value="">선택</option>
					<option value="del_list.do?board_id=1">공지사항</option>
					<option value="del_list.do?board_id=2">BPFC 소식지</option>
					<option value="del_list.do?board_id=3">포토갤러리</option>
					<option value="del_list.do?board_id=4">입찰안내</option>
					<!-- <option value="del_list.do?board_id=5">문의사항</option> -->
					<option value="del_list.do?board_id=6">분실물안내</option>
					<option value="del_list.do?board_id=9" selected="selected">자료실</option>
					<option value="del_list.do?board_id=7">컨벤션센터관리</option>
					<option value="del_list.do?board_id=8">채용관리</option>
					</select> 
					</c:if>
					</td>
												<!-- 검색 view  -->
					<td colspan="5" align="right">
 					<select class="selectForm" name="sch_type" id="sch_type" >
					<c:if test="${board_id eq '1' || board_id eq '2' || board_id eq '3' || board_id eq '4' || board_id eq '5' || board_id eq '6' || board_id eq '9'}">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="admin_id">작성자</option>
					</c:if>
					<c:if test="${board_id eq '7'}">
						<option value="event_name">행사명</option>
						<option value="con_place">행사장소</option>
						<option value="con_division">구분</option>
					</c:if>
					<c:if test="${board_id eq '8'}">
						<option value="title">공고명</option>
<!-- 					<option value="con_place">행사장소</option>
						<option value="con_division">구분</option> -->
					</c:if>
					</select> 
					<input type="text" class="searchForm" id="sch_value" name="sch_value" value="${sch_value}"/>
					<input class="btn btn-secondary" type="button" id="searchBtn" value="검색"/>
					<input type="hidden" value="${sch_type}" id="hidden_type" />
					
					</td>
					<!-- 검색 end  -->
				
					</tr>
					</tbody>
					</table>
					<br>
					
				<!-- <form name="delete_list_check" action="delete_list_check.do" method="get"> -->
				<input type="hidden" id="startPage" name="startPage" value="">
				<input type="hidden" id="visiblePages" name="visiblePages" value="">
				<input type="hidden" id="board_id" name="board_id" value="${board_id}">
					
				<table class="table table-hover">
					<tr class="table-info" align="center">
						<td align="center" width="30px">
							<input type="checkbox" id="product_check_all"/> 
						</td>
						<td align="center" width="50px">No</td>
						<c:if test="${board_id eq '1' || board_id eq '2' || board_id eq '3' || board_id eq '4' || board_id eq '5' || board_id eq '6' || board_id eq '9'}">
						<td align="center" width="120px">작성자</td>
						<td align="center" width="240px">제목</td>
						<td align="center" width="100px">조회수</td>
						<td align="center" width="180px">삭제일자</td>
						</c:if>
						<c:if test="${board_id eq '7'}">
						<td align="center" width="120px">행사장소</td>
						<td align="center" width="240px">행사명</td>
						<td align="center" width="100px">구분</td>
						<td align="center" width="180px">종료일자</td>
						</c:if>
						<c:if test="${board_id eq '8'}">
						<td align="center" width="120px">구분</td>
						<td align="center" width="240px">공고명</td>
						<td align="center" width="100px">조회수</td>
						<td align="center" width="180px">등록일자</td>
						</c:if>
						<!--  <td align="center" width="60px">수&nbsp;&nbsp;정</td> -->
						<!--  <td align="center" width= "60px">삭&nbsp;&nbsp;제</td> -->
<!-- 						<td align="center" width="89px">미리보기</td> -->

					</tr>
					<c:choose>
						<c:when test="${fn:length(board_list) == 0}">												
							<tr>
								<td colspan="9" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="board_list" items="${board_list}"  varStatus="status">
								<tr>
									
									<td align="center">
									<c:if test="${board_id eq '1' || board_id eq '2' || board_id eq '3' || board_id eq '4' || board_id eq '5' || board_id eq '6' || board_id eq '9'}">
									<input type="checkbox" id="checkOne" name="seq_id" value="${board_list.seq_id}"/>
									</c:if>
									<c:if test="${board_id eq '7'}">
									<input type="checkbox" id="checkOne" name="seq_id" value="${board_list.con_no}"/>
									</c:if>
									<c:if test="${board_id eq '8'}">
									<input type="checkbox" id="checkOne" name="seq_id" value="${board_list.all_no}"/>
									</c:if>
									<!-- <input type="checkbox"  name="checkOne" /> -->
									</td>
									<%-- <td align="center">${board_list.num}</td> --%>
									<td align="center">
                                    <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                                    <c:set var="startpage" value="${startPage-1}" />
                                    <c:set var="statuscount" value="${status.count }" />
                                    ${totalCnt+1-(startpage*10+statuscount)}
                                    </td>
									
									<c:if test="${board_id eq '1' || board_id eq '2' || board_id eq '3' || board_id eq '4' || board_id eq '5' || board_id eq '6' || board_id eq '9'}">
									<td align="center">${board_list.update_id}</td>
									</c:if>
									<c:if test="${board_id eq '7'}">
									<td align="center">${board_list.con_place}</td>
									</c:if>
									<c:if test="${board_id eq '8'}">
									<td align="center"><c:set var="ch" value="${boardList.chec}" />
										<c:if test="${ch eq '1' }">
											<span class="badge badge-success">모집중</span>
										</c:if>
									    <c:if test="${ch ne '1' }">
											<span class="badge badge-danger">마감</span>
										</c:if>
									</td>
									</c:if>
									
									<c:if test="${board_id eq '1' || board_id eq '2' || board_id eq '3' || board_id eq '4' || board_id eq '5' || board_id eq '6' || board_id eq '9'}">
									<td>
									<a id="title" class="mouseOverHighlight" onclick="location.href='del_detail.do?board_id=${board_list.board_id}&seq_id=${board_list.seq_id}'">${board_list.title}</a>
									</td>
									</c:if>
									<c:if test="${board_id eq '7'}">
									<td>
									<a href="#" id="title" class="mouseOverHighlight">${board_list.event_name}</a>
									</td>
									</c:if>
									<c:if test="${board_id eq '8'}">
									<td>
									<a href="#" id="title" class="mouseOverHighlight">${board_list.title}</a>
									</td>
									</c:if>
									
									<c:if test="${board_id eq '1' || board_id eq '2' || board_id eq '3' || board_id eq '4' || board_id eq '5' || board_id eq '6' || board_id eq '9'}">
									<td align="center">${board_list.hit}</td>
									</c:if>
									<c:if test="${board_id eq '7'}">
									<td align="center">${board_list.con_division}</td>
									</c:if>
									<c:if test="${board_id eq '8'}">
									<td align="center">${board_list.check_no}</td>
									</c:if>
									
									<c:if test="${board_id eq '1' || board_id eq '2' || board_id eq '3' || board_id eq '4' || board_id eq '5' || board_id eq '6' || board_id eq '9'}">
									<td align="center">${board_list.update_date}</td>
									</c:if>
									<c:if test="${board_id eq '7'}">
									<td align="center">${board_list.con_end_date}</td>
									</c:if>
									<c:if test="${board_id eq '8'}">
									<td align="center">${board_list.day}</td>
									</c:if>
									
										
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>		
				</table>
				</div>
				<div style="padding-top: 30px;" align="center">
					<table width="900px">
						<tr>
							<td align="left">
							<!-- <input style="font-size: small; margin: 10px;" type="button" id="product_check_all_btn"/> -->
							   <!-- 	<button style="font-size: small;" type="button" name="checkAll" >전체선택</button> -->
							   <input class="btn btn-primary" style="font-size: small;" type="button" value="전체선택" onclick="checkboxSelectQue(1,'seq_id')" />
							   <input class="btn btn-primary" style="font-size: small;" type="button" value="전체해제" onclick="checkboxSelectQue(2,'seq_id')" /> 
							   <!-- <input style="font-size: small;" type="button" value="선택갯수 및 값 확인" onclick="checkboxSelectCount('seq_id')" /> -->
							   <!-- <button style="font-size: small;" type="button" id="#" name="#">선택해제</button> -->
							</td>
					<td align="right">
					
							<!-- <input style="font-size: small;" type="button" value="게시물 삭제" id="listDelBtn" name="listDelBtn"  /> 20180404 16:07 권수 --> 
							


					        		<input class="btn btn-primary" style="font-size: small;" type="button" value="게시물 삭제" id="listDelBtn" name="listDelBtn" onclick="detailSubmit(1)" />
									<input class="btn btn-primary" style="font-size: small;" type="button" value="게시물 복구" id="restore" name="restore" onclick="detailSubmit(2)" />

							</td>
						</tr>
					</table>
				</div>

				<!-- 페이징 view -->
						
						<div class="c-pagination" align="center" style="padding-left: 200px; padding-bottom:100px; margin-top:-27px; width: auto;">
							<a href="del_list.do?startPage=1&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
							<a href="#" class="c-pagination" id="pagination"></a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
							<a href="del_list.do?startPage=${totalPage}&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
						</div>
				<!-- 페이징 end -->
				
				
				</form>
			
</body>
</html>
