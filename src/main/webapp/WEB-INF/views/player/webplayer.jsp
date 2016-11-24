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
</head>
<body>
	<p id="getAudioSrc"></p>	
		
	<div class="play-area">
		<div class="playnow-title"></div>
		<audio id="myAudio" controls="controls" preload="auto" autoplay></audio>
		<button id="playBtn" onclick="javascript:playSong();">play</button>
		<button id="stopBtn" onclick="javascript:stopSong();">stop</button>
		<button id="prevBtn" onclick="javascript:prevSong();">prev</button>
		<button id="nextBtn" onclick="javascript:nextSong();">next</button>
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
				</tr>
			</thead>
			<tbody>
				<!-- Dynamic List -->
			</tbody>
		</table>
	</div> <!-- .play-list END -->
</body>

<script>
var headerTitle = $(".playnow-title");
var audio = $("#myAudio");

$(document).ready(function(){
	//parsing data from parent window(searchMain.jsp)
	alldata = window.opener.dataforPrint;
	parsingSongData(alldata);
	
	audio.on('ended', function(){
		$("#nextBtn").trigger('click');	
	});	
});

function parsingSongData(alldata){
	
	srcData = new Array();  
	titleData = new Array();
	
	for(var i=0; i<alldata.length; i++){
		var no = i+1;
		var title = alldata[i].title;
		var artist = alldata[i].artist;
		var album = alldata[i].album;
		var date = new Date(parseInt(alldata[i].duration));
		var mm = date.getMinutes();
		var ss = date.getSeconds();			
		var audiosrc = alldata[i].audioSrc;
		
		dynamicList(no, title, artist, album, mm, ss, audiosrc);
		srcData.push(audiosrc);
		titleData.push(title);
	}
	index = 0;
	playSong();
}	

function dynamicList(num, title, artist, album, mm, ss, audiosrc){
	var list = $('.songlist tbody');
	var listNo = "<tr><td class='no'>" + num + "</td>";
	var listTitle = "<td class='title'><a href='javascript:playnow(" + num + ");'>" + title + "</a></td>";
	var listArtist = "<td class='artist'>" + artist + "</td>";
	var listAlbum = "<td class='album'>" + album + "</td>";
	var listDuration = "<td class='duration'>" + mm + ":" + ss + "</td></tr>";
	list.append(listNo).append(listTitle).append(listArtist).append(listAlbum).append(listDuration);	
}

function playSong(){
	index = 0;
	audio.attr('src', srcData[index]);		
	headerTitle.html(titleData[index]);
}

function stopSong(){
	index = 0;
	audio.attr('src',"");
	audio.load();
}

function playnow(no){
	index = no-1;
	audio.attr('src',srcData[index]);
	headerTitle.html(titleData[index]);
}

function nextSong(){
	if(index == srcData.length-1){
		index = 0;
		audio.attr('src', srcData[index]);
		headerTitle.html(titleData[index]);
	}else{
		index++;
		audio.attr('src', srcData[index]);
		headerTitle.html(titleData[index]);
	}
}

function prevSong(){
	if(index == 0){
		index = srcData.length-1;
		audio.attr('src', srcData[index]);
		headerTitle.html(titleData[index]);
	}else{
		index--;
		audio.attr('src', srcData[index]);
		headerTitle.html(titleData[index]);
	}
}

</script>
</html>