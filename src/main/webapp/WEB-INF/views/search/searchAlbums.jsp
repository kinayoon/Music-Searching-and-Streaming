<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
document.title="${searchTxt}"+"- 앨범검색";
</script>
<div class="container">
	<div class="main-search">
	<form id="afterSearch" role="form" method="get" action="searchAlbums">
		<input type="text" value="${searchTxt}" name="keyword" required/>
		<input type="submit" value="검색" />
	</form>
	</div>
	<p class="resultInfo"><span>'${searchTxt}'</span>에 대한 검색결과입니다.</p>
	
	<div id="result">
		<p class="albumName">앨범<span> (${pagination.count}) </span></p>
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

<!-- pagination -->
<div class="text-center">
	<ul class="pagination">	
			
	<c:if test="${pagination.prev}">
		<li><a href="/search/searchAlbums${pagination.makeSearch(pagination.startPage -1)}">&laquo;</a></li>
	</c:if>
	
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
	<li 
		<c:out value="${pagination.cri.page == idx?'class=active':''}"/>>
			<a href="/search/searchAlbums${pagination.makeSearch(idx)}">${idx}</a>
	</li> 
	</c:forEach>
			
	<c:if test="${pagination.next}">
		<li><a href="/search/searchAlbums${pagination.makeSearch(pagination.endPage +1)}">&raquo;</a></li>
	</c:if>
	
	</ul>
</div><!-- .pagination -->
</div><!-- .container -->

<script>
var resultNumber = ${pagination.count};

if (resultNumber == 0){
	$('.albumBox').after("<p class='resultNull'>검색한 결과가 없습니다.</p>");
}
</script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>