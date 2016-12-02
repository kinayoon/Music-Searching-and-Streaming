<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
document.title="${searchTxt}"+"- 곡 검색";
</script>
<div class="container">
	<div class="main-search">
	<form id="afterSearch" role="form" method="get" action="searchSongs">
		<input type="text" value="${searchTxt}" name="keyword" required/>
		<input type="submit" value="검색" />
	</form>
	</div>
	
	<p class="resultInfo"><span>'${searchTxt}'</span>에 대한 검색결과입니다.</p>
	
	<div id="result">
	<p class="songName">곡 <span> (${pagination.count}) </span></p>
	<div id="section" class="songBox">
		<table>
			<thead>
				<tr>
					<th class="col-1"><div class="checkList"><input type="checkbox" id="totalListCheck"></div></th>
					<th class="col-2"><div class="no">NO</div></th>
					<th class="col-3"><div class="title">곡명</div></th>
					<th class="col-4"><div class="artist">아티스트</div></th>
					<th class="col-5"><div class="album">앨범</div></th>
					<th class="col-6"><div class="likeit">좋아요</div></th>
					<th class="col-7"><div class="playnow">듣기</div></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${songList}" var="songVO" varStatus="status">
				<tr>
					<td><div class="checkSong"><input type="checkbox" name="addsong" value="${startNum}"/></div></td>
					<td><div class="num"><c:out value="${startNum}"/></div></td>
					<td><div class="title">${songVO.title}</div></td>
					<td><div class="artist">${songVO.artist}</div></td>
					<td><div class="album">${songVO.album}</div></td>
					<td><div class="likeit"><a href="javascript:likeit(${status.count});">좋아요</a></div></td>
					<td>
					<div class="play">
						<a href="javascript:playnow(${status.count});">듣기</a>
						
						<form name ="paramValue">				
						<input type="hidden" name="title" value="${songVO.title}"/>
						<input type="hidden" name="artist" value="${songVO.artist}"/>
						<input type="hidden" name="album" value="${songVO.album}" />
						<input type="hidden" name="duration" value="${songVO.duration}"/>
						<input type="hidden" name="filePath" value="${songVO.filePath}" />
						</form>
					</div></td>
				</tr>
					<c:set var="startNum" value="${startNum+1}" />
					</c:forEach>				
			</tbody>
			<tr>
				<span class="playAll"><a href="javascript:playAllNow();">전체듣기</a></span> <span> | </span>
				<span class="playOne"><a href="javascript:playAdd();">담기</a></span>
			</tr>
		</table>		
	</div><!-- .songBox END -->
	</div><!-- .result END -->

<!-- pagination -->
<div class="text-center">
	<ul class="pagination">	
			
	<c:if test="${pagination.prev}">
		<li><a href="/search/searchSongs${pagination.makeSearch(pagination.startPage -1)}">&laquo;</a></li>
	</c:if>
	
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
	<li 
		<c:out value="${pagination.cri.page == idx?'class=active':''}"/>>
			<a href="/search/searchSongs${pagination.makeSearch(idx)}">${idx}</a>
	</li> 
	</c:forEach>
			
	<c:if test="${pagination.next}">
		<li><a href="/search/searchSongs${pagination.makeSearch(pagination.endPage +1)}">&raquo;</a></li>
	</c:if>
	
	</ul>
</div><!-- .pagination -->
</div><!-- .container -->

<script>
var resultNumber = ${pagination.count};
if (resultNumber == 0){
	$('.songBox').after("<p class='resultNull'>검색한 결과가 없습니다.</p>");
}
</script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>