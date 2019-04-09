<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include.jsp"%>
<script src="js/convention_js/cms_convention.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//datePicker
		$('#con_start_date').datepicker({
		    language: 'en',
		    /* 날짜클릭이벤트 */
		    onSelect: function(){
		    	$('#con_start_date').datepicker("hide");
		    	$('#con_start_date').blur();
			}
		});
		$('#con_end_date').datepicker({
		    language: 'en',
		    /* 날짜클릭이벤트 */
		    onSelect: function(){
		    	$('#con_end_date').datepicker("hide");
		    	$('#con_end_date').blur();
			}
		});
	});
</script>
<title>컨벤션센터관리</title>
</head>
<body>
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<div class="navLeft">
		<ul>
			<li style="font-size: large;">컨벤션센터관리</li>
		</ul>
	</div>
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		<h1>컨벤션센터일정 등록 <font title="1. 필수 입력사항은 해당 구분 옆 * 표시로 확인가능하며, 해당 구분에 값이 없을 경우 등록이 불가능합니다.
2. 하단의 뒤로가기 버튼 클릭 시 이전페이지로 이동되며, 작성 중이던 내용은 저장되지 않습니다.
3. 해당페이지 이외로 이동시 작성 중이던 내용은 저장되지 않습니다.
4. 하단의 등록 버튼을 클릭하면 게시물 등록이 완료 됩니다.
"><img alt="" src="images/questionmark.png" style="width: 30px;"></font></h1>
		
		<form action="convention_event_add_form.do" name="convention_event_add_form" method="post">
		<!-- <input type="hidden" name="con_time" value="" id="con_time"> -->
		<input type="hidden" name="con_date" value="" id="con_date">
		<table class="table table-hover">
			<tr class="table-info">
				<th>구분</th>
				<th>내용</th>
			</tr>
			<tr>
				<td>행사구분<a style="color:red;">*</a></td>				<td>
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
					<label class="col-form-label" for="event_name">행사명<a style="color:red;">*</a></label>				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="행사명을 입력해주세요" id="event_name" name="event_name" />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_start_date">시작일자<a style="color:red;">*</a></label>				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="YYYY-MM-DD" id="con_start_date" name="con_start_date" readonly />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_end_date">종료일자<a style="color:red;">*</a></label>				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="YYYY-MM-DD" id="con_end_date" name="con_end_date" readonly />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_time">시간<a style="color:red;">*</a></label>				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" name="con_time" />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_place">장소<a style="color:red;">*</a></label>				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="장소를 입력해주세요" id="con_place" name="con_place">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_usage">용도</label>
				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="용도를 입력해주세요" id="con_usage" name="con_usage">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_setting">세팅형태</label>
				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="세팅형태를 입력해주세요" id="con_setting" name="con_setting">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_paricipants">참가인원(명)<a style="color:red;">*</a></label>
				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="참가인원을 입력해주세요" id="con_paricipants" name="con_paricipants">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_organizer">행사주관업체<a style="color:red;">*</a></label>				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="행사주관업체를 입력해주세요" id="con_organizer" name="con_organizer">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_phone">연락처</label>
				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="연락처를 입력해주세요" id="con_phone" name="con_phone">
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
					  <input type="text" class="form-control" placeholder="임대료를 입력해주세요" id="con_rent" name="con_rent">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_deposit">예치금(원)</label>
				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="예치금을 입력해주세요" id="con_deposit" name="con_deposit">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_paymentdate">납부일자</label>
				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="납부일자를 입력해주세요" id="con_paymentdate" name="con_paymentdate">
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
					  <input type="text" class="form-control" placeholder="비고를 입력해주세요" id="con_etc1" name="con_etc1">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label class="col-form-label" for="con_etc2">공실</label>
				</td>
				<td>
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="공실을 입력해주세요" id="con_etc2" name="con_etc2">
					</div>
				</td>
			</tr>
		</table>
		</form>
		<hr>
		<a class="btn btn-info" onclick="back_bt();" style="color: white;">뒤로가기</a>
		<input class="btn btn-info" type="button" onclick="convention_event_add()" value="등록"/>
	</div>
	<br>
</body>
</html>