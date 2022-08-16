<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title> 로그인 </title>
<!-- 스타일 cs 적용 -->
<link href="${contextPath}/resources/css/login.css" rel="stylesheet" />
</head>
<body>
<h2> 로그인 페이지에 오신 것을 환영합니다.</h2>
<div class="container" id="container">  
  <!-- 로그인 -->
  <div class="form-container sign-in-container">
    <form action="${contextPath}/member/login" method="POST">
      <h1> 로그인 </h1>
      <br>      
      <input type="text" name="username" placeholder="아이디" required="required" />
      <input type="password" name="password" placeholder="비밀번호" required="required" />
      <a href="${contextPath}/member/join">계정이 없으십니까?</a>
      <button>로그인 </button>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">      
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
       <div class="overlay-panel overlay-right">
        <h1>🎸HG Guitar 🎸</h1>
        <p>저희와 함께 기타 연주의 세계로 떠나요~♫</p>       
      </div>
    </div>
  </div>
</div>
</body>  
