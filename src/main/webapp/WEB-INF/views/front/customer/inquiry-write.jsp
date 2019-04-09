<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>문의사항 글쓰기</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#customer_na').parent().addClass('m-gnb__item--active');
});
</script>
<script type="text/javascript">

$(document).ready(function() {
	
				CKEDITOR.replace('content_write');
				CKEDITOR.config.height = 500;

				$("#list").click(function() {
					if (confirm("목록으로 돌아가시겠습니까? 작성중인 내용은 저장되지 않습니다.") == true){
					location.href = "inquiry.do?board_id=5";
				}else{
					return;
					}
						});
				
	$("#btnSave").click(function() {

		if (confirm("저장하시겠습니까? ") == true) {
			//이름 입력여부체크
			if (document.form1.privacy_name.value == "") {
	            alert("이름이 입력되지 않았습니다.")
	            document.form1.privacy_name.focus()

	            return false;

	        }
			//비밀번호 입력여부 체크
			if (document.form1.password.value == "") {
	            alert("비밀번호를 입력하지 않았습니다.")
	            document.form1.password.focus()

	            return false;

	        }
			//비밀번호와 비밀번호 확인 일치여부 체크
			if (document.form1.password.value != document.form1.passwordchk.value) {
	            alert("비밀번호가 일치하지 않습니다")
	            document.form1.password.value = ""
	            document.form1.password.focus()
	            

	            return false;
	        }
			var ObjUserPassword = document.form1.password;
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
		if (document.form1.title.value == "") {
            alert("제목을 입력해주세요.")
            document.form1.title.focus()

            return false;

        }
		if (CKEDITOR.instances.content_write.getData() == "") {
            alert("내용을 입력해주세요.")
            document.form1.content_write.focus()

            return false;

        }	
		
		//접속권한 체크 여부 확인
		if($('input:checkbox[name="c-check"]').is(":checked") == false)  {
          
			alert("개인정보취급방침에 동의하여 주십시오.")
            return false;
          }
	  
			  

			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();

		} else {
			return;
		}
	});
});

document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);
</script>
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
							<form name="form1" method="post" action="inquiry_user_insert.do" enctype="multipart/form-data">
						<div class="c-section">
							<div class="c-box">
								<div class="c-table2">
									<div class="c-table2__item">
										<div class="c-table2__key">이름</div>
										<div class="c-table2__value">
										<div class="c-form--middle c-form">
											<label for="c-name" class="c-form__label">이름</label> <input
											type="text" style="border: none;" readonly="readonly" onfocus="this.blur()"  name="privacy_name" id="privacy_name"
											value="${nice.name}" class="c-form__input" />
											<input style="width: 100%;" type="hidden"
											id="board_id" name="board_id" 
											placeholder="게시판번호" value="5" />
											<input style="width: 100%;" type="hidden"
											id="division" name="division" 
											placeholder="division문의" value="2" />
											
										</div>
										</div>
									</div>
									<div class="c-table2__item">
										<div class="c-table2__key">비밀번호</div>
										<div class="c-table2__value">
											<div class="c-form c-form--small">
												<label for="c-password" class="is-hidden">비밀번호</label> 
												<input type="password" name="password" id="password" class="c-form__input" />
												<input type="hidden" name="phone" id="c-phone" value="${nice.mobileno }" class="c-form__input" /> 
														<!-- <a class="check_but">인증완료</a> -->
											</div>
										</div>
									</div>
									
									
										<div class="c-table2__key">비밀번호 확인</div>
										<div class="c-table2__value">
											<div class="c-form c-form--small">
									<div class="c-form c-form--small">
												<label for="c-password" class="is-hidden">비밀번호 확인</label> 
												<input type="password" name="passwordchk" id="passwordchk" class="c-form__input" />
														<!-- <a class="check_but">인증완료</a> -->
											</div>
										</div>
									</div>
									
									
									<div class="c-table2__item">
										<div class="c-table2__key">분류</div>
										<div class="c-table2__value">
											<div class="c-form c-form--small">
												<div class="c-selectbox">
													<label for="c-select" class="is-hidden">문의사항 분류 선택</label>
													<select name="inquiry_division" id="inquiry_division" class="c-select">
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
													class="c-form__input" />
											</div>
										</div>
									</div>
 									<div class="c-table2__item">
										<div class="c-table2__key">첨부파일</div>
										<div class="c-table2__value">
											<div class="c-form c-form--middle">
												<div class="c-files">
													<label for="c-file" class="c-file__label">첨부파일선택</label>
													<input type="file" name="uploadfile[0]" id="c-file" class="c-file"/>
													<input type="text" readonly="readonly" class="c-file__name" />
													<button class="c-form__button">파일선택</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="c-form">
									<label for="c-textarea" class="is-hidden">문의사항 작성</label>
									<textarea name="content" id="content_write" cols="30" rows="10"
										class="c-form__textarea"></textarea>
								</div>
								<div class="c-table2">
										<div class="c-table2__item">
											<div class="c-table2__key">개인정보처리방침</div>
											<div class="c-table2__value">
												<label for="policy" class="is-hidden">개인정보처리방침</label>
												<textarea name="policy" id="policy" cols="30" rows="10"
													class="policy policy--x-small" tabindex="0" readonly>${privacy.agreement }
												</textarea>
												<div class="c-checkbox c-checkbox--small">
													<div class="c-checks">
														<input type="checkbox" name="c-check" id="c-check"
															class="c-check" /> <label for="c-check"
															class="c-check__label">개인정보취급방침에 동의합니다</label>
													</div>
												</div>
											</div>
										</div>
									</div>
							</div>
						</div>
						
						<!-- 새글 알림 등록 sms -->
						<input type="hidden" value="admin" name="SendId" />
						<input type="hidden" value="admin" name="SendName" /> 
						<input type="hidden" value="https://www.bpfmc.or.kr" name="Url" /> 
						<input type="hidden" value="0" name="Rdate" /> 
						<input type="hidden" value="0" name="Rtime" /> 
						<input type="hidden" value="0" name="Result" /> 
						<input type="hidden" value="S" name="Kind" /> 
						<input type="hidden" value="0" name="ErrCode" /> 
						<input type="hidden" value="0" name="Retry1" /> 
						<input type="hidden" value="0" name="Retry2" /> 
						<input type="hidden" value="0" name="LastTime" />
						<input type="hidden" value="문의사항 새 글이 등록되었습니다." name="Msg" />
						
						
						</form>
							<div class="c-section c-section--x-small">
							<div class="c-buttons c-buttons--justify">
								<div class="c-buttons__left">
									<button id="list"
										class="c-button c-button--small c-button--white">목록</button>
								</div>
								<div class="c-buttons__right">
									<button id="btnSave" name="btnSave"
										class="c-button c-button--large c-button--blue">등록</button>
									<button onclick="location.href='inquiry.do'"
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
				$('.c-table2__item:nth-child(5) .c-form__button').on('click', function(){
					$('.c-file__label').click();
				});
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>
