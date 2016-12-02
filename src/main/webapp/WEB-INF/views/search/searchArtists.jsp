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
	<p class="artistName">아티스트<span> (${pagination.count}) </span></p>
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

<!-- pagination -->
<div class="text-center">
	<ul class="pagination">	
			
	<c:if test="${pagination.prev}">
		<li><a href="/search/searchArtists${pagination.makeSearch(pagination.startPage -1)}">&laquo;</a></li>
	</c:if>
	
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
	<li 
		<c:out value="${pagination.cri.page == idx?'class=active':''}"/>>
			<a href="/search/searchArtists${pagination.makeSearch(idx)}">${idx}</a>
	</li> 
	</c:forEach>
			
	<c:if test="${pagination.next}">
		<li><a href="/search/searchArtists${pagination.makeSearch(pagination.endPage +1)}">&raquo;</a></li>
	</c:if>
	
	</ul>
</div><!-- .pagination -->
</div><!-- .container -->

<script>
var resultNumber = "${pagination.count}";

if (resultNumber == 0){
	$('.artistBox').after("<p class='resultNull'>검색한 결과가 없습니다.</p>");
}
</script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>