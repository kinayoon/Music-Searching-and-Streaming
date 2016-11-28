<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ${id} - 마이뮤직</title>
</head>
<div class="container">
<p class="artistName"><span>${id}</span> 님께서 '좋아요'를 누른 곡입니다.</p>

<div id="result">
	<p class="songName">곡 <span> (${favoriteSongNum}) </span></p>
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
				<c:forEach items="${favoriteSongList}" var="songVO">
					<tr>
						<td><div class="checkSong"><input type="checkbox" name="addsong" value="${songVO.rownum}"/></div></td>
						<td><div class="num">${songVO.rownum}</div></td>
						<td><div class="title">${songVO.title}</div></td>
						<td><div class="artist">${songVO.artist}</div></td>
						<td><div class="album">${songVO.album}</div></td>
						<td><div class="likeit"><a href="javascript:likeit(${songVO.rownum});">좋아요</a></div></td>
						<td>
						<div class="play">
						<a href="javascript:playnow(${songVO.rownum});">듣기</a>
						
							<form name ="paramValue">				
							<input type="hidden" name="title" value="${songVO.title}" />
							<input type="hidden" name="artist" value="${songVO.artist}" />
							<input type="hidden" name="album" value="${songVO.album}" />
							<input type="hidden" name="duration" value="${songVO.duration}" />
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
	</div><!-- .songBox END -->		
</div><!-- .result END -->
</div>

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