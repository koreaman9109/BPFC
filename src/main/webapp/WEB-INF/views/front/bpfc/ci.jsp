<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>CI소개</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#Introduce').parent().parent().parent().parent().addClass('m-gnb__item--active');
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
							<li class="c-lnb__item"><a href="intro.do"
								class="c-lnb__link">인사말</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a
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
				<div class="l-depth3">
					<div class="l-depth3__aligner">
						<h3 class="is-hidden">개요</h3>
						<ul class="l-depth3__list">
							<li class="l-depth3__item"><a href="history.do"
								class="l-depth3__link">연혁</a></li>
							<li class="l-depth3__item"><a href="business.do"
								class="l-depth3__link">사업</a></li>
							<li class="l-depth3__item l-depth3__item--active"><a
								href="ci.do" class="l-depth3__link">CI소개</a></li>
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
								class="breadcrumb__link">개요</div></li>
							<li class="breadcrumb__item breadcrumb__item-3"><div
								class="breadcrumb__link">CI소개</div></li>
						</ul>
					</div>
					<h4 class="c-h2">CI소개</h4>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="b-ci">
						<div class="b-ci__button">
							<div class="c-buttons c-buttons--right">
								<a href="resources/CI/BPFC_CI.zip"
								title="첨부파일 다운로드" download>
								<button class="c-button c-button--green">AI 파일 내려받기</button>
								</a>
							</div>
						</div>
						<div class="c-sections">
							<div class="b-ci__heading">심벌마크</div>
							<div class="b-ci__box">
								<div class="b-ci__left">
									심벌마크는 부산항 CI(Corporate Identification)의 가장 중요한 요소로 부산항의 이미지를
									대표적으로 표현하며 또한 (사)부산항시설관리센터 CI의 가장 중요한 요소로 세계속의 (사)부산항시설관리센터
									이미지를 인지시키는 대표적인 상징물이다. <br /> 바다를 상징하는 네이비 블루와 고객지향적인 에너지를
									의미하는 레드를 주색(<span>主色</span>)으로 상단의 웨이브는 바다의 물결, 뉴 웨이브 시대의 물결에
									대응하는 유연한 센터 이미지를 표현하였고, 하단의 닻 모양은 항구를 표현함과 동시에 전문기관으로서의 철저한 관리와
									스마트함을 표현하며 오렌지 색과 블루의 상호 보완은 고객과 센터와의 파트너쉽을 의미한다. <br /> 전체적으로
									방패모양의 구성으로 안정적인 시설관리 전문기관으로서의 이미지를 표현하였다.
								</div>
								<div class="b-ci__right">
									심벌마크는 (사)부산항시설관리센터의 정신적 일체감을 조성하고 대외적 커뮤니케이션에 있어 (사)부산항시설관리센터의
									이미지를 대표하는 기능을 한다. 따라서 매뉴얼 규정에 따른 정확한 사용과 관리를 통해 (사)부산항시설관리센터의
									이미지를 바르게 전달하고 쌓아가야 한다. <br /> 심벌마크의 형태, 색상 등은 절대 임의로 변경할 수 없다.
									이의 변경 사용은 (사)부산항시설관리센터의 이미지를 왜곡시거나 커뮤니케이션 효과를 약화시킨다. <br />
									따라서 심벌마크의 재생은 우선적 으로 본 매뉴얼의 재생원고를 이용하며 일반 제판방식이나 컴퓨터에 의한 출력방식으로
									재생하여야 한다. 위 두 방법이 불가능할 경우에는 반드시 제시된 그리드스케일을 이용해야만 한다.
								</div>
							</div>
						</div>

						<div class="c-sections">
							<div class="b-ci__heading">로고타입(Logotype)</div>
							<div class="b-ci__images">
								<div class="b-ci__image b-ci__image--border">
									<img src="images/bpfc/b-ci__logo-1.png" alt="(사)부산항시설관리센터" />
								</div>
								<div class="b-ci__image b-ci__image--border">
									<img src="images/bpfc/b-ci__logo-2.png"
										alt="Busan Port Facilities Management Center" />
								</div>
							</div>
							<div class="b-ci__txt">
								로고타입은 각각의 글자꼴 형태에 따라 비례 조정한 것이므로 글자의 꼴, 굵기, 비례 등을 임의로 변경하여서는
								아니된다. <br /> (사)부산항시설관리센터의 일관된 이미지 전달을 위하여 본 매뉴얼에 수록된 재생원고 또는
								CD-ROM에 수록된 원고를 정비례로 확대, 축소하여 사용하도록 한다. 단, 대형크기 또는 컴퓨터 출력이 불가능한
								경우에 본 항에 제시된 그리드에 준하여 정확이 작도하여야 한다.<br /> 로고타입은 (사)부산항시설관리센터의
								공식적인 명칭을 표시하기 위해 디자인 된 문자이다. <br /> 이는 심벌마크와의 조형적 통일성, 조합성 등을
								고려하여 균형과 비례를 시각적으로 조정한 것으로 어떤 경우라도 임의로 변경하여 사용할 수 없다. <br />
								로고타입의 재생은 매뉴얼의 재생원고를 이용하여 일반 제판방식이나 컴퓨터 출력방식으로 사용해야 한다.
							</div>
							<div class="b-ci__images">
								<div class="b-ci__image">
									<img src="images/bpfc/b-ci__logo-3.png" alt="(사)부산항시설관리센터" />
								</div>
								<div class="b-ci__image">
									<img src="images/bpfc/b-ci__logo-4.png"
										alt="Busan Port Facilities Management Center" />
								</div>
							</div>
						</div>

						<div class="c-sections">
							<div class="b-ci__heading">시그니쳐</div>
							<div class="b-ci__txt">로고타입은 각각의 글자꼴 형태에 따라 비례 조정한 것이므로 글자의
								꼴, 굵기, 비례 등을 임의로 변경하여서는 아니된다. (사)부산항시설관리센터의 일관된 이미지 전달을 위하여 본
								매뉴얼에 수록된 재생원고 또는 CD-ROM에 수록된 원고를 정비례로 확대, 축소하여 사용하도록 한다. 단, 대형크기
								또는 컴퓨터 출력이 불가능한 경우에 본 항에 제시된 그리드에 준하여 정확이 작도하여야 한다. 로고타입은
								(사)부산항시설관리센터의 공식적인 명칭을 표시하기 위해 디자인 된 문자이다. 이는 심벌마크와의 조형적 통일성,
								조합성 등을 고려하여 균형과 비례를 시각적으로 조정한 것으로 어떤 경우라도 임의로 변경하여 사용할 수 없다.
								로고타입의 재생은 매뉴얼의 재생원고를 이용하여 일반 제판방식이나 컴퓨터 출력방식으로 사용해야 한다.</div>
							<div class="b-ci__images">
								<div class="b-ci__image">
									<img src="images/bpfc/b-ci__mark-1.png"
										alt="(사)부산항시설관리센터, Busan Port Facilities Management Center 마크 가로 조합형" />
								</div>
								<div class="b-ci__image">
									<img src="images/bpfc/b-ci__mark-2.png"
										alt="(사)부산항시설관리센터, Busan Port Facilities Management Center 마크 세로 조합형" />
								</div>
							</div>
						</div>

						<div class="c-sections">
							<div class="b-ci__heading">전용색상</div>
							<div class="b-ci__txt">부산항의 아이덴티티(Identity)는 정확한 색상과 명도, 채도
								등이 유지되어 통일되게 사용되어야 한다. 아래에 예시된 별색 표준색상은 별색 배합잉크를 사용하여 옵셋인쇄하여야 하며
								아이덴티티 색상재현의 기준이 된다. 아이덴티티의 색상 재현은 별색사용을 원칙으로 하나 적용매체의 특성상 4원색으로
								인쇄되어여 할 때는 예시된 4월색 규정에 의해 표현되어야 한다. 아이덴티티의 색상은 인쇄설비, 잉크, 적용매체의
								특성 및 재질 등에 의해 발색 효과가 다르므로 항상 통일된 느낌의 색상 재현이 되도록 관리되어야 한다.</div>
							<div class="b-ci__colors-groups">
								<div class="b-ci__colors-group">
									<div class="b-ci__colors-heading">Main Color</div>
									<div class="b-ci__colors">
										<div class="b-ci__color b-ci__color-1">Pantone289c</div>
										<div class="b-ci__color b-ci__color-2">Pantone1788c</div>
									</div>
								</div>
								<div class="b-ci__colors-group">
									<div class="b-ci__colors-heading">Sub Color</div>
									<div class="b-ci__colors">
										<div class="b-ci__color b-ci__color-3">Pantone874c</div>
										<div class="b-ci__color b-ci__color-4">Pantone877c</div>
									</div>
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

		<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
		<!-- end -->
	</div>
</body>
</html>