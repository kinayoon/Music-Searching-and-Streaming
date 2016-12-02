<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer-area">
<div class="container">
<p class="footer-text">@Copyright created By github.com/kinayoon | kina2018@gmail.com</p>
</div>
</footer>
<script>		
		<!-- fLogin.jsp에서 로그인하면 메인으로 리다이렉트. -->
 		sessionId = '<%= session.getAttribute("id") %>';
 		
 		$(document).ready(function(){
 			var loginBtn = $('#mainLogin');
 			var userId = $('#mainSign');
 			
 			if(sessionId != 'null'){  //세션에 아이디 값이 있으면, 로그인 사라지게 하고, 로그아웃으로 출력해주기
 				userId.text(sessionId+"님 환영합니다");
 				userId.attr("href","javascript:void(0)");
 				loginBtn.after("<a href='/member/logout' id='mainLogout'>로그아웃</a>");
  				loginBtn.html(" ");
 		
  				$('#mainLogout').click(function(event){
  	 				logoutBtn.hide();
  	 				window.location.href = "/member/logout";
  	 			});
 			}
 		});
	</script> 
</body>
</html>