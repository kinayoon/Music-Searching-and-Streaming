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
			<div class="box">
				<div class="box-title">
					${artistVO.artist}
				</div>
			</div>
		</c:forEach>
		
		<div class="clearBoth"></div>
	</div> <!-- .artistBox END -->
	
	<% if( a_num > 15 ){ %>
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
					<th class="col-8"><div class="addlist">담기</div></th>
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
						<td><div class="checkSong"><input type="checkbox" name="addsong"/></div></td>
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
						<td><div class="add"><a href="javascript:playadd(${songVO.rownum});">담기</a></div></td>
					</tr>
				</c:forEach>
			</tbody>
			<tr>
				<span class="playAll"><a href="javascript:playAllNow();">전체듣기</a></span> <span> | </span>
				<span class="playOne"><a href="javascript:playEachNow(${songVO.rownum});">선택듣기</a></span>
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
			<div class="box">
				<div class="inner-box">
					<div class="album">${albumVO.album}</div>
					<div class="artist">아티스트 : ${albumVO.artist}</div>
					<div class="genre">장르 : ${albumVO.genre}</div>
					<div class="release_date">발매일 : ${albumVO.releaseDate}</div>
				</div>
			</div>
			</c:forEach>
			
		</div><!-- .albumBox END -->
	
	<% if( al_num > 15 ){ %> 
			<div class="moreview">
				<a href="/search/searchAlbums?query=${searchText}">앨범 결과 더보기</a>
			</div>
	<% } %>
		
	</div><!-- .result END -->

</div><!-- .container END -->



<script>
/* var resultQuery = $('#afterSearch').find('input[type=text]').val();
    if (resultQuery == null){
	  alert("검색어를 입력해주세요");
   } 
*/
//Global Var
var popupPlayer;
var no;
var playform;  //바로 한곡 듣기
var allArr;   //전체 곡의 데이터

//전체 체크 리스너
$("#totalListCheck").click(function(){
	if($("#totalListCheck").prop("checked")){
		$("input[name='addsong']").prop("checked", true);
	}else{
		$("input[name='addsong']").prop("checked", false);
	}
});


// One Play :  한곡듣기 
function playnow(no){
	popupWin(no);
	this.no=no;
}

// One Add : 한곡 담기
function playadd(no){
	
	if(typeof popupPlayer === "undefined" || popupPlayer.closed){ //새창띄우고,한곡듣기
		popupWin(no);
	
	}else {  // 이미 창이 있다면, 담기
		var arr = new Array(no);
		playform = document.paramValue[no-1];
		var sendData = {
			"filePath" : playform.filePath.value		
		};
		
		$.ajax({  //JSON으로 받아주고.. URL은..넘겨주고..
			type : "POST",
			url  : "/player/add",
			data : JSON.stringify(sendData),
			contentType : "application/json; charset=UTF-8",
			success : function(songURL){
				alert("담기 데이터전송 성공 : " + songURL + "같은가?" + playform.filePath.value);  //담게 될 url
				
				//popupPlayer에서 opener함수 실행시켜서 serarchMain.jsp(부모창)에 있는 값을 가져다가  append시켜야함.
				//현재 재생 중인 곡이 있다면 끝나고 새로고침해서 audio append시키고, 현재 담은 곡부터 재생시키기.
				//기존의 있던 곳들까지 새로고침되므로 arraylist에 저장해두고, 새로고침할 때 함께 append되게끔.
			},
			error : function(e){
				alert("담기 데이터전송 실패");
			},
			headers : {
				'Accept' : 'application/json; charset=UTF-8',
				'Content-Type' : 'application/json; charset=UTF-8'
			} 
		});

	}//.else END		
}		
		
// All Playing : 전체듣기 (15)
function playAllNow(){
		
	if( $("#totalListCheck").prop("checked") ){ //전체 체크되어 있다면 데이터 넘길 준비 완료됨.
		playAlltoContr();
	}else {  //전체 체크가 되어있지 않다면, 전체체크해주고 데이터 넘기기
		$("input[name='addsong']").prop("checked", true);
		$("#totalListCheck").prop("checked", true);
		playAlltoContr();
	}
}

// All Data to Controller
function playAlltoContr(){
	allArr = new Array();
	var allforms = document.paramValue;
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
	$.ajax({
		type : "POST",
		url : "/player/playAll",
		data : JSON.stringify(allArr),
		success : function(data){ //audioURL
			var option = "width=550, height=450, resizeable=no, scrollbars=yes, left=120, top=50";
			
			if( !popupPlayer || popupPlayer.closed ){
				popupPlayer = window.open("", "Player", option);
				playform.action= "/player/webplayer";
				playform.target ="Player";
				playform.method = "POST";
				playform.submit();
				
			}else{
				//self.blur();
				//popupPlayer.focus();
				popupPlayer.location.reload();
			}
			
			
		},
		error : function(err){
			alert("전체재생 실패");
		},
		headers : {
			'Accept' : 'application/json; charset=UTF-8',
			'Content-Type' : 'application/json; charset=UTF-8'
		} 
	});
}	

		
// All Each : 선택듣기 
function playEachNow(){
	
}

// 한 곡 듣기	
function popupWin(no){
	var arr = new Array(no);
	var option = "width=550, height=450, resizeable=no, scrollbars=yes, left=120, top=50";
	playform = document.paramValue[no-1];

	  // 새창 띄워주기 : 바로듣기	
		$.ajax({
			type : "GET",
			url : "/player/webplayer?no="+ encodeURIComponent(JSON.stringify({"no":no})),
			data : JSON.stringify({"no":no}), 
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				popupPlayer = window.open("", "Player", option);
				playform.action= "/player/webplayer";
				playform.target ="Player";
				playform.method = "POST";
				playform.submit();
			},
			error : function(e){
				alert("실패");
			},
			headers : {
				'Accept' : 'application/json; charset=UTF-8',
				'Content-Type' : 'application/json; charset=UTF-8'
			} 
		});
}	 

//한 곡 듣기 & 한 곡 담기 클릭시, popupPlayer의 HTML에 쓰여지게 될 함수.
function sendChildObj(Obj){
	Obj.innerHTML =
		this.no +":"+ playform.title.value +":"+ playform.artist.value +":"+ playform.album.value
		 +":"+ playform.duration.value +":"+ playform.filePath.value;
}

</script>
</body>
</html>