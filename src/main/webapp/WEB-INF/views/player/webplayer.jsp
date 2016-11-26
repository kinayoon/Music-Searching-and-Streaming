<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"  type="text/javascript"></script>
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/webPlayer.css"/>" rel="stylesheet">
<title>Music Player</title>
</head>
<body>
	<div class="play-area">
		<div class="playnow-title"></div>
		<audio id="myAudio" controls="controls" preload="auto" autoplay></audio>
		<button id="playBtn" onclick="javascript:playSong();">play</button>
		<button id="stopBtn" onclick="javascript:stopSong();">stop</button>
		<button id="prevBtn" onclick="javascript:prevSong();">prev</button>
		<button id="nextBtn" onclick="javascript:nextSong();">next</button>
		<button id="delAllBtn" onclick="javascript:deleteAllBtn();">delete all</button>
		
	</div><!-- .play-area END -->
	
	<div class="play-list">
		<table class="songlist">
			<thead>
				<tr>
					<th class="th_no">No.</th>
					<th class="th_song">곡명</th>
					<th class="th_song">아티스트</th>
					<th class="th_song">앨범</th>
					<th class="th_duration">시간</th>
					<!-- <th class="th_del"><button id="del">Χ</button></th> -->
				</tr>
			</thead>
			<tbody>
				<!-- Dynamic List -->
			</tbody>
		</table>
	</div> <!-- .play-list END -->
</body>
<script src="<c:url value="/resources/js/mp3playerControl.js"/>" type="text/javascript"></script>
</html>