<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
<link href="css/board.css" rel="stylesheet"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 목록</title>
<script type="text/javascript">

						// 체크박스 선택제어
						$(document).ready(function() {
									$("#product_check_all").click(function() {
										
												var chk = $(this).is(":checked");
												if (chk) {
													$('input[name*="admin_num"]').prop('checked',true);
												} else {
													$('input[name*="admin_num"]').prop('checked',false);
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
											if(confirm("정말로 삭제 하시겠습니까?") == true) {
								           document.listForm.action='adminListDelete.do';
												alert("삭제 되었습니다.");
								          } else{
											alert("취소 되었습니다.");
								            return;
								             }
										
										
												
										
										}else{
								            alert("삭제하실 목록을 체크하여 주십시오.");
											return;
											
										}	
							    }
							    if (index == 2) {
							      document.listForm.action='#';
							    }
							    document.listForm.submit();
							  };
							  
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
												/* var board_id = 4; */
												
												/* $('#board_id').val(board_id); */ 
												$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
												$('#visiblePages').val(visiblePages);
												/* $("#listForm").submit(); */
												document.listForm.submit();
									});
									
									
							  });
						

			
</script>
<script type="text/javascript">
/* document.listForm.sch_type.value = "${sch_type}"; */
  $(document).ready(function() { 
 
	  var i = $("#hidden_type").val();
		$("#sch_type > option[value='"+i+"']").attr("selected","selected");

  });



 
	</script>
	<script type="text/javascript">
	function retireList() {
		   alert("퇴사나 기타 사유로 그룹웨어DB에 사번이 저장되어있지 않은 계정들을 모아둔 리스트입니다.");
		   location.href = "retire_admin_list.do?board_id=10";
		}
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
		<div class="left" style="height: 100% ;">
		<jsp:include page="../setting_submenu.jsp"></jsp:include>
		</div>
				<form name="listForm"  method="get">
				<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
				
				<h1>사용자 목록</h1>
				
				<!-- 페이징을 위한 hidden타입 추가 -->
				<!-- ※전체 경로 입력해줘야함  -->
				<!-- 페이징을 위한 hidden타입 추가 -->
				<%-- <input type="hidden" id="admin_num" name="admin_num" value="${admin_num}">
				<input type="hidden" id="admin_id" name="admin_id" value="${admin_id}"> --%>
				<input type="hidden" id="board_id" name="board_id" value="${board_id}">
				<input type="hidden" id="board_id2" name="board_id2" value="${board_id2}">
				<input type="hidden" id="startPage" name="startPage" value="">
				<input type="hidden" id="visiblePages" name="visiblePages" value="">
								
				
				<table style="border: 0; width: 900px;">				
					<tr>
					<c:set var="totalCnt" value="${totalCnt}" />
					<td colspan="2" align="left" width="100px">TOTAL : ${totalCnt}명 ( ${startPage} / ${totalPage} ) 페이지</td>
					<td colspan="5" align="right">
					<select name="sch_type" id="sch_type">
 							<option value="admin_id">사번</option>
							<option value="admin_name">성명</option>
					</select> 
					
					<input type="text" id="sch_value" name="sch_value" value="${sch_value}"/>
					<input class="btn btn-primary" type="button" id="searchBtn" value="검색"/> 
					<input type="hidden" value="${sch_type}" id="hidden_type" />
					</td>
					</tr>
					</table>
					<br>
					
				<!-- <form name="delete_list_check" action="delete_list_check.do" method="get"> -->

				<table class="table table-hover">
					<thead>
					<tr class="table-info" align="center">
						<td align="center" width="30px">
							<input type="checkbox" id="product_check_all"/> 
						</td>
						<td align="center" width="50px">No</td>
						<td align="center" width="80px">사번</td>
						<td align="center" width="80px">성명</td>
						<td align="center" width="130px">부서</td>
						<td align="center" width="150px">등록일자</td>
						<td align="center" width="100px">정보보기</td>

					</tr>
					</thead>
					
					<c:choose>
						<c:when test="${fn:length(admin_list) == 0}">												
							<tr>
								<td colspan="9" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="admin_list" items="${admin_list}"  varStatus="status">
									<c:if test="${admin_list.authority eq 1}">
								<tr>
									<td align="center">
									<c:if test="${admin_list.admin_id ne 'bpfcadmin'}">
									<input type="checkbox" id="checkOne" name="admin_num" value="${admin_list.admin_num}"/>
									</c:if>
									<!-- <input type="checkbox"  name="checkOne" /> -->
									</td>
									<td align="center">
                                    <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                                    <c:set var="startpage" value="${startPage-1}" />
                                    <c:set var="statuscount" value="${status.count }" />
                                    ${totalCnt+1-(startpage*10+statuscount)}
                                     </td>
									<td align="center">
									<a id="adminid" class="mouseOverHighlight" onclick="location.href='admin_view.do?board_id=10&board_id2=7&admin_id=${admin_list.admin_id}'">&nbsp;${admin_list.admin_id}</a>
									
									</td>
									<td align="center">${admin_list.admin_name}</td>
									<td align="center">${admin_list.admin_department}</td>
									<td align="center">${admin_list.register_date}</td>
									<!--  <td align="center"><button
											id="modify" name="modify">수정</button></td> -->
									<!--  <td align="center"><button>삭제</button></td> -->
									<td align="center">
									<input class="btn btn-primary" type="button" name="preview" id="${admin_list.admin_id}" onclick="location.href='admin_view.do?board_id=10&board_id2=7&admin_id=${admin_list.admin_id}'" value="정보보기" />
									</td>		
								</tr>
									</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<hr>
				<div style="padding-top: 30px;" align="center">
					<table style="width: 900px;">
						<tr>
							<td align="left">
						<!-- <input style="font-size: small; margin: 10px;" type="button" id="product_check_all_btn"/> -->
						<!-- 	<button style="font-size: small;" type="button" name="checkAll" >전체선택</button> -->
						<input class="btn btn-primary" style="font-size: small;" type="button" value="전체선택" onclick="checkboxSelectQue(1,'admin_num')" />
						<input class="btn btn-primary" style="font-size: small;" type="button" value="전체해제" onclick="checkboxSelectQue(2,'admin_num')" /> 
						<!-- <input class="btn btn-primary" style="font-size: small;" type="button" value="선택갯수 및 값 확인" onclick="checkboxSelectCount('admin_num')" /> -->
						<!--  	<button style="font-size: small;" type="button" id="#" name="#">선택해제</button>  -->
					</td>	
			

					<td align="right">
						<!-- <input style="font-size: small;" type="button" value="게시물 삭제" id="listDelBtn" name="listDelBtn"  /> 20180404 16:07 권수 --> 
						<c:if test="${sessionScope.admin_id eq 'bpfcadmin' || sessionScope.admin_id eq 'interlink'}">
						<input class="btn btn-danger" style="font-size: small;" type="button" value="사용자 삭제" id="listDelBtn" name="listDelBtn" onclick="detailSubmit(1)" />
						<input class="btn btn-warning" style="font-size: small;" type="button" value="퇴사자 목록" onclick="retireList()" />
						</c:if>
						</td>
					</tr>
					</table>
				</div>
			</div>
		
				<!-- 페이징 view -->
				
						<div class="c-pagination" align="center" style="padding-left: 200px; padding-bottom:100px; margin-top:-27px; width: auto;">
							<a href="admin_list.do?board_id=10&board_id2=7&startPage=1&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
							<a href="#" class="c-pagination" id="pagination"></a>
							<!-- 2018.05.21 관리자 목록 페이징 처리 미완료!! TEST중  -->
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
							<a href="admin_list.do?board_id=10&board_id2=7&startPage=${totalPage}&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
						</div>
				<!-- 페이징 end -->	
				<br>
				
				
				</form>
				<!-- 검색 end  -->
	
</body>
</html>