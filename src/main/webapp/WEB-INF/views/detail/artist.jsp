<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
document.title="${artistTxt}"+"- 아티스트 검색";
</script>

<div class="container">
	<div class="main-search">
	<form id="ArtistSearch" role="form" method="get" action="artist">
		<input type="text" value="${artistTxt}" name="artist" required/>
		<input type="submit" value="검색" />
	</form>
	</div>
<p class="resultInfo"><span>'${artistTxt}'</span>에 대한 검색결과입니다.</p>
	
<div id="result">
	<p class="artistName">아티스트<span> ${artistTxt}</span> 의 곡 ${resultArtistSize}</p>
	<div id="section" class="songBox">
		
		<table>
			<thead>
				<tr>
					<th class="col-1"><div class="checkList"><input type="checkbox" id="totalListCheck"></div></th>
					<th class="col-2"><div class="no">NO</div></th>
					<th class="col-3"><div class="album">앨범</div></th>
					<th class="col-4"><div class="title">곡명</div></th>
					<th class="col-5"><div class="tracknum">트랙</div></th>
					<th class="col-6"><div class="artist">아티스트</div></th>
					<th class="col-7"><div class="likeit">좋아요</div></th>
					<th class="col-8"><div class="playnow">듣기</div></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${SongByArtist}" var="songVO" varStatus="status">
					<tr>
						<td><div class="checkSong"><input type="checkbox" name="addsong" value="${status.count}"/></div></td>
						<td><div class="num">${status.count}</div></td>
						<td><div class="album">${songVO.album}</div></td>
						<td><div class="title">${songVO.title}</div></td>
						<td><div class="tracknum">${songVO.trackNum}</div></td>
						<td><div class="artist">${songVO.artist}</div></td>
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
				</c:forEach>
			</tbody>
			<tr>
				<span class="playAll"><a href="javascript:playAllNow();">전체듣기</a></span> <span> | </span>
				<span class="playOne"><a href="javascript:playAdd();">담기</a></span>
			</tr>
		</table>	

	<div class="clearBoth"></div>
	</div> <!-- .artistBox END -->
</div><!-- .result END -->
</div><!-- .container END -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>