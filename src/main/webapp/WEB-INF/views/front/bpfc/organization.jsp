<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<title>조직도</title>
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
							<li class="c-lnb__item"><a
								href="history.do" class="c-lnb__link">개요</a></li>
							<li class="c-lnb__item"><a href="business-goal.do"
								class="c-lnb__link">경영목표</a></li>
							<li class="c-lnb__item c-lnb__item--active"><a href="organization.do"
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
								class="breadcrumb__link"> 조직도</div></li>
						</ul>
					</div>
					<h3 class="c-h2">조직도</h3>
				</div>
			</div>
			<!-- 내용-->
			<div class="c-contents">
				<div class="c-content">
					<div class="b-organization">
					<form name="organization_sch" action="organization2_sch.do" method="post">
						<div class="b-organization__searchs">
							<div class="b-organization__search-boxs">
								<label for="b-organization__select" class="b-organization__search-box b-organization__search-box-1">직원검색</label>
								<div class="b-organization__search-box b-organization__search-box-2">
									<div class="b-organization__selects">
										<select name="sch_type" id="b-organization__select" class="b-organization__select">
											<option value="bpfc_name">이름</option>
											<option value="bpfc_department">부서</option>
										</select>
									</div>
								</div>
							</div>
							<div class="b-organization__search-box b-organization__search-box-3">
								<div class="b-organization__search">
									<label for="b-organization__search" class="is-hidden">직원검색 입력</label>
									<input type="text" name="sch_value" id="b-organization__search" class="b-organization__search-input" />
									<button onclick="organization_sch_bt();" class="b-organization__search-button">검색버튼</button>
								</div>
							</div>
						</div>
						</form>
						<div class="b-organization__boxs">
							<ul>
								<li class="b-organization__boxs_left"><a href="#" class="b-organization__heading b-organization__heading--ceo" onclick="bpfc1('사장');" style="cursor:pointer;">사장</a>
									<ul>
										<li class="b-organization__boxs_left"><a href="#" class="b-organization__heading b-organization__heading--white" onclick="bpfc1('본부장');" style="cursor:pointer;">본부장</a>
											<ul>
												<li class="b-organization__boxs_left">
													<div class="b-organization__box b-organization__box-1">
													<a href="#" class="b-organization__heading"><span onclick="bpfc1('B000');" style="cursor:pointer;">경영<br />지원실</span></a>
														<ul class="b-organization__list">
															<li class="b-organization__item"><a href="#" onclick="bpfc1('B1');" class="b-organization__link" title="경영기획부 검색">경영기획부</a></li>
															<li class="b-organization__item"><a href="#" onclick="bpfc1('B2');" class="b-organization__link" title="운영지원부 검색">운영지원부</a></li>
															<li class="b-organization__item"><a href="#" onclick="bpfc1('B3');" class="b-organization__link" title="전산부 검색">전산부</a></li>
														</ul>
													</div>
												</li>
												<li class="b-organization__boxs_left">
													<div class="b-organization__box b-organization__box-2">
													<a href="#" class="b-organization__heading"><span onclick="bpfc1('C000');" style="cursor:pointer;">항만시설<br />관리사업소</span></a>
														<ul class="b-organization__list">
															<li class="b-organization__item"><a href="#" onclick="bpfc1('C1');" class="b-organization__link" title="공용시설관리팀 검색">공용시설관리팀</a></li>
															<li class="b-organization__item"><a href="#" onclick="bpfc1('C2');" class="b-organization__link" title="화물관리팀 검색">화물관리팀</a></li>
															<li class="b-organization__item"><a href="#" onclick="bpfc1('C3');" class="b-organization__link" title="연안터미널관리팀 검색">연안터미널관리팀</a></li>
															<li class="b-organization__item"><a href="#" onclick="bpfc1('C4');" class="b-organization__link" title="BPA청사관리팀 검색">B<br />P<br />A<br />청사관리팀</a></li>
															<li class="b-organization__item"><a href="#" onclick="bpfc1('C5');" class="b-organization__link" title="영도시설관리팀 검색">영도시설관리팀</a></li>
														</ul>
													</div>
												</li>
												<li class="b-organization__boxs_left_1">
													<div class="b-organization__box b-organization__box-3" id="b-organization__boxs_left_1_div">
													<a href="#" class="b-organization__heading"><span onclick="bpfc1('D000');" style="cursor:pointer;">국제터미널<br />관리사업소</span></a>
														<ul class="b-organization__list">
															<li class="b-organization__item"><a href="#" onclick="bpfc1('D1');" class="b-organization__link" title="국제터미널관리팀 검색">국제터미널관리팀</a></li>
														</ul>
													</div>
												</li>
												<li class="b-organization__boxs_left_1">
													<div class="b-organization__box b-organization__box-4" id="b-organization__boxs_left_1_div">
													<a href="#" class="b-organization__heading"><span onclick="bpfc1('E000');" style="cursor:pointer;">컨벤션<br />사업소</span></a>
														<ul class="b-organization__list">
															<li class="b-organization__item"><a href="#" onclick="bpfc1('E1');" class="b-organization__link" title="컨벤션운영팀 검색">컨벤션운영팀</a></li>
														</ul>
													</div>
												</li>
												<li class="b-organization__boxs_left">
													<div class="b-organization__box b-organization__box-5">
													<a href="#" class="b-organization__heading"><span onclick="bpfc1('F000');" style="cursor:pointer;">신항<br />관리사업소</span></a>
														<ul class="b-organization__list">
															<li class="b-organization__item"><a href="#" onclick="bpfc1('F1');" class="b-organization__link" title="신항관리팀 검색">신항관리팀</a></li>
															<li class="b-organization__item"><a href="#" onclick="bpfc1('G1');" class="b-organization__link" title="항망공용전기팀 검색">항만공용전기팀</a></li>
														</ul>
													</div>
												</li>
											</ul>
										</li>
									</ul>
								</li>
							</ul>
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
		<script type="text/javascript">
		 function bpfc1(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc2(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc3(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc4(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc5(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc6(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc7(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc8(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc9(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc10(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc11(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc12(name) {
	    	  location.href="organization2.do?department="+encodeURI(name);
		}
	      function bpfc20(name) {
				location.href = "organization2.do?department="
						+ encodeURI(name);
			}
			function bpfc21(name) {
				location.href = "organization2.do?department="
						+ encodeURI(name);
			}
			function bpfc22(name) {
				location.href = "organization2.do?department="
						+ encodeURI(name);
			}
			function bpfc23(name) {
				location.href = "organization2.do?department="
						+ encodeURI(name);
			}
			function bpfc24(name) {
				location.href = "organization2.do?department="
						+ encodeURI(name);
			}
			function bpfc25(name) {
				location.href = "organization2.do?department="
						+ encodeURI(name);
			}
			function bpfc26(name) {
				location.href = "organization2.do?department="
						+ encodeURI(name);
			}
		</script>
	</div>
</body>
</html>