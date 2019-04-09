<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="ko">
<head>


<%@ include file="../../home_include.jsp"%>

<title>문의사항 수정</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#customer_na').parent().addClass('m-gnb__item--active');
});
</script>
<script type="text/javascript">

 $(document).ready(function() {	
	
		$("#inquiry_division").val("${inquiry_detail.inquiry_division}").attr("selected", "selected");
	 
		CKEDITOR.replace('content_write');
		CKEDITOR.config.height = 500;
		
		$("#list").click(function() {
			if (confirm("목록으로 돌아가시겠습니까? 작성중인 내용은 저장되지 않습니다.") == true){
			location.href = "inquiry.do?board_id=5";
		}else{
			return;
			}
				});
		
		  var uploadFile = $('.fileBox .uploadBtn');
			uploadFile.on('change', function(){
				if(window.FileReader){
					var filename = $(this)[0].files[0].name;
				} else {
					var filename = $(this).val().split('/').pop().split('\\').pop();
				}
				$(this).siblings('.fileName').val(filename);
			});
		
			}); 

//이중폼 보내는 방법
   function detailSubmit(index) {
	    if (index == 1) {
			if(confirm("정말로 수정 하시겠습니까?")) {
				//비밀번호 입력여부 체크
				if (document.listForm.password.value == "") {
		            alert("비밀번호를 입력하지 않았습니다.")
		            document.listForm.password.focus()

		            return false;

		        }
				//비밀번호와 비밀번호 확인 일치여부 체크
				if (document.listForm.password.value != document.listForm.passwordchk.value) {
		            alert("비밀번호가 일치하지 않습니다")
		            document.listForm.password.value = ""
		            document.listForm.password.focus()
		            

		            return false;
		        }
				var ObjUserPassword = document.listForm.password;
				//비밀번호 길이 체크(6~14자 까지 허용)
				 if(ObjUserPassword.value.length<6) {
			alert("비밀번호는 영문, 숫자, 특수문자(!@$%^&* 만 허용)를 혼합하여 6~16자까지 사용 가능합니다. 영문은 대소문자를 구분합니다.");
					return false;
					}				
				
				if(!ObjUserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
			alert("비밀번호는 영문, 숫자, 특수문자(!@$%^&* 만 허용)를 혼합하여 6~16자까지 사용 가능합니다. 영문은 대소문자를 구분합니다.");
				    return false;
				 }
				
				var SamePass_0 = 0; //동일문자 카운트
				var SamePass_1 = 0; //연속성(+) 카운드
				var SamePass_2 = 0; //연속성(-) 카운드
				
				for(var i=0; i < ObjUserPassword.value.length; i++) {
				    var chr_pass_0 = ObjUserPassword.value.charAt(i);
				    var chr_pass_1 = ObjUserPassword.value.charAt(i+1);
				    
				    //동일문자 카운트
				    if(chr_pass_0 == chr_pass_1) {
				      SamePass_0 = SamePass_0 + 1
				    }
				    
				    var chr_pass_2 = ObjUserPassword.value.charAt(i+2);

				    //연속성(+) 카운드
				    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
				      SamePass_1 = SamePass_1 + 1
				    }
				    
				    //연속성(-) 카운드
				    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
				      SamePass_2 = SamePass_2 + 1
				    }
				    }
				  if(SamePass_0 > 1) {
				    alert("동일문자를 3번 이상 사용할 수 없습니다.");
				    return false;
				  }
				 
				  if(SamePass_1 > 1 || SamePass_2 > 1 ) {
				    alert("연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.");
				    return false;
				  }
					//제목 입력여부 확인
					if (document.listForm.title.value == "") {
			            alert("제목을 입력해주세요.")
			            document.listForm.title.focus()

			            return false;

			        }
					if (CKEDITOR.instances.content_write.getData() == "") {
			            alert("내용을 입력해주세요.")
			            document.listForm.content_write.focus()

			            return false;

			        }	
		        
				// 폼에 입력한 데이터를 서버로 전송
				document.listForm.action='inquiryUserUpdate.do';
					alert("수정 되었습니다.");
						
				}else{
					alert("취소 되었습니다.");
					/* location.href = "inquiry.do?board_id=" + "${inquiry_detail.board_id}"; */ //2018-10-24 새로고침 방지를 위해 return으로 변경
					
					return;
				}	
	    }
	    if (index == 2) {
	    	var seqid = document.listForm.seq_id.value;
	    	if(confirm("정말로 취소 하시겠습니까? 작성중인 내용은 저장되지않습니다.")) {
	    	alert("seq_id = " + seqid);	
	      document.listForm.action='inquiry-body.do?seq_id'+seqid;
	    	}else{
	    		return false;
	    	}
	    }
	    document.listForm.submit();
	  };
	  
	  function delFile(idx){
			var obj = $('#flist_' + idx);
			
			//alert($(obj).find('#flag').val());
			$(obj).find('#flag').val("D");
			$(obj).hide(); 
			$('#add').append(
					'<div class="c-files">' + 
					'<label for="c-file" class="c-file__label" >첨부파일선택</label>' + 
					'<input type="file" name="uploadfile[0]" id="c-file" class="c-file"/>' +
					'<input type="text" readonly="readonly" class="c-file__name" />' +
					'<button class="c-form__button">파일선택</button>' +
					
					'</div>'); 
					
			/*  $('#add').append(
					'<div>' + 
					 
					'<input type="file" multiple id="orgFile" name="uploadfile[0]" style="display: none;" />' +
					
					'<button type="button" id="newFile" onclick="check()" class="c-form__button">파일선택</button>' +
					
					'</div>');  */
					
			/* $('#add').append(
					'<div class="fileBox">' + 
					'<input type="text" class="fileName" readonly="readonly">' +
					'<label for="uploadBtn" class="btn_file">찾아보기</label>'+ 
					'<input type="file" id="uploadBtn"  name="uploadfile[0]" class="uploadBtn" />' +
					'</div>');	 */	
					
					

					


	
		    }
	  
		
	  
	  function eventOccur(evEle, evType){
			 if (evEle.fireEvent) {
			 evEle.fireEvent('on' + evType);
			 } else {
			 //MouseEvents가 포인트 그냥 Events는 안됨~ ??
			 var mouseEvent = document.createEvent('MouseEvents');
			 /* API문서 initEvent(type,bubbles,cancelable) */
			 mouseEvent.initEvent(evType, true, false);
			 var transCheck = evEle.dispatchEvent(mouseEvent);
			 if (!transCheck) {
			 //만약 이벤트에 실패했다면
			 console.log("클릭 이벤트 발생 실패!");
			 }
			 }
			}
		
	  function check(){
		  eventOccur(document.getElementById('orgFile'),'click');
		  /*alert(orgFile.value);*/
		 }
	  
		
	  $(document).ready(function() {   
		   var fileTarget = $('.upload-hidden'); 
		    fileTarget.on('change', function(){ // 값이 변경되면 
		       if(window.FileReader){ // modern browser 
		          var filename = $(this)[0].files[0].name; 
		       } else { // old IE 
		          var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
		          } // 추출한 파일명 삽입
		          $(this).siblings('#tttt').val(filename);
		          $("#flag").val("D"); 
		      });
		});


	  
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);
</script>

<style>


.fileBox .fileName {display:inline-block;width:190px;height:30px;padding-left:10px;margin-right:5px;line-height:30px;border:1px solid #aaa;background-color:#fff;vertical-align:middle}
.fileBox .btn_file {display:inline-block;border:1px solid #000;width:100px;height:30px;font-size:0.8em;line-height:30px;text-align:center;vertical-align:middle}
.fileBox input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}
</style>


</head>
<body>
	<!-- 배너방 -->
	<jsp:include page="../../banner.jsp"></jsp:include>
	<!-- end -->
	<div class="c-wrap">
		<!-- 상단메뉴 -->
		<jsp:include page="../../sub_topmenu.jsp"></jsp:include>
		<!-- end -->

		<div id="content2" class="c-container">
			<div class="c-lnbs">
				<div class="c-lnb">
					<div class="c-lnb__aligner">
						<h2 class="c-lnb__heading">고객마당</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a
								href="center-news.do?board_id=1" class="c-lnb__link">공지사항</a></li>
							<li class="c-lnb__item"><a href="newsletter.do?board_id=2"
								class="c-lnb__link">BPFC 소식지</a></li>
							<li class="c-lnb__item"><a href="photo.do?board_id=3"
								class="c-lnb__link">포토갤러리</a></li>
							<li class="c-lnb__item"><a href="lost.do?board_id=6"
								class="c-lnb__link">분실물안내</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="inquiry.do?board_id=5"
								class="c-lnb__link">문의사항</a></li>
							<li class="c-lnb__item"><a href="data.do?board_id=9"
								class="c-lnb__link">자료실</a></li>		
						</ul>
					</div>
				</div>
			</div>
			<div class="c-headings">
				<div class="c-aligner">
					<div class="breadcrumb">
						<ul class="breadcrumb__list">
							<li class="breadcrumb__item breadcrumb__item--home"><div class="breadcrumb__link"><a href="main.do" id="content">홈</a></div></li>
							<li class="breadcrumb__item breadcrumb__item-1"><div
								class="breadcrumb__link">고객마당</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">문의사항</div></li>
						</ul>
					</div>
					<h3 class="c-h2">문의사항</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="r-recruit">
					<div class="c-align">
			<form name="listForm"  method="post" enctype="multipart/form-data">
			
										
						<div class="c-section">
							<div class="c-box">
								<div class="c-table2">
									<div class="c-table2__item">
										<div class="c-table2__key">이름</div>
										<div class="c-table2__value">
										<div class="c-form--middle c-form">
											<label for="c-name" class="c-form__label">이름</label>
											<input type="text" style="border: none;"  name="privacy_name" id="privacy_name" readonly="readonly"
											value="${inquiry_detail.user_name}" class="c-form__input" />
											<input style="width: 100%;" type="hidden" id="division" name="division"	placeholder="division문의" value="2" />
											<input type="hidden" id="file_key" name="file_key" value="${board_file.seq_id}" />
		
										</div>
										</div>
									</div>
									<div class="c-table2__item">
										<div class="c-table2__key">비밀번호</div>
										<div class="c-table2__value">
											<div class="c-form c-form--small">
												<label for="c-password" class="is-hidden" >비밀번호</label> <input
													type="password" name="password" id="password"
													class="c-form__input" value="${inquiry_detail.password}" />
													 <input
														type="hidden" name="phone" id="c-phone"
														value="${nice.mobileno }" class="c-form__input" /> <a style="display: none;"
														class="check_but">인증완료</a>
													<input type="hidden" name="seq_id" id="seq_id" value="${inquiry_detail.seq_id }" />													
													<input type="hidden" name="board_id" id="board_id" value="${inquiry_detail.board_id}" />
													
											</div>
										</div>
										</div>
										
										<div class="c-table2__item">
										<div class="c-table2__key">비밀번호 확인</div>
										<div class="c-table2__value">
											<div class="c-form c-form--small">
									<div class="c-form c-form--small">
												<label for="c-password" class="is-hidden">비밀번호 확인</label> 
												<input type="password" name="passwordchk" id="passwordchk" class="c-form__input" value="${inquiry_detail.password}" />
														<!-- <a class="check_but">인증완료</a> -->
											</div>
										</div> 
									</div>
									</div>
									<div class="c-table2__item">
										<div class="c-table2__key">분류</div>
										<div class="c-table2__value">
											<div class="c-form c-form--small">
												<div class="c-selectbox">
													<label for="c-select" class="is-hidden">문의사항 분류 선택</label>
													<select name="inquiry_division" id="inquiry_division" class="c-select" >
													    
														<option value="1">문의</option>
														<option value="2">건의</option>
														<option value="3">불만</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="c-table2__item">
										<div class="c-table2__key">제목</div>
										<div class="c-table2__value">
											<div class="c-form">
												<label for="c-subject" class="is-hidden">제목</label> <input
													type="text" name="title" id="title"
													class="c-form__input" value="${inquiry_detail.title}"/>
											</div>
										</div>
									</div>
									<div class="c-table2__item">
										<div class="c-table2__key">첨부파일</div>
											
										<div  class="c-table2__value">

									    <c:choose>
										<c:when test="${fn:length(file_list) == 0}">		
									   
									   <div class="c-form c-form--middle">
												<div class="c-files">
													<label for="c-file" class="c-file__label">첨부파일선택</label>
													<input type="file" name="uploadfile[0]" id="c-file" class="c-file"/>
													<input type="text" readonly="readonly" class="c-file__name" />
													<button class="c-form__button">파일선택</button>
												</div>
										</div>
									   
										</c:when>
										<c:otherwise>		
									    <c:forEach var="file_list" items="${file_list}"  varStatus="status">
										<div class="c-form c-form--middle"  id="add"  >
                                       <div id="flist_${status.count}">
                                       <input type="hidden" name="fileKey" id="fileKey" value="${file_list.file_key}" />
                                       <input type="hidden"  name="flag" id="flag" value="C" />
                                       <input type="hidden" id="fName" name="fName" value="${file_list.file_name2}">
                                       <%-- <button class="btn btn-primary" id="downBtn" onclick="delFile('${status.count}');">삭제</button> --%>
                                       <input type="text" style="width: 100%; border: none;" id="tttt" value="${file_list.file_name}" readonly="readonly" >
                                       <a href="#"><label for="file_up[0]" class="c-form__button" style="margin-bottom: 0px;">파일 수정</label></a>
                                       <input class="upload-hidden" type="file" name="uploadfile[0]" required="required" id="file_up[0]" style="display: none;" />
	                                    </div>
	                                	 </div>
											
										</c:forEach>
										</c:otherwise>
										</c:choose>
										</div>

										
									</div>

								</div>
								<div class="c-form">
									<label for="c-textarea" class="is-hidden">문의사항 작성</label>
									<textarea name="content" id="content_write" cols="30" rows="10"
										class="c-form__textarea" >${inquiry_detail.content}</textarea>
								</div>
							</div>
						</div>
						</form>
						<div class="c-section c-section--x-small">
							<div class="c-buttons c-buttons--justify">
								<div class="c-buttons__left">
									<button id="list"
										class="c-button c-button--small c-button--white">목록</button>
								</div>
								<div class="c-buttons__right">
									<button id="btnSave" type="button" name="btnSave" onclick="detailSubmit(1)"
										class="c-button c-button--large c-button--blue">저장</button>
									<button id="btnExit" type="button" name="btnExit" onclick="detailSubmit(2)"
										class="c-button c-button--large c-button--white">취소</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- // 내용-->
		</div>

		<!-- 바로가기 및 맨위로 -->
		<jsp:include page="../../sub_quick.jsp"></jsp:include>
		<!-- end -->
		
				<script type="text/javascript">
				$('.c-file').on(
					'change',
					function() {
						if (window.FileReader) {
							var filename = $(this)[0].files[0].name;
						} else {
							var filename = $(this).val().split('/').pop()
									.split('\\').pop();
						}
						$(this).siblings('.c-file__name').val(filename);
					});

				// focus
				$('.c-table2__item:nth-child(6) .c-form__button').on('click', function(){
					$('.c-file__label').click();
				});
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>
