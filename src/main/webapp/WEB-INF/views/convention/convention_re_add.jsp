<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include.jsp"%>
<script src="js/convention_js/cms_convention.js"></script>
<title>컨벤션센터관리</title>
<script type="text/javascript">
	$(document).ready(function() {
		var division_hi = $("#con_division_hidden").val();
		var check_hi = $("#con_check_hidden").val();
		var payment_hi = $("#con_payment_hidden").val();
		for(var i=1; i<=4; i++){
			var division = $("#con_division"+i+"").val();
			var check = $("#con_check"+i+"").val();
			var payment = $("#con_payment"+i+"").val();
			if(division_hi==division){
				$("#con_division"+i+"").attr("checked",true);
			}
			if(check_hi==check){
				$("#con_check"+i+"").attr("checked",true);
			}
			if(payment_hi==payment){
				$("#con_payment"+i+"").attr("checked",true);
			}
		}
		
		//datePicker
		$('#con_start_date').datepicker({
		    language: 'en',
		})
		$('#con_end_date').datepicker({
		    language: 'en',
		});
		
		// timePicker
		/* var con_update_time1 = $('#con_time1').val();
		var con_update_time2 = $('#con_time2').val();
		var option = {
			now: con_update_time1,
			twentyFour: true,
			title: '시간',
		};
		var option2 = {
			now: con_update_time2,
			twentyFour: true,
			title: '시간',
		};
		
		$('#con_time1').wickedpicker(option);
		$('#con_time2').wickedpicker(option2); */
		
		
	});
</script>
</head>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<div class="navLeft">
		<ul>
			<li style="font-size: large;">컨벤션센터관리</li>
		</ul>
	</div>
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		<h1>컨벤션센터일정 수정 <font title="1. 변경하고자하는 내용을 변경 후 하단의 수정하기 버튼을 클릭하면 수정이 완료됩니다.
2. 필수 입력사항은 해당 구분 옆 * 표시로 확인 가능하며, 해당 구분에 값이 없을 경우 수정이 불가능 합니다.
3. 하단의 뒤로가기 버튼 클릭 시 이전페이지로 돌아가지며, 작성 중이던 내용은 저장되지 않습니다.
"><img alt="" src="images/questionmark.png" style="width: 30px;"></font></h1>
		<input type="hidden" value="${view.con_division}" id="con_division_hidden">
		<input type="hidden" value="${view.con_check}" id="con_check_hidden">
		<input type="hidden" value="${view.con_payment}" id="con_payment_hidden">

		<form action="convention_update.do"
			name="cconvention_update_form" method="post">
			<input type="hidden" name="con_no" value="${view.con_no}" />
			<table class="table table-hover">
				<tr>
					<th>구분</th>
					<th>내용</th>
				</tr>
				<tr>
					<td>행사구분<a style="color:red;">*</a></td>
					<td>
						<div class="form-group">
		 				  	<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="radio" name="con_division" value="전시" id="con_division1" />
								<label class="custom-control-label" for="con_division1">전시</label> 
							</div>
							<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="radio" name="con_division" value="회의" id="con_division2" />
								<label class="custom-control-label" for="con_division2">회의</label> 
							</div>
							<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="radio" name="con_division" value="이벤트" id="con_division3" />
								<label class="custom-control-label" for="con_division3">이벤트</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<label class="col-form-label" for="event_name">행사명<a style="color:red;">*</a></label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="행사명을 입력해주세요" id="event_name" name="event_name" value="${view.event_name}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_start_date">시작일자<a style="color:red;">*</a></label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="작업중" id="con_start_date" name="con_start_date" value="${view.con_start_date}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_end_date">종료일자<a style="color:red;">*</a></label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="작업중" id="con_end_date" name="con_end_date" value="${view.con_end_date}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_time">시간<a style="color:red;">*</a></label>
					</td>
					<td>
						<div class="form-group">
							<input type="text" class="form-control" name="con_time" id="con_time" value="${view.con_time}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_place">장소<a style="color:red;">*</a></label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="장소를 입력해주세요" id="con_place" name="con_place" value="${view.con_place}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_usage">용도</label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="용도를 입력해주세요" id="con_usage" name="con_usage" value="${view.con_usage}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_setting">세팅형태</label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="세팅형태를 입력해주세요" id="con_setting" name="con_setting" value="${view.con_setting}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_paricipants">참가인원(명)<a style="color:red;">*</a></label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="참가인원을 입력해주세요" id="con_paricipants" name="con_paricipants" value="${view.con_paricipants}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_organizer">행사주관업체<a style="color:red;">*</a></label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="행사주관업체를 입력해주세요" id="con_organizer" name="con_organizer" value="${view.con_organizer}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_phone">연락처</label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="연락처를 입력해주세요" id="con_phone" name="con_phone" value="${view.con_phone}">
						</div>
					</td>
				</tr>
				<tr>
					<td>계약체결여부</td>
					<td>
						<div class="form-group">
		 				  	<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="radio" name="con_check" value="무상" id="con_check1" />
								<label class="custom-control-label" for="con_check1">무상</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="radio" name="con_check" value="예약" id="con_check2" />
								<label class="custom-control-label" for="con_check2">예약</label> 
							</div>
							<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="radio" name="con_check" value="체결" id="con_check3" />
								<label class="custom-control-label" for="con_check3">체결</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="radio" name="con_check" value="미체결" id="con_check4" />
								<label class="custom-control-label" for="con_check4">미체결</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_rent">임대료(원,VAT별도)</label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="임대료를 입력해주세요" id="con_rent" name="con_rent" value="${view.con_rent}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_deposit">예치금(원)</label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="예치금을 입력해주세요" id="con_deposit" name="con_deposit" value="${view.con_deposit}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_paymentdate">납부일자</label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="작업중" id="con_paymentdate" name="con_paymentdate" value="${view.con_paymentdate}">
						</div>
					</td>
				</tr>
				<tr>
					<td>납부여부</td>
					<td>
						<div class="form-group">
			 			  	<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="radio" name="con_payment" value="해당없음" id="con_payment1" />
								<label class="custom-control-label" for="con_payment1">해당없음</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="radio" name="con_payment" value="납부" id="con_payment2" />
								<label class="custom-control-label" for="con_payment2">납부</label> 
							</div>
							<div class="custom-control custom-checkbox">
								<input class="custom-control-input" type="radio" name="con_payment" value="납부예정" id="con_payment3" />
								<label class="custom-control-label" for="con_payment3">납부예정</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_etc1">비고</label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="비고를 입력해주세요" id="con_etc1" name="con_etc1" value="${view.con_etc1}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label class="col-form-label" for="con_etc2">공실</label>
					</td>
					<td>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="공실을 입력해주세요" id="con_etc2" name="con_etc2" value="${view.con_etc2}">
						</div>
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<a class="btn btn-info" onclick="back_bt();" style="color: white;">뒤로가기</a>
		<input class="btn btn-info" type="button" onclick="convention_update_bu()" value="수정하기" />
	</div>
	<br>
</body>
</html>