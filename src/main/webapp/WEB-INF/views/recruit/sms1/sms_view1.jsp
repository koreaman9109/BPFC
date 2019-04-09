<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문자 서비스</title>
<style type="text/css">
.form-control1 {
	width: 300px;
	max-height: 300px;
}
#textarea_count1{
	opacity: 0.7;
	}
.wrap {
    width: 300px;
    height: auto;
    position: relative;
    display: inline-block;
}
.wrap textarea {
    width: 100%;
    resize: none;
    min-height: 4.5em;
    line-height:1.6em;
    max-height: 9em;
}
.wrap span {
    position: absolute;
    bottom: 5px;
    right: 5px;
}
#textarea_msg1 {
  background:rgba(255,0,0,0.5);
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
}
#sms_td_count div {
	padding-left: 15px;
	padding-bottom: 10px;
}
#sms_td_count input {
	margin-left: 10px;
	vertical-align : middle;
}
#td_font_th{
	font-size: 18px;
	padding-left: 20px;
}
</style>
<script type="text/javascript">
	$(function() {
			/* 파일명 추출(변화시 라벨에 입력) */
		    var fileTarget = $('.upload-hidden'); 
		    fileTarget.on('change', function(){ // 값이 변경되면
		    	/* 파일 용량 체크 */
		    	var filesize = $(this)[0].files[0].size / 1024;
		    	if(filesize>500){
		    		alert("파일용량이 초과하였습니다.\n500kb이하만 전송가능합니다.");	
		    		if (navigator.userAgent.toLowerCase().indexOf("msie") != -1) {
		    		       $(this).replaceWith( $(this).clone(true) );  // ie 일때 초기화
		    		     } else {
		    		      $(this).val("");
		    		     }
		    	}
		    	console.log(filesize);
		    	/* 파일 용량 체크  end */
		    	if(window.FileReader){ // modern browser
		    		var filename = $(this)[0].files[0].name;
		    	} else { // old IE
		    		var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		    		} // 추출한 파일명 삽입
		    		
		    		/* 확장자로 이미지파일 만 전송 구분 */
		    		var hw = filename.split('.');
		    		console.log(hw);
		    		var or = hw.length-1;
	    			var hw1 = hw[or];
	    			console.log(hw1);
	    		 	if(hw1 != "jpg" && hw1 != "JPG"){
	    				alert("이미지 파일(jpg)만 전송가능합니다.");
	    				return 0;
	    			}
	    		 	/* 확장자로 이미지파일 만 전송 구분 end */
	    		 	
		    		$(this).siblings('.searchForm2').val(filename);
			});
		    /* 파일명 추출(변화시 라벨에 입력) end */
		    
		var content1 = $('#messages1').val();
		    
		/* 초기 메시지 카운트 */
		var dom=$('#messages1');
	    var str=dom.val();
	    var maxlength = 1990;
	    var _byte=0;
	    var strlength=0;
	    var charStr='';
	    var cutstr='';
	    if(str.length<=0){
	      return;
	    }
	    for(var i=0;i<str.length;i++){
	      charStr=str.charAt(i);
	      if(escape(charStr).length>4){
	        _byte+=2;
	      }else{
	        _byte++;
	      }
	      if(_byte<=maxlength){
	        strlength=i+1;
	      }
	    }
	    $('#textarea_msg1').text(_byte+"/80");
	    /* 초기 메시지 카운트 end */
		
		$('#messages1').keyup(function (e){
			dom=$(this);
		    str=dom.val();
		    _byte=0;
		    strlength=0;
		    charStr='';
		    cutstr='';
		    if(str.length<=0){
		      return;
		    }
		    for(var i=0;i<str.length;i++){
		      charStr=str.charAt(i);
		      if(escape(charStr).length>4){
		        _byte+=2;
		      }else{
		        _byte++;
		      }
		      if(_byte<=maxlength){
		        strlength=i+1;
		      }
		    }
	          
		    if(_byte>80){
		    	/* EI11 -> 한글 자음모음분리현상 = substr에서 분리후 재결합이 안되서 생김. */
			    /*   cutstr=dom.val().substr(str,strlength);
			      dom.val(cutstr); */
			      $('#textarea_msg1').text(_byte+"/2000");
			      $('#textarea_msg1').css('background','yellow');
			      $('#division').val('L');
			      return;
			    }else{
			      $('#textarea_msg1').text(_byte+"/80");
			      $('#textarea_msg1').css('background','rgba(255,0,0,0.5)');
			      $('#division').val('S');
			    }
		    
	      });
		
	      $('#textarea_msg1').keyup();
	    
	    /* 숫자만 입력 */
	    $('.numbersOnly').keyup(function () { 
	        this.value = this.value.replace(/[^0-9]/g,'');
	    });
	    $('.numbersOnly').blur(function () { 
	    	this.value = this.value.replace(/[^0-9]/g,'');
	    });
	    
	    
	});
	
	function send1_bt() {
		var count = $("#sms_td_count input").last();
		count = count.attr('id');
		count = count.substring(count.length-1,count.length);
		count *= 1;
		count += 1;
		for(var i = 1; i < count; i++){
			var len1 = $("#tell1_"+i+"").val();
			var len2 = $("#user_name1_"+i+"").val();
			if(len1 != undefined){
			var len = len1.length;
				if(len2 == ""){
					alert("이름을 입력해주세요.");
					document.getElementById("user_name1_"+i).focus();
					return 0;
				}
		        if(len != 11 && len != 10){
		        	alert("번호를 확인해주세요.");
		        	document.getElementById("tell1_"+i).focus();
		        	return 0;
		        }
			}
		}
		
		for(var o=1; o<3; o++){
			var kfile = $('#searchForm2_'+o).val();
			if(kfile !="파일선택"){
				$('#division').val("M");
			}
		}
		var cc = $("#sms_td_count input").length/3;
		var result = confirm(cc+' 건 전송하시겠습니까?\n확인시 전송을 취소할수 없습니다.');
		if(result) {
				document.send_api.submit();
			} else {
			}
		
	}
	function sms_send_add_bt() {
		var count = $("#sms_td_count input").last();
		count = count.attr('id');
		var str = count.split('_');
		count = str[1];
		console.log(str[1]);
		count *= 1;
		count += 1;
		$("#sms_td_count").append("<div><input type='button' value='삭제' class='btn btn-outline-info' onclick='deleteLine1(this);'><input type='text' class='searchForm2' value='' name='user_name1' id='user_name1_"+count+"'><input value='' name='tell1' id='tell1_"+count+"' type='text' class='numbersOnly' ><br /></div>");
		$('.numbersOnly').keyup(function () { 
	        this.value = this.value.replace(/[^0-9]/g,'');
	    });
	    $('.numbersOnly').blur(function () { 
	    	this.value = this.value.replace(/[^0-9]/g,'');
	    });
	
	}
	function deleteLine1(obj){
		var tr = $(obj).parent();
		tr.remove();
	};
	
	
	
	function send2_bt() {
		 $.ajax({
		    url: 'lms_get.do', // 요청 할 주소
		    async: false, // false 일 경우 동기 요청으로 변경
		    type: 'GET', // GET, PUT
		    data: {
		    	'Result' : "4",
		    	'SeqNum' : "10",
		    	'UserCode' : "UserCode10",
		    	'DeptCode' : "DeptCode10",
		    	'Phone' : "Phone10",
		    	'RTime' : "RTime10",
		    	'RecvTime' : "RecvTime10",
		    	'ReqPhone' : "ReqPhone10",
		    	'CallCount' : "CallCount10",
		    	'Error' : "101"
		    	
		    }, // 전송할 데이터
		    dataType: 'json', // xml, json, script, html
		    success: function(jqXHR) {
		    }, // 요청 완료 시
		    error: function(jqXHR) {
		    	console.log("error");
		    }
		}); 
		 /* location.href = "lms_get.do"; */
	};
	function change_sms1(selectObj){
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
					phone = arr[0]+arr[1]+arr[2];
					var count = $("#sms_td_count input").last();
					count = count.attr('id');
					var str = count.split('_');
					count = str[1];
					console.log(str[1]);
					count *= 1;
					count += 1;
					$("#sms_td_count").append("<div><input type='button' value='삭제' class='btn btn-outline-info' onclick='deleteLine1(this);'><input class='searchForm2' type='text' value='"+name+"' name='user_name1' id='user_name1_"+count+"'><input value='"+phone+"' name='tell1' id='tell1_"+count+"' type='text' class='numbersOnly' ><br /></div>");
					$('.numbersOnly').keyup(function () { 
				        this.value = this.value.replace(/[^0-9]/g,'');
				    });
				    $('.numbersOnly').blur(function () { 
				    	this.value = this.value.replace(/[^0-9]/g,'');
				    });
				});
			},
			error : function(request, status, error){
				
			}
		});
	};
</script>
</head>
<body>
	<div id="header"><jsp:include page="../../header.jsp"></jsp:include></div>
	<jsp:include page="../../setting_submenu.jsp"></jsp:include>
	<div align="center"
		style="padding-top: 100px; padding-left: 200px; width: auto;">
		<h2 style="margin-bottom: 50px;">문자전송</h2>
		<form action="send_api.do" method="post" name="send_api" enctype="multipart/form-data">
			<input type="hidden" value="S" id="division" name="division" />
			<table>
				<tr>
					<td id="td_font_th">메시지</td>
					<td id="td_font_th">휴대폰 번호</td>
				</tr>
				<tr>
					<td rowspan="2" style="vertical-align:top; "><textarea class="form-control1" name="messages" id="messages1" maxlength="1990" style="min-height: 300px; margin-right:10px;">
(사)부산항관리센터
SMS 입력란
수신거부:051-400-3104</textarea><br /><span id="textarea_msg1"></span>
                   	<br />
                   	<div>
                   		<input class="searchForm2" value="파일선택" disabled="disabled" id="searchForm2_1" >
						<label for="file_up[0]" class="btn btn-info" style="margin-bottom: 0px;">파일 업로드</label>
						<input class="upload-hidden" type="file" onchange="javascript:change_fileq();" accept="image/jpg" required="required" id="file_up[0]" name="uploadfile" style="display: none;" />
					</div>
					<br />
					<div>
						<input class="searchForm2" value="파일선택" disabled="disabled" id="searchForm2_2">
						<label for="file_up[1]" class="btn btn-info" style="margin-bottom: 0px;">파일 업로드</label>
						<input class="upload-hidden" type="file" onchange="javascript:change_fileq();" accept="image/jpg" required="required" id="file_up[1]" name="uploadfile" style="display: none;" />
					</div>
					<br />
					<div>
						<input class="searchForm2" value="파일선택" disabled="disabled" id="searchForm2_3">
						<label for="file_up[2]" class="btn btn-info" style="margin-bottom: 0px;">파일 업로드</label>
						<input class="upload-hidden" type="file" onchange="javascript:change_fileq();" accept="image/jpg" required="required" id="file_up[2]" name="uploadfile" style="display: none;" />
					</div>
					<br />
					<a style="color: red;">* 500kb 미만, jpg이미지만 전송가능합니다.</a>
					</td>
					<c:if test="${auth2 eq '1'}">
					<td id="re_sms_td" style="height: 50px;">
						<select class="form-control" name="all_no" onchange="javascript:change_sms1(this);">
							<option value="0">선택</option>
								<c:forEach var="boardList" items="${boardList }">
								<option value="${boardList.all_no }">${boardList.all_no } / ${boardList.title } / ${boardList.re_en }</option>
								</c:forEach>
						</select>
					</td>
					</c:if>
				</tr>
				<tr>
					<td style="float:left; height:500px; vertical-align:middle; margin: 10px; padding: 10px; border: 3px solid; border-radius: 10px; border-style: ridge;">
					<div id="sms_td_count" style="height:480px; width:550px; vertical-align:middle; overflow:auto;">
					<div><input type="button" value="삭제" class='btn btn-outline-info' onclick='deleteLine1(this);'><input class="searchForm2" type="text" value="이름" name="user_name1" id="user_name1_1"><input value="" name="tell1" id="tell1_1" type="text" class="numbersOnly" ><br />
					</div>
					</div>
					</td>
				</tr>
			</table>
		</form>
		<br /> 
		<div style="width: 1000px;">
		<c:set var="auth" value="${auth}" />
			<c:choose>
	    		<c:when test="${auth eq '1' || auth2 eq '1'}">
					<input style="float:right; margin-bottom: 100px; margin-right: 70px;" class="btn btn-info" type="button" value="확인" onclick="send1_bt();" />
					<input style="float:right; margin-bottom: 100px; margin-right: 30px;" class="btn btn-info" type="button" value="추가" onclick="sms_send_add_bt();" />
					<!-- <input style="margin: 100px;" class="btn btn-info" type="button" value="test" onclick="send2_bt();" /> -->
				</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>