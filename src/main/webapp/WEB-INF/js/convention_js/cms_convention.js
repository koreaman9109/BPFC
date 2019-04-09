function convention_add_bt() {
	location.href = "convention_add.do";
};

function convention_event_add() {
	var division = document.getElementsByName('con_division');
	var division_value;
	var event_name = $("#event_name").val();
	var start_date = $("#con_start_date").val();
	var end_date = $("#con_end_date").val();
	for(var i=0; i<division.length; i++){
		if(division[i].checked){
			division_value=division[i].value;
		}
	}
	if(division_value==null){
		alert("구분선택!!");
		return false;
	}
	if(start_date==''){
		alert("시작일자를 입력해주세요");
		$("#con_start_date").focus();
		return false;
	}
	if(end_date==''){
		alert("종료일자를 입력해주세요");
		$("#con_end_date").focus();
		return false;
	}
	
	var res = confirm('등록하시겠습니까?');
	if(res){
	document.convention_event_add_form.submit();
	}else{
		
	}
};

function convention_list_del_bt(){
	var res = confirm('정말 삭제 하시겠습니까?');
	if(res){
		document.convention_list_del.submit();
	}else{
		
	}
};

function convention_re_add_bt() {
		document.convention_re_add.submit();
};

function convention_update_bu(){
	var res = confirm('수정하시겠습니까?\n이전내용은 삭제됩니다.');
	if(res){
		document.cconvention_update_form.submit();
	}else{
		
	}
};

function back_bt() {
	var result = confirm('이전으로 돌아가시겠습니까?\n'+
			'변경된 내용이 있다면 변경된 내용은 저장되지 않습니다.');
	if(result){
	window.history.back();
	}else{
	}
};

function searchBtn() {
	var sch_type = $('#sch_type').val();
	if(sch_type='con_date'){
		var sch_value = $('#sch_value').val();
		sch_value = sch_value.replace(/[^0-9]/g,'');
		sch_value = sch_value.substring(0,4)+"/"+sch_value.substring(4, 6)+"/"+sch_value.substring(6, 8);
		$('#sch_value').val(sch_value);
	}
	document.listForm.submit();
};