/**
 *	mp3playerControl (webplayer.jsp) 
 *
 * */

var headerTitle = $(".playnow-title");
var audio = $("#myAudio");
doc = document;  //window
srcData = new Array();   //audioURL Array
titleData = new Array(); //song title

$(document).ready(function(){
	
	//parsing data from parent window(searchMain.jsp)
	allData = window.opener.totalforPrint;  

	//play music 
	if( typeof allData != "undefined" || allData != null){
		parsingSongData(allData);
	}	

	//Trigger passing next song when ended playing song
	audio.on('ended', function(){
		$("#nextBtn").trigger('click');	
	});	
});


function parsingSongData(data){ // Array > Array > Object (3dept)
	var indexing = 0;
	
	for(var j=0; j<data.length; j++){  //Array
		var objArr = data[j]; //Array
	
		for(var i=0; i<objArr.length; i++){ //Object
			
			var no = indexing+1;
			var title = objArr[i].title;
			var artist = objArr[i].artist;
			var album = objArr[i].album;
			var date = new Date(parseInt(objArr[i].duration));
			var mm = date.getMinutes();
			var ss = date.getSeconds();			
			var audiosrc = objArr[i].audioSrc;
			dynamicList(no, title, artist, album, mm, ss, audiosrc);

			srcData.push(audiosrc);
			titleData.push(title);
			
			indexing++;
		}		
	}
	index = 0;
	playSong(index);
}	

function dynamicList(num, title, artist, album, mm, ss, audiosrc){
	var list = $('.songlist tbody');
	var line = "<tr>";
	var listNo = "<td class='no'>" + num + "</td>";
	var listTitle = "<td class='title'><a href='javascript:playnow(" + num + ");'>" + title + "</a></td>";
	var listArtist = "<td class='artist'>" + artist + "</td>";
	var listAlbum = "<td class='album'>" + album + "</td>";
	var listDuration = "<td class='duration'>" + mm + ":" + ss + "</td></tr>";
	list.append(line).append(listNo).append(listTitle).append(listArtist).append(listAlbum).append(listDuration);	
}

//Auto play when popup player window
function playSong(index){
	audio.attr('src', srcData[index]);		
	changeTitle(titleData[index]);
}

//Play when clicked song title
function playnow(no){
	index = no-1;
	audio.attr('src',srcData[index]);
	changeTitle(titleData[index]);
}

//Change Title
function changeTitle(title){
	headerTitle.html(title);
	doc.title =  "Music Player -" + title;
}

//Click stopBtn
function stopSong(){
	index = 0;
	audio.attr('src',"");
	audio.load();
}

function deleteAllBtn(jQuery){
	if( $("#checkSong").prop("checked")){ //When checked all list 
		deleteAllSong();
	}else {  //if do not check list, checking list
		$("input[name='checkOne']").prop("checked", true);
		$("#checkSong").prop("checked", true);
		deleteAllSong();
	}	
}

function deleteAllSong(){
	var list = $('.songlist tbody').remove();
	audio.attr('src',"");	
	opener.totalforPrint = "";
	opener.totalforPrint = new Array();
}

//Click nextBtn
function nextSong(){
	if(index == srcData.length-1){
		index = 0;
		audio.attr('src', srcData[index]);
		changeTitle(titleData[index]);
	}else{
		index++;
		audio.attr('src', srcData[index]);
		changeTitle(titleData[index]);
	}
}

//Click prevBtn
function prevSong(){
	if(index == 0){
		index = srcData.length-1;
		audio.attr('src', srcData[index]);
		changeTitle(titleData[index]);
	}else{
		index--;
		audio.attr('src', srcData[index]);
		changeTitle(titleData[index]);
	}
}
