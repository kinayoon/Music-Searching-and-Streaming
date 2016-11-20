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
	<h3><a href="localhost:8515">Music Box</a></h3>
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
	
		<c:forEach items="${artistList}" var="artistVO">
			<div class="box">${artistVO.artist}</div>
		</c:forEach>
	
		<div class="clearBoth"></div>
	</div>
	<a href="/search/searchArtist?query=${searchText}">아티스트 결과 더보기</a>
	</div>

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
				<c:forEach items="${songList}" var="songVO">
					<tr>
						<td><div class="checkSong"><input type="checkbox"/></div></td>
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
							
						</div>
						</td>
						<td><div class="add"><a href="#">담기</a></div></td>
					</tr>
				</c:forEach>
			</tbody>
			<tr><a href="javascript:Allplaynow();">전체듣기</a> | <a href="#">듣기</a></tr>
		</table>
	</div>
	</div>
		
	<div id="result">
		<p class="albumName">앨범<span> (${albumNum}) </span></p>
		<div id="section" class="albumBox">
			<c:forEach items="${albumList}" var="albumVO">
			<div class="box">
				<div class="album">${albumVO.album}</div>
				<div class="artist">${albumVO.artist}</div>
				<div class="genre">${albumVO.genre}</div>
				<div class="release_date">${albumVO.releaseDate}</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>

/* var resultQuery = $('#afterSearch').find('input[type=text]').val();
    if (resultQuery == null){
	  alert("검색어를 입력해주세요");
   } 
*/


//Global Var
var formObj;
var childWin

//click play button  :  한곡듣기 
function playnow(no){
	popupWin(no);
}
		
function popupWin(no){
	var arr = new Array(no);
	var playform = document.paramValue[no-1];
	
	formObj = new Object();
	formObj.no = no;
	formObj.title = playform.title.value;
	formObj.artist = playform.artist.value;
	formObj.album = playform.album.value;
	formObj.duration = playform.duration.value;
	formObj.filePath = playform.filePath.value;
	
	var option = "width=400, height=450, resizeable=no, scrollbars=yes, left=50, top=50";
	
	$.ajax({
		type : "POST",
		url : "/player/webplayer",
		data : JSON.stringify(formObj),
		contentType : "application/json; charset=UTF-8",
		success : function(d){
			childWin = window.open("/player/webplayer", "Player", option);
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
 
function sendChildObj(Obj){
	Obj.innerHTML =
		this.formObj.no+":"+this.formObj.title+":"+
		this.formObj.artist+":"+this.formObj.album+":"+this.formObj.duration+":"+this.formObj.filePath;
}
 
</script>
</body>
</html>