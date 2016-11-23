<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
document.title="${searchText}"+"- 아티스트검색";
$(document).ready(function(){

});
</script>
<body>
<div id="header-area">
	<div class="container">
	<h3><a href="localhost:8515">Music Box</a></h3>
	<form id="afterSearch" role="form" method="get" action="searchMain">
	<input type="text" value="${searchText}" name="query" />
	<input type="submit" value="검색" />
	</form>
	</div>
</div><!-- .header-area END -->

<div class="container">
	<!-- <span class="resultText">검색결과</span> -->
	<p class="resultInfo"><span>'${searchText}'</span>에 대한 검색결과입니다.</p>
	
<!-- <nav class="resultSearch">
		<span>통합검색</span>	<span>아티스트</span>	<span>곡</span>	<span>앨범</span>
	</nav> -->
	
	<div id="result">
	<p class="artistName">아티스트<span> (${artistNum}) </span></p>
	<div id="section" class="aritstBox">
		<c:forEach items="${artistList}" var="artistVO">
			<div class="box">${artistVO.artist}</div>
		</c:forEach>
		<div class="clearBoth"></div>
	</div>
	</div>
</div> <!-- .container END -->

<script>
var resultNumber = ${artistNum};
console.log("결과값 :" +resultNumber);

if (resultNumber == 0){
	$('.artistBox').after("<p class='resultNull'>검색한 결과가 없습니다.</p>");
}

$(document).ready(function(){
	
});
</script>

</body>
</html>