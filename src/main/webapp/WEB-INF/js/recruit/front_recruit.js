$(function() {
	//모집,마감 background
	for(var w=1; w<=10; w++){
	var k = $("#thin_chec_hidden_"+w+"").val();
	if(k==1){
		$("#color_"+w+"").attr("class", "r-public__current r-public__current--red");
	}else if(k==2){
		$("#color_"+w+"").attr("class", "r-public__current r-public__current--gray");
	}
	};
	for(var c=1; c<=10; c++){
		var j = $("#chec_hidden1_"+c+"").val();
		if(j==1){
			$("#chec_color1_"+c+"").attr("class", "c-notice__current c-notice__current--red");
		}else if(j==2){
			$("#chec_color1_"+c+"").attr("class", "c-notice__current c-notice__current--gray");
		}
	};
	for(var o=1; o<=4; o++){
		var l = $("#thin_chec_hidden_main_"+o+"").val();
		if(l==1){
			$("#color_main_"+o+"").attr("class", "m-recruit__current m-recruit__current--ing");
		}else if(l==2){
			$("#color_main_"+o+"").attr("class", "m-recruit__current m-recruit__current--ing1");
		}
	};
});
/*지원분야, 첨부파일 입력 체크 추가 2018.10.24 -김영정*/
function support_bt() {
	var i = $("input:checkbox[id='c-check']").is(":checked");
	var filecheck = $("#filename_text").val();
	var title_check = $("#title_check").val();
	var num = $("#c-phone").val();
	num = num.replace(/[^0-9]/g, '');
	var tmp = '';
	tmp += num.substr(0, 3);
	tmp += '-';
	tmp += num.substr(3, 4);
	tmp += '-';
	tmp += num.substr(7);
	$("#c-phone").val(tmp);
	
	var a = $("select[name=all_no]").val();
	var over_length = $("#over_length").val();
	for(var k = 1; k<=over_length; k++){
		var over_no_check = $("#over_"+k+"").val();
		if(a==over_no_check){
		 $('#check1').val(a);
		}
	}
	if(title_check == '선택'){
		alert("지원분야를 선택 해주세요.");
	}
	if(filecheck == ''){
		alert("첨부파일란에 지원서를 첨부 해주세요.");
	}
	if (i != true) {
		alert("개인정보취급방침에 동의해주세요.");
	}
	else if (i == true && filecheck != '') {
		alert(title_check+"\n지원 완료되었습니다.");
		document.resume_support.submit();
	}
};

/*번호입력 - 숫자이외 삭제*/
function focus(num) {
	num = num.replace(/[^0-9]/g, '');
	$("#c-phone").val(num);
};

/*번호입력 - '-'자동생성*/
function blur(num) {
	num = num.replace(/[^0-9]/g, '');
	var tmp = '';
	tmp += num.substr(0, 3);
	tmp += '-';
	tmp += num.substr(3, 4);
	tmp += '-';
	tmp += num.substr(7);
	$("#c-phone").val(tmp);
};

function re_body_go_bu() {
	document.re_body_go_hi.submit();
};

function change_support(name){
	var all_no = name.value;
	var over_length = $("#over_length").val();
	for(var i = 1; i<=over_length; i++){
		var over_no_check = $("#over_"+i+"").val();
		if(all_no==over_no_check){
			alert("지원한 공고입니다.\n중복지원시 마지막 지원파일만 저장되며 이전파일은 이후 자동 삭제됩니다.");
		}
	}
};