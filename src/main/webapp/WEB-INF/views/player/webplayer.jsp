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
$(document).ready(function(){
	
	//parsing data from parent window(searchMain.jsp)
	opener.sendChildObj(document.all.songData);
	opener.toPopup = this;
	
	function call(arr,url){
		console.log(arr);
		console.log(url);
	}
	
	function dynamicList(){
		arr = $('#songData').text().split(':');
		
		var date = new Date(parseInt(arr[4]));
		var mm = date.getMinutes();
		var ss = date.getSeconds();
		
		//add songTitle
		//show song's title --> 곡이 다음곡으로 넘어가면서 title도 다음곡으로 넘어가줘야함.
		var headerTitle = $(".playnow-title");
		headerTitle.text(arr[1]);
		
		//add songList
		var list = $('.songlist').find('tbody');
		var listNo = "<tr><td class='no'>" + arr[0] + "</td>";
		var listTitle = "<td class='title'>" + arr[1] + "</td>";
		var listArtist = "<td class='artist'>" + arr[2] + "</td>";
		var listAlbum = "<td class='album'>" + arr[3] + "</td>";
		var listDuration = "<td class='duration'>" + mm + ":" + ss + "</td></tr>"; 
		list.append(listNo).append(listTitle).append(listArtist).append(listAlbum).append(listDuration);
	}	
	dynamicList();
});

</script>
</head>
<body>
	<p id="songData"></p> 
	<p id="getAudioSrc"></p>
		
	<div class="play-area">
		<div class="playnow-title"></div>
		<audio id="myAudio" src="<c:url value='${audiosrc}'/>" controls="controls" autoplay></audio>
		<input type="checkbox" name="loopcheck">반복재생</input>
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
					<th class="th_playsong">듣기</th>
				</tr>
			</thead>
			<tbody>
				<!-- 동적으로 재생리스트 올라가는 영역 -->
			</tbody>
		</table>
	</div> <!-- .play-list END -->
</body>
<script>
function playAudio(){
	var audio = $("#myAudio");
	var beforefileValue = new Array();
		
	//	audio.val();  //기존에 들어왔던 src값 
	var afterfileValue= "";  //나중에 추가된 src값 
	var currentfileValue="";
	
	$("input[name='loopcheck']").click(function(){
		if( $(this).is(':checked')){
			audio.loop = true;
		}
	});
} playAudio();
</script>
</html>