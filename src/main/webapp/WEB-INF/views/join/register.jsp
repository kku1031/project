<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>   
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
<h2> 회원가입 페이지에 오신 것을 환영합니다. </h2>
<div class="container" id="container">   
  <div class="form-container sign-in-container">
    <form:form action="${contextPath}/join/register" method="POST" modelAttribute="memberVO">      
      <form:input type="text" path="userId" placeholder="사용자아이디"/>
      <form:errors path="userId"/>      
                      
      <form:input type="password" path="userPw" placeholder="비밀번호"/>
      <form:errors path="userPw"/>
      
      <form:input type="password" path="confirmPw" placeholder="비밀번호 재확인"/>
      <form:errors path="confirmPw"/>        
             
      <form:input type="text" path="userName" placeholder="이름"/>
      <form:errors path="userName"/>   
      
      <form:input type="email" path="email" placeholder="이메일"/>
      <form:errors path="email"/>   
        
      <a href="${contextPath}/member/login">로그인 하기</a>
      <button type="submit" class="btn btn-default">회원가입 </button>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form:form>
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