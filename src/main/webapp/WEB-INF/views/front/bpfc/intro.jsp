<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>인사말</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#Introduce').parent().parent().parent().parent().addClass('m-gnb__item--active');
	/* $('#Introduce_1').css('color','#1b5c93'); */
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
						<h2 class="c-lnb__heading">BPFC 소개</h2>
						<ul class="c-lnb__list">
							<li class="c-lnb__item c-lnb__item--active"><a href="intro.do"
								class="c-lnb__link">인사말</a></li>
							<li class="c-lnb__item"><a
								href="history.do" class="c-lnb__link">개요</a></li>
							<li class="c-lnb__item"><a href="business-goal.do"
								class="c-lnb__link">경영목표</a></li>
							<li class="c-lnb__item"><a href="organization.do"
								class="c-lnb__link">조직도</a></li>
							<li class="c-lnb__item"><a href="location.do"
								class="c-lnb__link">오시는길</a></li>
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
								class="breadcrumb__link">BPFC 소개</div></li>
							<li class="breadcrumb__item breadcrumb__item-2"><div
								class="breadcrumb__link">인사말</div></li>
						</ul>
					</div>
					<h3 class="c-h2">인사말</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="b-intro">
					<div class="b-intro__aligner">
						<div class="b-intro__image">
							<img src="images/bpfc/b-intro__image.png"
								alt="부산항시설관리센터 강재화 사장님" />
						</div>
						<div class="b-intro__heading">
							고객 여러분, 반갑습니다. <br />(사)부산항시설관리센터 사장 강재화입니다.
						</div>
						<div class="b-intro__txt">
							우리 센터 홈페이지를 방문해 주신 여러분을 진심으로 환영합니다. <br /> <br /> 우리 센터는 1969년
							5월 부산항부두관리협회로 출범하여 지난 45여 년 간 부산항 공용부두의 수출입 화물관리와 경비보안업무 등 부산항
							부두관리업무를 수행하면서 부산항이 세계 굴지의 항만으로 성장하는데 기여하여 오다가 2002년에는 부산항부두관리공사로
							명칭을 변경하였습니다. <br /> <br /> 2008년 1월 정부의 경영혁신 추진계획에 따라 경비보안업무는
							부산항보안공사로 이관하고, 공용부두 화물 및 시설 관리전문회사로 거듭나게 되었으며, 정부의 공기업 선진화 방안
							시행으로 2009년 6월 30일 부산항부두관리공사를 폐지하고, 2009년 7월 1일 민간기업 형태인
							부산항부두관리(주)로 새로이 탄생하였습니다. <br /> <br /> 2012년 9월 항만공사법이 개정되고
							2013년 9월 부산항 여객터미널 등 관리업무를 항만관리법인에 위탁관리한다는 정부의 방침이 확정됨에 따라
							부산항부두관리(주)를 해산하고 2013년 12월 정부로부터 사단법인 부산항시설관리센터 설립허가를 받은데 이어
							항만관리법인으로 지정받아 2014년 1월 1일 (사)부산항시설관리센터가 창립하게 되었습니다. <br /> <br />
							우리센터는 “부산항 공용항만시설관리 분야의 전문적이고 종합적인 기능을 수행하는 기관”으로서 부산항 여객터미널 등
							공용시설의 서비스 개선, 부산항 여객터미널 관리 운영사업, 부산항 공용부두의 시설 및 수출입화물 관리사업, 민간경비업
							및 기타 위탁사업 등을 수행하게 되었습니다. <br /> <br /> 우리 센터 임직원 모두는 부산항 여객터미널
							등 공용시설을 이용하시는 모든 고객 여러분들께서 최상의 공공서비스를 제공받으실 수 있도록 고객 여러분들 의 소리에 귀
							기울이고, 항만 환경변화에 능동적으로 대처함은 물론, 발전적·창의적·효율적이면서 유연한 경영을 통하여 정부 및 관련
							기관의 기대와 요구에 부응하고, 고객 여러분들의 편의증진 및 공공서비스의 지속적인 개선을 위하여 최선을 다하겠습니다.
							<br /> <br /> 감사합니다.
						</div>
					</div>
					<div class="b-intro__signs">
						<div class="b-intro__sign b-intro__sign--txt">부산항 시설관리센터 사장</div>
						<div class="b-intro__sign b-intro__sign--img">
							<img src="images/bpfc/b-intro__sign.png"
							alt="부산항시설관리센터 강재화 사장님 사인" />
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
			var scrollControll = $.superscrollorama({
				reverse : false
			});

			TweenMax.to('.b-intro__heading', 1, {
				delay : .4,
				top : 0,
				opacity : 1,
				ease : Circ.easeOut
			}, .2)
			/*scrollControll.addTween('.b-intro__box', TweenMax.to(
					'.b-intro__sign img', .7, {
						left : 0,
						opacity : 1
					}, .5));*/
		</script>

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>