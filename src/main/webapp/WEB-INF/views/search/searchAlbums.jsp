<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
document.title="${searchTxt}"+"- 앨범검색";
</script>
<body>
<div id="header-area">
	<div class="container">
	<h3><a href="<c:url value='/'/>">Music Box</a></h3>
	<form id="afterSearch" role="form" method="get" action="searchMain">
		<input type="text" value="${searchTxt}" name="query" required/>
		<input type="submit" value="검색" />
	</form>
	</div>
</div><!-- .header-area END -->

<div class="container">
	<p class="resultInfo"><span>'${searchTxt}'</span>에 대한 검색결과입니다.</p>
	
	<div id="result">
		<p class="albumName">앨범<span> (${albumNum}) </span></p>
		<div id="section" class="albumBox">
			<c:forEach items="${albumList}" var="albumVO"> 
			<div class="box">
			<a href="/detail/album?id=${albumVO.albumid}">
				<div class="inner-box">
					<div class="album">${albumVO.album}</div>
					<div class="artist">아티스트 : ${albumVO.artist}</div>
					<div class="genre">장르 : ${albumVO.genre}</div>
					<div class="release_date">발매일 : ${albumVO.releaseDate}</div>
				</div>
			</a>	
			</div>
			</c:forEach>
			
		</div><!-- .albumBox END -->	
	</div><!-- .result END -->
</div><!-- .container END -->

<script>
var resultNumber = ${albumNum};
console.log("결과값 :" +resultNumber);

if (resultNumber == 0){
	$('.albumBox').after("<p class='resultNull'>검색한 결과가 없습니다.</p>");
}

$(document).ready(function(){
	
});
</script>

</body>
</html>