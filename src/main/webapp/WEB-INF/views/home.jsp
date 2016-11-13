<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<script>
var searchT;
$(document).ready(function(){
	$('#searchText').keyup(function(){
		searchT = $('#searchText').val();
	});
});
</script>
<body>
<div id="header-area">
<div class="container">
  <nav class="loginInfo">
  	  <div><a id="mainSign" href="/member/signUp">회원가입</a></div>
	  <div><a id="mainLogin" href="/member/fLogin">로그인</a></div>
	  <div><a id="mainMusic" href="/member/myMusic">마이뮤직</a></div>
	  <form role="form" method="post"><input type="hidden" name="logout" /></form>
  </nav>
  </div>
</div> 

<div class="container">
  <div id="search-area">
  <!-- 검색창 -->
  <div class="searchTitle">find out your favorite music</div>
	  <form id="searchBox" role="form" method="get" action="/search/searchMain">
	  	<input type="text" name="query" placeholder="search" id="searchText" />
	  	<input type="submit" value="검색" id="searchEnter"/>  
	  </form>
  </div><!-- .search-area END -->
</div><!-- .main-area END -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script> 
<script>
$('#searchEnter').click(function(){
	if(searchT == null){
		alert("검색어를 입력해주세요.");
		$('#searchBox').attr('action','');
		window.location.href = window.location.href.split("?")[0];
	}
});
</script>
</body>
</html>