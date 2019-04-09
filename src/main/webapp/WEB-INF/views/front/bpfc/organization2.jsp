<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<form name="organization2_sch" action="organization2_sch.do" method="post">
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
									<button  onclick="organization2_sch_bt();" class="b-organization__search-button">검색버튼</button>
								</div>
							</div>
						</div>
						</form>
						
						<!-- 상세내용 추가 테이블 -->
						
<%-- 						<div class="c-heading">
								<h3 class="c-h3">국제터미널 관리 사업소</h3>
						</div>
						<div class="c-tables c-tables--scroll" style="padding-bottom:100px;">
						<table class="c-table">
						<caption><span class="is-hidden">국제터미널 관리 사업소: 성명, 담당업무, 직위/직책, 전화번호, 팩스, 전자우편, 담당업무 세부내용</span></caption>
								<colgroup>
									<col style="width: 25%" />
									<col style="width: 25%" />
									<col style="width: 25%" />
									<col style="width: 25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">성명</th>
										<td class="c-table__left">정호영</td>
										<th scope="row" class="c-table__b-left">담당업무</th>
										<td class="c-table__left">-</td>
									</tr>
									<tr>
										<th scope="row">직위/직책</th>
										<td class="c-table__left">팀장</td>
										<th scope="row" class="c-table__b-left">전화번호</th>
										<td class="c-table__left">0303-3444-1234</td>
									</tr>
									<tr>
										<th scope="row">팩스</th>
										<td class="c-table__left">0303-3444-1234</td>
										<th scope="row" class="c-table__b-left">전자우편</th>
										<td class="c-table__left">
											<button class="c-button c-button--blue">아이핀 인증</button>
										</td>
									</tr>
									<tr>
										<th scope="col" colspan="4">담당업무 세부내용</th>
									</tr>
									<tr>
										<td colspan="4" class="c-table__left">
											담당업무 및 세부내용이 들어갑니다.
										</td>
									</tr>
								</tbody>
						</table>
						</div>
						
						 --%>
						
						<div class="c-heading">
							<h3 class="c-h3">
								${bpfc } <span class="c-h3--gray">직원현황</span>
							</h3>
							<div class="c-heading__add">
								<div class="c-buttons">
									<button onclick="location.href='organization.do'"
										class="c-button c-button--blue">전체 조직도</button>
								</div>
							</div>
						</div>
						<div class="c-tables">
							<table class="c-table">
								<caption><span class="is-hidden">국제터미널 관리 사업소 직원현황: 직급, 성명, 담당업무, 전화번호</span></caption>
								<colgroup>
									<col style="width: 25%" />
									<col style="width: 25%" />
									<col style="width: 25%" />
									<col style="width: 25%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">성명</th>
										<th scope="col">부서</th>
										<th scope="col">담당업무</th>
										<th scope="col">전화번호</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="bpfc_list" items="${bpfc_list}" varStatus="status">
									<tr>
										<td>${bpfc_list.bpfc_name }</td>
										<td>${bpfc_list.bpfc_department }</td>
										<td>
										<c:set var="ch" value="${bpfc_list.bpfc_task }" />
											<c:if test="${ch eq 'null' }">
											
											</c:if> <c:if test="${ch ne 'null' }">
											${bpfc_list.bpfc_task }
											</c:if></td>
										<td class="c-table__gray"><a class="phone_css" href="tel:${bpfc_list.bpfc_phone }" style="cursor:default;">${bpfc_list.bpfc_phone }</a></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
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
