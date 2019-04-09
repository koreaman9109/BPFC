<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% request.setCharacterEncoding("euc-kr");%>
<%-- <% session.setAttribute("admin_name", "관리자");%> --%> 
<div class="skip_navigation">
			<ul>
				<li><a href="#content">본문 바로가기</a></li>
				<li><a href="#gnb">주메뉴 바로가기</a></li>
			</ul>
		</div>
		<div class="c-banner c-banner--active">
			<div class="c-banner__aligner">
				<div class="c-banner__box">
					<a href="#" class="c-banner__close">배너닫기버튼</a>
					<ul class="c-banner__list">
						<li class="c-banner__item_no">
							<a href="${banner_only.banner_url }" target="_blank" class="c-banner__link">
								<img src="${banner_only.banner_path }${banner_only.banner_filename}" alt="${banner_only.banner_ex }" class="c-banner__images" height="120" width="720" />
							</a>
						</li>
						<c:forEach var="banner_list" items="${banner_list }" varStatus="status">
						<li class="c-banner__item">
							<a href="${banner_list.banner_url }" target="_blank" class="c-banner__link">
								<img src="${banner_list.banner_path }${banner_list.banner_filename}" alt="${banner_list.banner_ex }" class="c-banner__images" height="120" width="720" />
							</a>
						</li>
						</c:forEach>
					</ul>
					<input type="hidden" value="${fn:length(banner_list) }" id="banner_list_hidden" />
				</div>
				<a href="#" class="c-banner__trigger">배너 여닫기 버튼</a>
			</div>
		</div>