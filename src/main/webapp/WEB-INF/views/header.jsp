<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Genie WebProject</title>
    <!-- 부트스트랩 -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script>
				
		<!-- fLogin.jsp에서 로그인하면 메인으로 리다이렉트. -->
 		var sessionId = '<%= session.getAttribute("id") %>';
 		
 		$(document).ready(function(){
 			var loginBtn = $('#mainLogin');
 			var userId = $('#mainSign');
 			
 			if(sessionId != 'null'){  //세션에 아이디 값이 있으면, 로그인 사라지게 하고, 로그아웃으로 출력해주기
 				userId.text(sessionId+"님");
 				userId.attr("href","javascript:void(0)");
 				loginBtn.after("<a href='/member/logout' id='mainLogout'>로그아웃</a>");
  				loginBtn.html(" ");
 		
  				$('#mainLogout').click(function(event){		
  	 				logoutBtn.hide();
  	 			});
 			}
 		});
	</script>
</head>