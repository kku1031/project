<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ include file="../layout/header.jspf" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 화면 샘플 - Bootstrap</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
</head>

<body>
<form:form action="${contextPath}/member/join" method="POST">
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="userName">아이디</label>
              <input type="text" class="form-control" id="userName" placeholder="아이디를 입력해주세요" value="" required>
            </div>
            <div class="col-md-6 mb-3">
              <label for="password">비밀번호</label>
              <input type="text" class="form-control" id="password" placeholder="비밀번호를 입력해주세요" value="" required>
            </div>
            <div class="col-md-6 mb-3">
              <label for="confirmPassword">비밀번호 확인</label>
              <input type="text" class="form-control" id="confirmPassword" placeholder="비밀번호를 재입력해주세요" value="" required>
            </div>
          </div>

          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" placeholder="이메일 형식에 맞게 입력해주세요" required>
          </div>

          <div class="mb-3">
            <label for="add">주소</label>
            <input type="text" class="form-control" id="add" placeholder="주소를 입력해주세요." required>
          </div>

          <div class="mb-3">
            <label for="detailAdd">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" id="detailAdd" placeholder="상세주소를 입력해주세요.">
          </div>
                   
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
        </form>
       <button id="btn-save" class="btn btn-primary btn-lg btn-block">회원 가입 완료</button>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2022 3K</p>
    </footer>
  </div>
</form:form> 
</body>

<script src="${contextPath}/js/member.js">


</script>

</html>
<%@ include file="../layout/footer.jspf" %>