<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
document.title="${searchTxt}"+"- 아티스트검색";
</script>
<div class="container">
	
	<div class="main-search">
	<form id="afterSearch" role="form" method="get" action="searchArtists">
		<input type="text" value="${searchTxt}" name="keyword" required/>
		<input type="submit" value="검색" />
	</form>
	</div>
	
	<p class="resultInfo"><span>'${searchTxt}'</span>에 대한 검색결과입니다.</p>
	
	<div id="result">
	<p class="artistName">아티스트<span> (${artistNum}) </span></p>
	<div id="section" class="aritstBox">
	
		<c:forEach items="${artistList}" var="artistVO">
		<a href="/detail/artist?artist=${artistVO.artist}">
			<div class="box">
				<div class="box-title">
					${artistVO.artist}
				</div>
			</div>
		</a>
		</c:forEach>
		
		<div class="clearBoth"></div>
	</div> <!-- .artistBox END -->
	</div><!-- .result END -->
</div><!-- .container END -->
<script>
var resultNumber = "${artistNum}";

if (resultNumber == 0){
	$('.artistBox').after("<p class='resultNull'>검색한 결과가 없습니다.</p>");
}
</script>
</body>
</html>