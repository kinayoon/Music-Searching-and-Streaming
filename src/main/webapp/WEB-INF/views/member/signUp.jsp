<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<script>
	document.title = '회원가입 -메인';
	var msg = '${msg}';
	if(msg == 'SUCCESS'){
		alert("회원가입 되었습니다.");
	}
</script>
<body>
	<nav class="navbar navbar-static-top">
		<div class="container">
			<div class="left-container">
				<p class="signup-title">회원가입 </p>
			</div>
			<div class="right-container">
				<a href="/member/signUp">회원가입  |  </a>
				<a href="#">아이디 찾기  |  </a>
				<a href="#">비밀번호 찾기    </a>
			</div>
		</div>
		<div class="clearBoth"></div>
	</nav>
	
	<div class="container">
	<div class="row">
	<form role="form" method="post" id="signUp">
		<p><label>아이디  </label><input type="text" name="id" /></p>
		<p><label>비밀번호 </label><input type="password" name="password" /></p>
		<p><label>이 름  </label><input type="text" name="name" /></p>
		<p><label>이메일  </label><input type="email" name="email" placeholder="test@test.com" /></p>
		<p><label>휴대폰  </label><input type="text" name="phone" placeholder="010-2222-1111" /></p>
		<p><label>주 소  </label><input type="text" name="address" /></p>
		
		<p><label>이메일 수신여부  </label>
		<input type="radio" name="infoEmail" value="1" checked>수신함</input>
		<input type="radio" name="infoEmail" value="0">수신안함</input></p>
		
		<p><label>문자메시지 수신여부  </label>
		<input type="radio" name="infoSMS" value="1" checked>수신함</input>
		<input type="radio" name="infoSMS" value="0">수신안함</input></p>
		
		<p><input type="submit" value="가입" /></p>
	</form>
	</div>
	</div><!-- .container -->
</body>
</html>