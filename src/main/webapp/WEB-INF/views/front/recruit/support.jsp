<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<style type="text/css">
.check_but {
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -16px;
	width: 94px;
	height: 32px;
	padding: 6px 0;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	border: 0;
	background-color: #4681b3;
	color: #fff;
	font-size: 16px;
	text-align: center;
	outline: none;
	-webkit-transition: background-color .2s;
	-ms-transition: background-color .2s;
	transition: background-color .2s;
}
.c-file__noti {
	margin-top: 5px;
	color: #999;
	font-size: 13px;
}
</style>
<title>채용안내 - 지원하기</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#recruit_na').parent().addClass('m-gnb__item--active');
    });
});
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

		<div class="c-container">
			<div class="c-lnbs">
				<div class="c-lnb">
					<div class="c-lnb__aligner">
						<h2 class="c-lnb__heading">채용·입찰정보</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item c-lnb__item--active"><a
								href="public.do" class="c-lnb__link">채용안내</a></li>
							<li class="c-lnb__item"><a href="notice-service1.do"
								class="c-lnb__link">입찰안내</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="c-headings">
				<div class="c-aligner">
					<div class="breadcrumb">
						<ul class="breadcrumb__list">
							<li class="breadcrumb__item breadcrumb__item--home"><div
									class="breadcrumb__link">
									<a href="main.do" id="content">홈</a>
								</div></li>
							<li class="breadcrumb__item breadcrumb__item-1"><div
									class="breadcrumb__link">채용·입찰정보</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
									class="breadcrumb__link">채용안내</div></li>
						</ul>
					</div>
					<h3 class="c-h2">채용안내</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="r-recruit">
					<div class="c-align">
						<form action="resume_support.do" name="resume_support"
							method="post" enctype="multipart/form-data">
							<input type="hidden" value="0" id="check1" name="check1" />
							<div class="c-section">
								<h3 class="c-box__heading">지원하기</h3>
								<input type="hidden" value="1" name="division" />
								<!-- 채용=1,문의=2 -->
								<div class="c-box">
									<div class="c-table2">
										<div class="c-table2__item">
											<div class="c-table2__key">이름</div>
											<div class="c-table2__value">
												<div class="c-form--middle c-form">
													<label for="c-name" class="c-form__label">이름</label> <input
														type="text" name="privacy_name" id="c-name"
														value="${nice.name }" class="c-form__input" style="border:none;" onfocus='this.blur();' readonly />
												</div>
											</div>
										</div>
										<div class="c-table2__item">
											<div class="c-table2__key">연락처</div>
											<div class="c-table2__value">
												<div class="c-form c-form--middle c-form--button">
													<label for="c-phone" class="c-form__label">연락처</label> <input
														type="text" name="phone" id="c-phone"
														value="${nice.mobileno }" class="c-form__input" style="border:none;" onfocus='this.blur();' readonly /> <a
														class="check_but">인증완료</a>
												</div>
											</div>
										</div>
										<div class="c-table2__item">
											<div class="c-table2__key">지원분야</div>
											<div class="c-table2__value">
												<div class="c-form--middle c-form">
													<label for="c-name" class="c-form__label">지원분야선택</label><select
														class="c-form__input" name="all_no" id="title_check" onchange="javascript:change_support(this);">
														<option>선택</option>
														<c:forEach var="titlelist" items="${titlelist }"
															varStatus="status">
															<option value="${titlelist.all_no }" id="${titlelist.title }">${titlelist.title } / ${titlelist.re_en }</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="c-table2__item">
											<div class="c-table2__key">첨부파일</div>
											<div class="c-table2__value">
												<div class="c-form c-form--middle">
													<div class="c-files">
														<label for="c-file" class="c-file__label" style="margin-top: 5px;">첨부파일선택</label> <input
															type="file" name="uploadfile[0]" id="c-file"
															class="c-file" /> <input type="text" readonly="readonly"
															class="c-file__name" name="fileName" id="filename_text"
															title="채용공고 지원하기 첨부파일" />
														<button type="button" class="c-form__button">파일선택</button><br>
													</div>
													<div class="c-file__noti">*파일이 2개 이상일 경우 압축하여 지원바랍니다.</div>
												</div>
											</div>
										</div>
										<div class="c-table2__item">
											<div class="c-table2__key">개인정보처리방침</div>
											<div class="c-table2__value">
												<label for="policy" class="is-hidden">개인정보처리방침</label>
												<textarea name="policy" id="policy" cols="30" rows="10"
													class="policy" tabindex="0" readonly>${privacy.agreement }
												</textarea>
												<div class="c-checkbox">
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
							<input type="hidden" value="${number }" name="all_no" />
							<c:forEach var="over" items="${over }" varStatus="status">
							<input type="hidden" value="${over.all_no }" id="over_${status.count }" />
							<input type="hidden" value="Y" name="USE_YN" />
							</c:forEach>
							<input type="hidden" value="${fn:length(over) }" id="over_length" />
							
						</form>
						<div class="c-section">
							<div class="c-buttons c-buttons--center">
								<button onclick="support_bt()"
									class="c-button c-button--large c-button--blue" style="margin-top:10px;">지원하기</button>
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
			
			$('.c-file').on('change',function() {
						if (window.FileReader) {
							var filename = $(this)[0].files[0].name;
						} else {
							var filename = $(this).val().split('/').pop()
									.split('\\').pop();
						}
					 	
					 	$(this).siblings('.c-file__name').val(filename);
			});

			// focus
			$('.c-table2__item:nth-child(3) .c-form__button').on('click',
					function() {
						$('.c-file__label').click();
					});
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>
