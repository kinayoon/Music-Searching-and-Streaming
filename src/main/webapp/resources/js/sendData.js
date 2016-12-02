/**
 *	JS for Pass data to webplayer 
 *
 * */

//Global Var
var popupPlayer;  //popup (child window)
totalforPrint = new Array(); //total playlist
doc = document;  //window

//CheckBox total check event
$(document).ready(function(){
	$("#totalListCheck").click(function(){
		if($("#totalListCheck").prop("checked")){
			$("input[name='addsong']").prop("checked", true);
		}else{
			$("input[name='addsong']").prop("checked", false);
		}
	});
});


//Like it favorite song
function likeit(no){  //해당 곡의 데이터를 
	
	var likeitSong = songWrapper(doc.paramValue[no-1]);
	likeitSong.userid = sessionId;	

	$.ajax({
			type : "POST",
			url  : "/favorite/savedSong",
			data : JSON.stringify(likeitSong),
			success : function(result) {
				alert(result);
			},
			error:function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      },
			headers : {
				'Accept' : 'application/json; charset=UTF-8',
				'Content-Type' : 'application/json; charset=UTF-8'
			}
		});
}


//Play All data --> Array
function allsongWrapper(){
	var allArr = new Array();
	var allforms = doc.paramValue;
	for(var i=0; i<allforms.length; i++){
		allArr.push(songWrapper(allforms[i]));
	}
	return allArr;
}

//make song Object
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

//Make index array clicked checkBox
function checkedSong(jQuery){
	var check = $("input[name='addsong']:checked");
	var checkLen = $("input[name='addsong']:checked").length;
	var numArr = new Array();
	var i = 0;
	
	if(checkLen > 1){
		check.each(function(index){
			numArr[i] = $(this).val();
			i++;
		});
	}else if(checkLen == 1){
		numArr[0] = check.val();
	}	
	return numArr;
}

function numberingConverter(){
	var checkList = checkedSong();
	var totalNumbering = new Array();
	
	var currentPage = window.location.href.split("&");
	var cpage= currentPage[1].split("=");
	var pageNumber = cpage[1];
	
	if(pageNumber > 1){
		for(var i=0; i<checkList.length; i++){
			var firstNumber = parseInt(checkList[i])-(pageNumber-1)*16;   // 체크된 값-((체크된 값-1)*한 페이지 데이터수)-1
			totalNumbering.push(firstNumber);
		}	
	}else {
		for(var i=0; i<checkList.length; i++){
			var firstNumber = parseInt(checkList[i]);
			totalNumbering.push(firstNumber);
		}
	}
	return totalNumbering;
}


//Create Selected Song Data
function playAdd(){
	var nowpage = window.location.href;
	
	if(nowpage.indexOf("page") != -1){
		var checked = numberingConverter();
	}else{
		var checked = checkedSong();
	}
	var addSongArr = new Array();  //total selected data
		
	if(checked.length == 0){
		alert("담고 싶은 노래에 체크를 해주세요.");
	
	}else{
		for(var i=0; i<checked.length; i++){
			var idx = checked[i];
			idx = parseInt(idx);			
			var addObj = songWrapper(doc.paramValue[idx-1]);
			addSongArr.push(addObj);
		}
		returnUrl(addSongArr);
		playing();
	}
}

//Delete songList in myMusic 
function playAllDel(){
	
	if( $(".songBox table tbody").text().trim() == ""){
		alert("삭제할 데이터가 없습니다.");
	}else{
		if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				type : "POST",
				url  : "/member/myMusic",
				success : function(data) {
					$(".songBox table tbody").text("");
					alert("모두 삭제되었습니다.");	
				},
				error : function(err){
					alert("삭제하는데 실패했습니다.");
				},
				headers : {
					'Accept' : 'application/json; charset=UTF-8',
					'Content-Type' : 'application/json; charset=UTF-8'
				}
			});
		}else{
			return;
		}
	}
}

//Play One (1)
function playnow(no){
	this.no = no;
	var oneArr = new Array();
	
	if(doc.paramValue[0].type == "hidden"){  // data = 1 (only form)
		var song = songWrapper(doc.paramValue);
		oneArr.push(song);
	}else{	// data > 1 --> Object (several form)
		var playform = doc.paramValue[no-1];
		var song = songWrapper(playform);
		oneArr.push(song);
	}
	totalforPrint = new Array(); //newer
	returnUrl(oneArr); 
	playing();
}
		
//Play All (15)
function playAllNow(){
	if( $("#totalListCheck").prop("checked") ){ //When checked all list 
		returnUrl(allsongWrapper());
		playing();
	}else {  //if do not check list, checking list
		$("input[name='addsong']").prop("checked", true);
		$("#totalListCheck").prop("checked", true);
		returnUrl(allsongWrapper());
		playing();
	}
}

//Return URL & Save Data 
function returnUrl(data){
		
	$.ajax({
		type : "POST",
		url  : "/player/playList",
		data : JSON.stringify(data),
		success : function(urlData) {
			if(totalforPrint.length != null){  
				totalforPrint.push(urlData); 
			}
		},
		error : function(err){
			alert("오디오를 불러오는데 실패했습니다.");
		},
		headers : {
			'Accept' : 'application/json; charset=UTF-8',
			'Content-Type' : 'application/json; charset=UTF-8'
		}
	});
}

//popup Player & Play song 
function playing(){
	var option = "width=650, height=450, resizeable=no, scrollbars=yes, left=220, top=50";	
	popupPlayer = window.open("", "Player", option);
	
	$.get("/player/webplayer", function(){
		popupPlayer.location ="/player/webplayer";
	});
	
}

