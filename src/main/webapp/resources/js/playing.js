/*!
 *	JS For playing  
 */


//Global Var
var popupPlayer;  //플레이어 팝업
var playform;  //한곡 데이터
var dataforPrint;  //플레이어 팝업에 뿌려줄 총 데이터
doc = document;  //한번만 window객체 불러오게끔.

//CheckBox total check
$("#totalListCheck").click(function(){
	if($("#totalListCheck").prop("checked")){
		$("input[name='addsong']").prop("checked", true);
	}else{
		$("input[name='addsong']").prop("checked", false);
	}
});

//Add Song 
function checkedSong(){
	var check = $("input[name='addsong']:checked");

	if(	$("input[name='addsong']").is(":checked") ){
		var len = check.length;
		var numArr = new Array();
		var i = 0;
		
		if(len > 1){
			check.each(function(index){
				numArr[i] = $(this).val();
				i++;
			});
		}else if(len == 1){
			numArr[0] = check.val();
		}
	}
	return parseInt(numArr);
}

//Create Selected Song Data
function playAdd(){
	var arr = checkedSong();
	console.log(arr);
	var addSongArr = new Array();  //total selected data
	var eachForm = doc.paramvalue;
	
	console.log(eachForm); //undefined
	
	for(var i=0; i<arr.length; i++){
		var Obj = {
	//			eachForm[(arr[i]-1)];
		};
	}	
}

//Play One (1)
function playnow(no){
	this.no = no;
	var oneArr = new Array();
	
	//곡이 1곡만 들어왔음.
	var num = $(".songName").find("span").text();
	num = num.replace("(","").replace(")","");   // (1)		
	
	if( num == 1 ){
		var song = songWrapper(doc.paramValue);
		oneArr.push(song);
	}else if( num != 1){
		playform = doc.paramValue[no-1];
		var song = songWrapper(playform);
		oneArr.push(song);
	}	
	playing(oneArr); 
}

function songWrapper(form){
	var oneObj = {
			"title" : form.title.value,
			"artist" : form.artist.value,
			"album" : form.album.value,
			"duration" : form.duration.value,
			"filePath" : form.filePath.value
	};
	return oneObj;
}
		
		
//Play All (15)
function playAllNow(){
	if( $("#totalListCheck").prop("checked") ){ //전체 체크되어 있다면 데이터 넘길 준비 완료됨.
		playing(allDataConverter());
	}else {  //전체 체크가 되어있지 않다면, 전체체크해주고 데이터 넘기기
		$("input[name='addsong']").prop("checked", true);
		$("#totalListCheck").prop("checked", true);
		playing(allDataConverter());
	}
}

//popup Player & Play song
function playing(data){
	
	$.ajax({
		type : "POST",
		url  : "/player/webplayer",  //AudioURL뽑아와서,
		data : JSON.stringify(data),
		success : function(urlData){ //여기서 AudioURL를 받음
			dataforPrint = urlData; //뿌려줄 데이터 
			
			var option = "width=650, height=450, resizeable=no, scrollbars=yes, left=220, top=50";	
			popupPlayer = window.open("", "Player", option);
			
			$.get("/player/webplayer", function(){
				popupPlayer.location ="/player/webplayer";
			});
		},
		error : function(err){
			alert("Failed get URL Data");
		},
		headers : {
			'Accept' : 'application/json; charset=UTF-8',
			'Content-Type' : 'application/json; charset=UTF-8'
		}
	});
}

//formElement --> Array
function allDataConverter(){
	var allArr = new Array();
	var allforms = doc.paramValue;
	for(var i=0; i<allforms.length; i++){
		var dataObj = {
				"title" : allforms[i].title.value,
				"artist" : allforms[i].artist.value,		
				"album" : allforms[i].album.value,
				"duration" : allforms[i].duration.value,
				"filePath" : allforms[i].filePath.value
		};
	   allArr.push(dataObj);
	}
	return allArr;
}	
