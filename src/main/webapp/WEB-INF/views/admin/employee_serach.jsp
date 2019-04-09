<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신규 관리자 등록 - 직원검색</title>
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
						
						$(document).ready(function() { 
							$("#searchBtn").click(function() {
								document.listForm.submit();
							
							});
							
						 }); 

						
						//이중폼 보내는 방법
						 function detailSubmit(index) {
							    if (index == 1) {
							    	//체크박스 선택에 따른 삭제 유무
									if(confirm("정말로 삭제 하시겠습니까?") == true) {
										if($('input:checkbox[id="checkOne"]').is(":checked") == true)  {
								           document.listForm.action='bidListDelete.do';
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
<script type="text/javascript">
function sendTxt(bpfc_no, bpfc_name, bpfc_rank, bpfc_department, bpfc_task){
opener.document.getElementById("admin_name").value = bpfc_name;
opener.document.getElementById("admin_rank").value = bpfc_rank;
opener.document.getElementById("admin_id").value = bpfc_no;
opener.document.getElementById("admin_passwd").value = bpfc_no;
opener.document.getElementById("admin_task").value = bpfc_task;
opener.document.getElementById("admin_department").value = bpfc_department;
/* alert(bpfc_no);
alert(bpfc_name);
alert(bpfc_rank);
alert(bpfc_department);
alert(bpfc_task); */
self.close();
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
				<form name="listForm"  method="post">
				<div align="center">
				<h1>직원 검색</h1>
   				<table style="border: 0; width: 600px;">		
						
					<tr>
					<td align="left">TOTAL : ${totalCnt}명 ( ${startPage} / ${totalPage} ) 페이지</td>
					<td align="right">
					<select class="selectForm" name="sch_type" id="sch_type" >
								
							<option value="bpfc_name">이름</option>
							<option value="bpfc_no">사번</option>
							<option value="bpfc_department">부서</option>
							<option value="bpfc_task">업무</option>
							<option value="bpfc_rank">직급</option>
					</select> 
					
					<input type="text" class="searchForm" id="sch_value" name="sch_value" value="${sch_value}"/>
					<input class="btn btn-secondary" type="button" id="searchBtn" value="검색"/>
					<input type="hidden" value="${sch_type}" id="hidden_type" />
					</td>
					</tr>
					</table>
					<br>
					
				<!-- <form name="delete_list_check" action="delete_list_check.do" method="get"> -->
				<input type="hidden" id="startPage" name="startPage" value="">
				<input type="hidden" id="visiblePages" name="visiblePages" value="">
					
				<table class="table table-hover" style="border: 0; width: 600px;">
					<tr class="table-info" align="center">					
						<td align="center" >사번</td>
						<td align="center" >이름</td>
						<td align="center" >직급</td>
						<td align="center" >부서</td>
						<td align="center" >업무</td>
					</tr>
					<c:choose>
						<c:when test="${fn:length(employee_list) == 0}">												
							<tr>
								<td colspan="4" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="employee_list" items="${employee_list}"  varStatus="status">
								<tr>
									<td align="center"><input type="text" id="admin_no" style="border: 0;" value="${employee_list.bpfc_no}"
									onclick="javascript:sendTxt('${employee_list.bpfc_no}',
																'${employee_list.bpfc_name}', 
																'${employee_list.bpfc_rank}',
																'${employee_list.bpfc_department}',
																'${employee_list.bpfc_task}');" /></td>
									<td align="center"><input type="text" id="admin_name" style="border: 0;" value="${employee_list.bpfc_name}" 
									onclick="javascript:sendTxt('${employee_list.bpfc_no}',
																'${employee_list.bpfc_name}', 
																'${employee_list.bpfc_rank}',
																'${employee_list.bpfc_department}',
																'${employee_list.bpfc_task}');"/></td>	
									<td align="center"><input type="text" id="admin_rank" style="border: 0;" value="${employee_list.bpfc_rank}"
									onclick="javascript:sendTxt('${employee_list.bpfc_no}',
																'${employee_list.bpfc_name}', 
																'${employee_list.bpfc_rank}',
																'${employee_list.bpfc_department}',
																'${employee_list.bpfc_task}');" /></td>
									<td align="center"><input type="text" id="admin_department" style="border: 0;" value="${employee_list.bpfc_department}"
									onclick="javascript:sendTxt('${employee_list.bpfc_no}',
																'${employee_list.bpfc_name}', 
																'${employee_list.bpfc_rank}',
																'${employee_list.bpfc_department}',
																'${employee_list.bpfc_task}');" /></td>
									<td align="center"><input type="text" id="admin_task" style="border: 0;" value="${employee_list.bpfc_task}"
									onclick="javascript:sendTxt('${employee_list.bpfc_no}',
																'${employee_list.bpfc_name}', 
																'${employee_list.bpfc_rank}',
																'${employee_list.bpfc_department}',
																'${employee_list.bpfc_task}');" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>

				<!-- 페이징 view -->
						<div class="c-pagination" align="center">
							<a href="bid_list.do?board_id=${board_id}&startPage=1&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
							<a href="#" class="c-pagination" id="pagination"></a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
							<a href="bid_list.do?board_id=${board_id}&startPage=${totalPage}&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
						</div>
				<!-- 페이징 end -->
				
				
				</form>
			
</body>
</html>
