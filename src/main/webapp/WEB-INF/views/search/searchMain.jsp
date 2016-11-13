<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
document.title="${searchText}"+"- 통합검색";
$(document).ready(function(){

});
</script>
<body>
<div id="header-area">
	<div class="container">
	<h3>검색결과</h3>
	<form id="afterSearch" role="form" method="get" action="searchMain">
	<input type="text" value="${searchText}" name="query" />
	<input type="submit" value="검색" />
	</form>
	</div>
</div><!-- .header-area END -->

<div class="container">
	<nav class="resultSearch">
		<span>통합검색</span>	<span>아티스트</span>	<span>곡</span>	<span>앨범</span>
	</nav>
	
	<div class="resultArtist">
	<p>아티스트(<span>${artistNum}</span>건)</p>
	<c:forEach items="${artistList}" var="artistVO">
		<p>${artistVO.artist}</p>
	</c:forEach>
	</div>
	
	<div class="resultSong">
		<p>곡 (30건)</p>
	</div>
	
	<div class="resultAlbum">
		<p>앨범 (30건)</p>
	</div>

</div>

<script>
$(document).ready(function(){
	
});
</script>

</body>
</html>