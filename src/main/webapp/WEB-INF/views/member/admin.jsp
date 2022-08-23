<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>(주) HG 기타</title>

<!-- Favicon 아이콘-->
<link rel="icon" type="image/x-icon"
	href="${contextPath}/resources/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- 폰트 설정 -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 스타일 cs 적용 -->
<link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
<!-- 시큐리티 접목 후 토큰 추가 -->
<script>
	let contextPath = "${contextPath}"
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenName = "${_csrf.token}";
</script>
<body>
	<div class="container px-4 px-lg-5">
		<div class="container">
			<h2>관리자 페이지</h2>
			<div>				
				<sec:authentication property="principal.memberVO" var="member" />
				<br> 아이디 :
				<sec:authentication property="principal.memberVO.userId" />
				<br> 이름 :
				<sec:authentication property="principal.memberVO.userName" />
				<br> 권한 :
				<sec:authentication property="principal.memberVO.authList" />
				<br>
			</div>
		</div>
		<div style="margin-bottom: 10px;">
				<a class="btn btn-success btn-xl" href="${contextPath}/join/list">회원관리</a> 
				<a class="btn btn-warning btn-xl" href="${contextPath}/join/update">회원수정</a>
		</div>				
	</div>
</body>
<%@include file="../layout/footer.jspf"%>