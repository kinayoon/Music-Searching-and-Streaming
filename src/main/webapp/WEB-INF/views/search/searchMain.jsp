<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
document.title="${searchText}"+"- 통합검색";
</script>
<body>
<div id="header-area">
	<div class="container">
	<h3><a href="<c:url value='/'/>">Music Box</a></h3>
	<form id="afterSearch" role="form" method="get" action="searchMain">
		<input type="text" value="${searchText}" name="query" required/>
		<input type="submit" value="검색" />
	</form>
	</div>
</div><!-- .header-area END -->


<div class="container">
	<p class="resultInfo"><span>'${searchText}'</span>에 대한 검색결과입니다.</p>
	
<div id="result">
	<p class="artistName">아티스트<span> (${artistNum}) </span></p>
	<div id="section" class="aritstBox">
		
		<% 
				int a_num = (Integer) request.getAttribute("artistNum");
				if( a_num != 0 || a_num < 9 ){  // num : 1 ~ 8
					 request.setAttribute("moreArtistList", a_num);
				}
				if( a_num != 0 || a_num > 8){ // num : 9이상
					request.setAttribute("moreArtistList", "7");
				}
		%>
		
		<c:forEach items="${artistList}" var="artistVO" begin="0" end="${moreArtistList}">
			<a href="/detail/artist?artist=${artistVO.artist}">
			<div class="box">
				<div class="box-title">
					${artistVO.artist}
				</div>
			</div>
			</a>
		</c:forEach>
		
		<div class="clearBoth"></div>
	</div> <!-- .artistBox END -->
	
	<% if( a_num > 8 ){ %>
		<div class="moreview">
			<a href="/search/searchArtists?query=${searchText}">아티스트 결과 더보기</a>
		</div>
	<% } %>	
	
</div><!-- .result END -->

<div id="result">
	<p class="songName">곡 <span> (${songNum}) </span></p>
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
			
			<% 
				int num = (Integer) request.getAttribute("songNum");
				if( num != 0 || num < 16 ){  // num : 1 ~ 15
					 request.setAttribute("moreSongList", num);
				}
				if( num != 0 || num > 15){ // num : 16이상
					request.setAttribute("moreSongList", "14");
				}
			%>
				<c:forEach items="${songList}" var="songVO" begin="0" end="${moreSongList}">
					<tr>
						<td><div class="checkSong"><input type="checkbox" name="addsong" value="${songVO.rownum}"/></div></td>
						<td><div class="num">${songVO.rownum}</div></td>
						<td><div class="title">${songVO.title}</div></td>
						<td><div class="artist">${songVO.artist}</div></td>
						<td><div class="album">${songVO.album}</div></td>
						<td><div class="likeit"><a href="#">좋아요</a></div></td>
						<td>
						<div class="play">
						<a href="javascript:playnow(${songVO.rownum});">듣기</a>
						
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
	</div><!-- .songBox END -->
	
	<% if( num > 15 ){ %> 
			<div class="moreview">
				<a href="/search/searchSongs?query=${searchText}">곡 결과 더보기</a>
			</div>
	<% } %>
		
</div><!-- .result END -->
		
<div id="result">
		<p class="albumName">앨범<span> (${albumNum}) </span></p>
		<div id="section" class="albumBox">
		
		<% 
				int al_num = (Integer) request.getAttribute("albumNum");
				if( al_num != 0 || al_num < 9 ){  // num : 1 ~ 8
					 request.setAttribute("moreAlbumList", al_num);
				}
				if( al_num != 0 || al_num > 8){ // num : 9이상
					request.setAttribute("moreAlbumList", "7");
				}
		%>
		
			<c:forEach items="${albumList}" var="albumVO" begin="0" end="${moreAlbumList}"> 
			<a href="/detail/album?id=${albumVO.albumid}">
			<div class="box">
				<div class="inner-box">
						<div class="album">${albumVO.album}</div>
						<div class="artist">아티스트 : ${albumVO.artist}</div>
						<div class="genre">장르 : ${albumVO.genre}</div>
						<div class="release_date">발매일 : ${albumVO.releaseDate}</div>
				</div>	
			</div><!-- .box END -->
			</a>
				<form name="toAlbumPage">
					<input type="hidden" name="album" value="${albumVO.album}"  />
					<input type="hidden" name="artist" value="${albumVO.artist}"  />
					<input type="hidden" name="genre" value="${albumVO.genre}"  />
					<input type="hidden" name="release_date" value="${albumVO.releaseDate}"  />
				</form>
			</c:forEach>
			
		</div><!-- .albumBox END -->
	
	    <% if( al_num > 8 ){ %> 
			<div class="moreview">
				<a href="/search/searchAlbums?query=${searchText}">앨범 결과 더보기</a>
			</div>
    	<% } %>
 		
</div><!-- .result END -->
</div><!-- .container END -->


<script>

//Global Var
var popupPlayer;  //플레이어 팝업
var playform;  //한곡 데이터
var dataforPrint;  //플레이어 팝업에 뿌려줄 총 데이터
doc = document;  //한번만 window객체 불러오게끔.
var total = doc.paramValue;  // All total Data

//CheckBox total check
$("#totalListCheck").click(function(){
	if($("#totalListCheck").prop("checked")){
		$("input[name='addsong']").prop("checked", true);
	}else{
		$("input[name='addsong']").prop("checked", false);
	}
});

//Add Song when checkBox clicked
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
	return numArr;
}

//Create Selected Song Data
function playAdd(){
	var arr = checkedSong();	
	var addSongArr = new Array();  //total selected data
	
	for(var i=0; i<arr.length; i++){
		var idx = arr[i];
		idx = parseInt(idx);
		var checked = total[idx-1];
		var Obj = {
			"title" : checked.title.value, 
			"artist" : checked.artist.value,
			"album" : checked.album.value,
			"duration" : checked.duration.value,
			"filePath" : checked.filePath.value
		};
		addSongArr.push(Obj);
	}
	//이제 이 데이터를 playing으로 보내서.. url를 따고.. url를 딴 것을 webplayer로 넘겨서 arr배열에 추가시키면 된다.
}

//Play One (1)
function playnow(no){
	this.no = no;
	var oneArr = new Array();
	
	//곡이 1곡만 들어왔음.
	var num = $(".songName").find("span").text();
	num = num.replace("(","").replace(")","");   // (1)		
	
	if( num == 1 ){
		var song = songWrapper(total);
		oneArr.push(song);
	}else if( num != 1){
		playform = total[no-1];
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
	var allforms = total;
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
</script>
</body>
</html>