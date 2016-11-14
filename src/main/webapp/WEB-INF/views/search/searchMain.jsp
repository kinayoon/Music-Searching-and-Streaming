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
	<h3>Music Box</h3>
	<form id="afterSearch" role="form" method="get" action="searchMain">
	<input type="text" value="${searchText}" name="query" />
	<input type="submit" value="검색" />
	</form>
	</div>
</div><!-- .header-area END -->

<div class="container">
	<!-- <span class="resultText">검색결과</span> -->
	<p class="resultInfo"><span>'${searchText}'</span>에 대한 검색결과입니다.</p>
	
<!-- <nav class="resultSearch">
		<span>통합검색</span>	<span>아티스트</span>	<span>곡</span>	<span>앨범</span>
	</nav> -->
	
	<div id="result">
	<p class="artistName">아티스트<span> (${artistNum}) </span></p>
	<div id="section" class="aritstBox">
		<c:forEach items="${artistList}" var="artistVO">
			<div class="box">${artistVO.artist}</div>
		</c:forEach>
		<div class="clearBoth"></div>
	</div>
	</div>

	<div id="result">
	<p class="songName">곡 <span> (${songNum}) </span></p>
	<div id="section" class="songBox">
		<table>
			<thead>
				<tr>
					<th class="col-1"><div class="checkList"><input type="checkbox" id="totalListCheck"></div></th>
					<th class="col-2"><div class="no">NO</div></th>
					<th class="col-3"><div class="title">곡명</div></th>
					<th class="col-4"><div class="artist">아티스트</div></th>
					<th class="col-5"><div class="album">앨범</div></th>
					<th class="col-6"><div class="likeit">좋아요<span> 582</span></div></th>
					<th class="col-7"><div class="playnow">듣기</div></th>
					<th class="col-8"><div class="addlist">담기</div></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${songList}" var="songVO">
					<tr>
						<td><div class="checkSong"><input type="checkbox"/></div></td>
						<td><div class="num">${songVO.rownum}</div></td>
						<td><div class="title">${songVO.title}</div></td>
						<td><div class="artist">${songVO.artist}</div></td>
						<td><div class="album">${songVO.album}</div></td>
						<td><div class="likeit"><a href="#">좋아요</a></div></td>
						<td>
						<div class="play"><a href="#">듣기</a></div>
						</td>
						<td><div class="add"><a href="#">담기</a></div></td>
					</tr>
				</c:forEach>
			</tbody>
			<tr><a href="#">전체듣기</a> | <a href="#">듣기</a></tr>
		</table>
	</div>
	</div>
		
	<div id="result">
		<p>앨범 (30건)</p>
	</div>

</div>

<script>
var resultNumber = ${artistNum};
console.log("결과값 :" +resultNumber);

if (resultNumber == 0){
	$('.artistBox').after("<p class='resultNull'>검색한 결과가 없습니다.</p>");
}

$(document).ready(function(){
	
});
</script>

</body>
</html>