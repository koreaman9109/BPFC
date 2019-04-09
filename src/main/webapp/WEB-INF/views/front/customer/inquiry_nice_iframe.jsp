<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../home_include.jsp"%>
<script src="js/recruit/front_recruit.js"></script>
<script type="text/javascript">
function init() {
	self.close();
}
</script>
<style>
	#iframe_nice{
	margin: 0 auto;
	}
</style>
<title>본인인증</title>
</head>
<body>
<iframe id="iframe_nice" src="inquiry_popgo.do" style="display:block; width:100%; height: 670px;" title="휴대폰 본인인증 새창"></iframe>
</body>
</html>