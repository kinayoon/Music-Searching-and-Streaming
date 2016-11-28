<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="container">
  <div id="search-area">
  <!-- 검색창 -->
  <div class="searchTitle">find out your favorite music</div>
	  <form id="searchBox" role="form" method="get" action="/search/searchMain">
	  	<input type="text" name="keyword" placeholder="search" id="searchText" />
	  	<input type="submit" value="검색" id="searchEnter"/>  
	  </form>
  </div><!-- .search-area END -->
</div><!-- .main-area END -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script> 

<script>
var searchT;
var resultMyMusic = '${plzLogin}';
if(resultMyMusic == "myMusicFail"){
	alert("로그인 후, 사용해주세요.");
}

$(document).ready(function(){
	$('#searchText').keyup(function(){
		searchT = $('#searchText').val();
	});
}); 
 
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