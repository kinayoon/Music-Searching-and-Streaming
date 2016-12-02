<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Music Streaming Site</title>
    <!-- 부트스트랩 -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"  type="text/javascript"></script>
    <script src="<c:url value="/resources/js/sendData.js"/>" type="text/javascript"></script>
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div id="header-area">
<div class="container">
	<h3><a href="<c:url value='/'/>">Music Box</a></h3>
	<nav class="loginInfo">
		<a id="mainSign" href="/member/signUp">회원가입</a>
		<a id="mainLogin" href="/member/fLogin">로그인</a>
		<a id="mainMusic" href="/member/myMusic">마이뮤직</a>
		<form role="form" method="post"><input type="hidden" name="logout" /></form>
	</nav>
	<div class="clearBoth"></div>	
</div><!-- .container -->
</div><!-- .header-area END -->
