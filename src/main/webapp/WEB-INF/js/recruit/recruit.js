/* 작성버튼 */
function re_write() {
	location.href = "recruit_write.do";
};
/*function re_list() {
	location.href = "recruit_list.do";
};*/
function showPopup() {
	window.open("re_enrollment_view.do", "모집분야 등록하기",
			"width=400, height=500, left=100, top=50");
};
function place_add() {
	window.open("place_add.do", "근무지 등록하기",
			"width=400, height=500, left=100, top=50");
};
function place_add_but() {
	document.place_add_action.submit();
};
function place_del_but() {
	document.place_del_action.submit();
};
/* 이력서 삭제 */
function resume_list_del_bt() {
	var arr = new Array();
	$("input:checkbox[name=resume_no]:checked").each(function(){
		arr.push($(this).val());
	});
	
	if(arr[0]==null){
		alert("삭제하실 이력서를 선택해주세요.");
	}else{
	var result = confirm('삭제하시겠습니까?\n이력서 삭제시 해당 지원자 개인정보도 같이 삭제됩니다.');
	if(result) {
		document.resume_list_del_action.submit();
		} else {
		}
	}
};
/* 이력서 게시판 이동 */
function resume_list_move_bt() {
	var len = $("#resume_noCheck").length;
	var arr = new Array();
	$("input:checkbox[name=resume_no]:checked").each(function(){
		arr.push($(this).val());
	});
	$('#del_move').val("B");
	
	if(arr[0]==null){
		alert("이동하실 이력서를 선택해주세요.");
	}else{
	var result = confirm(len+' 건 이력서를 옮기시겠습니까?');
	if(result) {
		window.open("resume_move_win.do", "a", "width=400, height=300, left=100, top=50");
		} else {
		}
	}
};
function setAll_no1(name) {
	document.getElementById("all_no_opener").value=name;
};
/* 팝업창 컨트롤 */
function sendAll_no1(name) {
	var result = confirm('선택된 게시판으로 옮기시겠습니까?');
	if(result) {
		name = $("#all_no_pop option:selected").val();
		opener.setAll_no1(name);
		opener.resume_list_del_action.submit();
		self.close();
	} else {
	}
};
/* 이력서 게시판 이동 end */


/* 채용동의자 삭제 */
function privacy_del_bt() {
	document.privacy_del_at.submit();
};
function send_bt() {
		var k = $("#sms_table tr").length;
		/*var i;
			for(var j = 1; j<k; j++){
				i = $("#name"+j+"").val();
				i2 = $("#phone"+j+"").val();
				i3 = $("#phone2_"+j+"").val();
				i3_le = i3.length;
				i4 = $("#phone3_"+j+"").val();
				i4_le = i4.length;
				if(i==''){
					alert("성명을 입력해주세요.");
					document.getElementById("name"+j+"").focus();
					return 0;
				}
				if(i2=='' || i2!='010' && i2!='011' && i2!='017' && i2!='019'){
					alert("핸드폰번호를 정확히 입력해주세요.");
					document.getElementById("phone"+j+"").focus();
					return 0;
				}
				if(i3=='' || i3_le!=4 && i3_le!=3){
					alert("핸드폰번호를 정확히 입력해주세요.");
					document.getElementById("phone2_"+j+"").focus();
					return 0;
				}
				if(i4=='' || i4_le!=4){
					alert("핸드폰번호를 정확히 입력해주세요.");
					document.getElementById("phone3_"+j+"").focus();
					return 0;
				}
			}*/
		var result = confirm('SMS를 전송하시겠습니까?\n확인시 전송을 취소할수 없습니다.');
		if(result) {
			document.send.submit();
		} else {
		}
};
/*이력서 리스트 갱신*/
function resume_list_view() {
	document.resume_list_re.submit();
};
function re_write_update_bt() {
	var i = $("chec_select").val();
	if (i == "모집중") {
		$("#chec_select_hidden").val("1");
	} else if (i = -"마감") {
		$("#chec_select_hidden").val("2");
	}
	var cont = $("#fa_rt input").length;
	var html = "";
	var k = $("#favorable").val();
	/* 모집분야 DB등록 */
	if (cont > 1) {
		for (var i = 1; i <= cont - 2; i++) {
			var u = $("#favorable" + i + "").val();
			if(u !=''){
			html += u + "|";
			}
		}
		if(k != ''){
			$("#favorable").val(k + "|" + html);
		}else{
		$("#favorable").val(html);
		}
	}
	console.log($("#favorable").val());
	
	var result = confirm('수정하시겠습니까?\n이전내용은 삭제됩니다.');
	if(result) {
		document.write_update_ac.submit();
		} else {
		}
};
/* 모집분야 등록버튼 */
function re_en_add_go() {
	location.href = "re_en_add.do";
};

function re_enrollment_list_del() {
	document.enrollment_del.submit();
};

function re_en_add_update_but() {
	var k = $("#favorable_update_val").val();
	var cont = $(".favorable_rd input").length;
	console.log(cont);
	var html = "";
	if (cont > 1) {
		for (var i = 1; i <= cont - 2; i++) {
				var u = $("#favorable_update_val" + i + "").val();
				if(u !=''){
			html += u + "|";
				}
		}
		$("#favorable_update_val").val(k + "|" + html);
	}
	document.add_update_re.submit();
};

$(function() {
	if ($('#etcdb').val() == 1) {
		$('#etc').val("*서류전형 합격자에 한해 면접 시간 및 장소 개별통보");
	}

	if ($('#etc').val() == 1) {
		$('#etc').val("*서류전형 합격자에 한해 면접 시간 및 장소 개별통보");
	}
});
/* 삭제버튼 */
function sel_check() {
	var arr = new Array();
	$("input:checkbox[name=all_no]:checked").each(function(){
		arr.push($(this).val());
	});
	
	if(arr[0]==null){
		alert("삭제하실 게시판을 선택해주세요.");
	}else{
		var result = confirm('삭제하시겠습니까?\n당일 생성된 게시판은 복구불가능 합니다.');
		if(result) {
			document.delete_check.submit();
			} else {
			}
	}
};
function sel_check1() {
	var arr = new Array();
	$("input:checkbox[name=all_no]:checked").each(function(){
		arr.push($(this).val());
	});
	
	if(arr[0]==null){
		alert("삭제하실 게시판을 선택해주세요.");
	}else{
		var result = confirm('삭제하시겠습니까?');
		if(result) {
			document.delete_check.submit();
			} else {
			}
	}
};
function re_up() {
	var i = $('input:checkbox[id="check_box"]:checked').val();
	$("#up_all_no").val(i);
	document.re_update.submit();
};
/* 파일추가버튼 */
function addbt() {
	var fileIndex = $('.addtable tr').children().length;
	$('#addtd').append(
			'<tr><td colspan="2">' + '   <input type="file" name="file['
					+ fileIndex + ']" />' + '</td></tr>');
};
/* 숫자만 입력받기 */
function onlyNumber(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
			|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
		return;
	else
		return false;
};

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
};
/* 채용 인원 1~10 */
function up() {
	var i = parseInt($('#re_num').val()) + 1;
	if (i <= 10) {
		$('#re_num').val(i);
	} else {
		$('#re_num').val(10);
	}
};
function down() {
	var i = parseInt($('#re_num').val()) - 1;
	if (i > 1) {
		$('#re_num').val(i);
	} else {
		$('#re_num').val(1);
	}
}
/* 공고등록 */
function recruit_enrollment_onclick() {
	var cont = $("#fa_rt input").length;
	var html = "";
	var k = $("#favorable").val();
	var fileName = $("#sefileForm2").val();
	var titleForm = $("#titleForm").val();
		if(titleForm==""){
			alert("제목을 입력해 주세요.");
			return 0;
		}else if(fileName=="파일선택"){
			alert("첨부파일을 선택해 주세요.");
			return 0;
		}else{
			
		}
	/* 모집분야 DB등록 */
	if (cont > 1) {
		for (var i = 1; i <= cont - 2; i++) {
			var u = $("#favorable" + i + "").val();
			if(u !=''){
			html += u + "|";
			}
		}
		$("#favorable").val(k + "|" + html);
	}
	
	var result = confirm('등록하시겠습니까?');
	if(result) {
			document.recruit_enrollment.submit();
		} else {
		}
};

/* 우대사항 추가버튼 */
function write_favorable_add() {
	var i = $("#fa_rt input").length - 1;
	var text = "<br><input class='searchForm' type='text' value='' id='favorable" + i + "'>";
	$('#fa_rt').append(text);
};

/* 모집분야 자동완성 */
function change_re_en(selectObj) {
	var re_en = selectObj.value;
	$.ajax({
		url : "./recruit.do",
		data : {
			"re_en" : re_en
		},
		type : "POST",
		dataType : "json",
		success : function(data) {
			console.log(data);
			$.each(data, function(key, list) {
				favorable = list.favorable;
				cond = list.cond;
				salary = list.salary;
				var arr = favorable.split("|"); // ,구분으로 택스트 배열로 담기
				var n = favorable.indexOf("|"); // , 있는지 체크 1=있을때 -1=없을때
				var cont = $("#fa_rt input").length - 1;

				/* console.log("cont="+cont); console.log("n=" + n); */

				$('input[name="cond"]').attr('value', cond);
				$('input[name="salary"]').attr('value', salary);

				if (n = 1) {
					$('input[name="favorable"]').attr('value', favorable);
					/* $("#favorable").val(favorable); */
					for (var g = 1; g <= cont; g++) {
						$("#fa_rt br").remove();
						$('#favorable' + g + '').remove();
					}
				}

				/* 배열일때 input 증가후 배열로 나열 */
				if (n = -1) {
					$('#favorable').val(arr[0]);
					for (var h = 1; h <= arr.length - 2; h++) {
						$("#fa_rt").append(
								"<br><input class='searchForm' type='text' id='favorable" + h
										+ "' value='" + arr[h] + "'>");
					}
				}
			});
		},
		error : function(request, status, error) {

		}
	});
};

/* 모집분야 추가 - 우대조건 text 라인추가 */
function favorable_add() {
	var i = $("#favorable_rd input").length;
	var text = "<br><input class='searchForm' type='text' value='' id='favorable_val_" + i + "'>";
	$('#favorable_rd').append(text);
};
function favorable_add1() {
	var i = $(".favorable_rd input").length-1;
	var text = "<br><input class='searchForm' type='text' value='' id='favorable_update_val" + i + "'>";
	$('.favorable_rd').append(text);
};

/* 모집분야 추가버튼(insert) */
function re_en_add_bt() {
	var i = $("#favorable_rd input").length - 1;
	var html = "";
	for (var j = 1; j <= i; j++) {
		var u = $("#favorable_val_" + j + "").val();
		if(u !=''){
		html += u+"|";
		}
	};
	$("#favorable_val_1").val(html);
	document.sub1.submit();
};

/* 근무지선택 */
function change_place_select() {
	var i = $("#place_select").val();
};

function redown(fileName){
	location.href="resumefiledown.do?filename="+encodeURI(fileName);
};

function sms_add_bt(){
	var k = $("#sms_table tr").length;
	$('#sms_table').append("<tr><td><button class='btn btn-outline-info' onclick='deleteLine(this);'>삭제</button></td><td><input class='searchForm' type='text' value='이름' id='name"+k+"' name='name' /></td><td><input class='searchForm' type='text' name='phone1' id='phone"+k+"' />&nbsp;&nbsp;-&nbsp;&nbsp;<input class='searchForm' type='text'name='phone2' id='phone2_"+k+"' />&nbsp;&nbsp;-&nbsp;&nbsp;<input class='searchForm' type='text' name='phone3' id='phone3_"+k+"' /></td></tr>");
};

/*문자 불러오기*/
function change_sms(selectObj){
	var all_no = selectObj.value;
	$.ajax({
		url : "sms_list.do",
		data : {
			"all_no" : all_no
		},
		type : "POST",
		dataType : "json",
		success : function(data){
			$.each(data, function(key, list){
				var k = $("#sms_table tr").length;
				name = list.privacy_name;
				phone = list.phone;
				resume = list.resume_file;
				var arr = phone.split("-");
				
				$('#sms_table1').before("<tr><td><button class='btn btn-outline-info' onclick='deleteLine(this);'>삭제</button></td>" +
						"<td><input class='searchForm' type='text' value='"+name+"' name='name' id='name"+k+"' /></td>" +
						"<td><input class='searchForm' type='text' value='"+arr[0]+"' name='phone1' id='phone"+k+"' />&nbsp;&nbsp;-&nbsp;&nbsp;" +
						"<input class='searchForm' type='text' value='"+arr[1]+"' name='phone2' id='phone2_"+k+"' />&nbsp;&nbsp;-&nbsp;&nbsp;" +
						"<input class='searchForm' type='text' value='"+arr[2]+"' name='phone3' id='phone3_"+k+"' /></td></tr>");
				
			});
			
		},
		error : function(request, status, error){
			
		}
	});
};

/* sms 전송 연락처 tr 제거 */
function deleteLine(obj){
	var tr = $(obj).parent().parent();
	tr.remove();
}

$(function() {
    $('#textarea_msg').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#textarea_count').html(content.length + '/80');
    });
    $('#textarea_msg').keyup();
});

function back_bt() {
	var result = confirm('이전으로 돌아가시겠습니까?\n'+
			'변경된 내용이 있다면 변경된 내용은 저장되지 않습니다.');
	if(result){
	window.history.back();
	}else{
	}
};