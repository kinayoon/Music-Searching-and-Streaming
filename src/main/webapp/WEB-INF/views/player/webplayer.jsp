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

//global variables
var currentfileValue="";
var audio = $("#myAudio");
var	playBtn = $("#playBtn");
var	audioURL = $("#currentfile");

$(document).ready(function(){
	//parsing data from parent (searchMain.jsp)
	opener.sendChildObj(document.all.songData);
	
	function dynamicList(){
		arr = $('#songData').text().split(':');
		
		var url = arr[6]+":"+arr[7];
		var date = new Date(parseInt(arr[4]));
		var mm = date.getMinutes();
		var ss = date.getSeconds();
		
		//add list
		var list = $('.songlist').find('tbody');
		var listNo = "<tr><td class='no'>" + arr[0] + "</td>";
		var listTitle = "<td class='title'>" + arr[1] + "</td>";
		var listArtist = "<td class='artist'>" + arr[2] + "</td>";
		var listAlbum = "<td class='album'>" + arr[3] + "</td>";
		var listDuration = "<td class='duration'>" + mm + ":" + ss + "</td></tr>"; 
		list.append(listNo).append(listTitle).append(listArtist).append(listAlbum).append(listDuration);
	
		setTitlePlayer(arr[1]);
		setCurrentfile(url);
	}
	
	//show song's title
	function setTitlePlayer(title){
		$(".playnow-title").text(title);
	}
	
	function setCurrentfile(url){
		var path = url.replace(/\\/g,"//");
		audioURL.value = "file:///"+path;
		console.log(audioURL.value);
	}
	
	//Run
	dynamicList();	
});

</script>
</head>
<body>
	<p id="songData"></p> 
	
	<div class="play-area">
		<div class="playnow-title"></div>
		<p>
			<input type="file" id="currentfile" value="" />
		</p>
		<audio id="myAudio">HTML5 audio not supported</audio>
		<button id="playBtn" onclick="playAudio();">play</button>
		
	</div><!-- .play-area END -->
	
	<div class="play-list">
		<table class="songlist">
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
	</div> <!-- .play-list END -->
</body>
<script>


//all about audio
function playAudio(){
  
	  try{
		  	audio.src = audioURL.value;
		  	console.log(audio.src);
	  	 	if(audio.paused){
		  		audio.play();
	  	 	}
		/* if(audioURL.value !== currentfileValue){  //목록에 추가된 url과 원래 있던 url이 다르면, 다른 곡이 들어왔으므로 재생목록에 추가시키기.
			audio.src = audioURL.value;
			currentfileValue = audioURL.value;
		}  
		
		if(audio.paused){
			audio.play();
		}else {
			audio.paused();
		} */
	  
	  }catch(err){
		console.log("Error : "+ err);  
	  }
   //}//.if END
  
}//.playAudio END
</script>
</html>