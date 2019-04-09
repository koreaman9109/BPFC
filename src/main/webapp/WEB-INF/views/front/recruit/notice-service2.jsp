<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<style type="text/css">
#button_chec_in {
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -16px;
	width: 84px;
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
</style>
<script type="text/javascript">
	function service_privacy_but() {
		var i = $("input:checkbox[id='c-check']").is(":checked");
		if (i != true) {
			alert("개인정보취급방침에 동의해주세요.");
		} else if (i == true) {
			alert("완료되었습니다.");
			document.service_privacy_ac.submit();
		}
	}
</script>
<title>알림서비스</title>
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
						<h2 class="c-lnb__heading">채용정보</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item"><a href="public.do"
								class="c-lnb__link">채용공고</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
								href="notice-service1.do" class="c-lnb__link">알림서비스</a></li>
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
									class="breadcrumb__link">채용정보</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
									class="breadcrumb__link">알림서비스</div></li>
						</ul>
					</div>
					<h3 class="c-h2">알림서비스</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="r-service">
					<div class="r-service__txt">부산항시설관리센터에서 처리하는 모든SMS 알림 서비스를 받아
						보실 수 있습니다</div>
					<form action="service_privacy_ac.do" name="service_privacy_ac"
						method="post">
						<div class="r-service__box">
							<div class="r-service__infos">
								<div class="r-service__info">
									<div class="r-service__key">성명</div>
									<div class="r-service__value">
										<div class="c-form">
											<label for="c-form__name" class="c-form__label">성명 입력</label>
											<input type="text" name="privacy_name" id="c-form__name"
												value="${nice.name }"
												class="c-form__input c-form__input--large" />
										</div>
									</div>
								</div>
								<div class="r-service__info">
									<div class="r-service__key">연락처 입력</div>
									<div class="r-service__value">
										<div class="c-form c-form--x-button">
											<label for="c-form__call" class="c-form__label">연락처</label> <input
												type="text" name="phone" id="c-form__call"
												value="${nice.mobileno }"
												class="c-form__input c-form__input--large" /> <a
												id="button_chec_in">인증완료</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" value="3" name="division" />
					</form>

					<div class="r-service__aligner">
						<div class="c-section">
							<label for="policy" class="is-hidden">개인정보처리방침</label>
							<textarea name="policy" id="policy" cols="30" rows="10"
								class="policy policy--small" tabindex="0" readonly>${privacy.agreement }</textarea>
							<div class="c-checkbox c-checkbox--center">
								<div class="c-checks">
									<input type="checkbox" name="c-check" id="c-check"
										class="c-check" /> <label for="c-check"
										class="c-check__label">개인정보취급방침에 동의합니다</label>
								</div>
							</div>
						</div>
						<div class="c-section c-section--small">
							<div class="c-buttons c-buttons--center">
								<button class="c-button c-button--large c-button--blue"
									onclick="service_privacy_but();">확인</button>
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

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>
