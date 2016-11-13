<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
	<div class="login-layer-popup">
	<div class="flogin-title">genie 로그인</div>
	
		<!-- Login Form -->
		<form id="login" role="login" method="post">
			<label>아이디 </label><input type="text" name="id" maxlength="12" placeholder="아이디" /> 
			<label>비밀번호 </label><input type="password" name="password" maxlength="20" placeholder="비밀번호" /> 	
			<input type="submit" value="로그인" />
		</form>
	</div>
	
	
 <script>  
  document.title = '회원가입 -메인';
  
  //로그인 성공시 
  var LoginResult= '${msg}';
  
  if(LoginResult == "Login"){
	alert("로그인 되었습니다.");
	location.href="/";
  }
  </script>
</body>
</html>