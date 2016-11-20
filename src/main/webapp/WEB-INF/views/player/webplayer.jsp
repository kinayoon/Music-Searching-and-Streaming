<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/webPlayer.css"/>" rel="stylesheet">
<title>Music Player</title>
<script>
<!-- create dynamic table -->

var url;

$(document).ready(function(){   
	opener.sendChildObj(document.all.temp);

	var arr = $('#temp').text().split(':');
	
	url = arr[5]+":"+arr[6];
	console.log(url);
	var date = new Date(parseInt(arr[4]));
	var mm = date.getMinutes();
	var ss = date.getSeconds();
	
	var list = $('.playList').find('tbody');
	var listNo = "<tr><td class='no'>" + arr[0] + "</td>";
	var listTitle = "<td class='title'>" + arr[1] + "</td>";
	var listArtist = "<td class='artist'>" + arr[2] + "</td>";
	var listAlbum = "<td class='album'>" + arr[3] + "</td>";
	var listDuration = "<td class='duration'>" + mm + ":" + ss + "</td></tr>"; 
	
	list.append(listNo).append(listTitle).append(listArtist).append(listAlbum).append(listDuration); 
	
	$("#play").click(function(){
		var play = $("#play").find(audio);
		play.attr("autoplay","auto");	
	});
	
});

</script>
</head>
<body>
	<p id="temp"></p>
	<div class="title"><h3>${filepath}</h3></div>
	<button id="play"><audio src="" controls="controls">재생</audio></button>
	<table class="playList">
		<thead>
			<tr>
				<th class="no">No.</th>
				<th class="song_t">곡명</th>
				<th class="song_a">아티스트</th>
				<th class="song_al">앨범</th>
				<th class="duration">시간</th>
			</tr>
		</thead>
		<tbody>
			<!-- 동적으로 재생리스트 올라가는 영역 -->
		</tbody>
	</table>
</body>
</html>