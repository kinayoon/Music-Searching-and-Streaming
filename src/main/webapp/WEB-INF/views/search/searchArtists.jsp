<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
document.title="${searchTxt}"+"- 아티스트검색";
</script>
<body>
<div id="header-area">
	<div class="container">
	<h3><a href="<c:url value='/'/>">Music Box</a></h3>
	<form id="afterSearch" role="form" method="get" action="searchMain">
		<input type="text" value="${searchTxt}" name="query" required/>
		<input type="submit" value="검색" />
	</form>
	</div>
</div><!-- .header-area END -->

<div class="container">
	<p class="resultInfo"><span>'${searchTxt}'</span>에 대한 검색결과입니다.</p>
	
	<div id="result">
	<p class="artistName">아티스트<span> (${artistNum}) </span></p>
	<div id="section" class="aritstBox">
	
		<c:forEach items="${artistList}" var="artistVO">
			<div class="box">
				<div class="box-title">
					${artistVO.artist}
				</div>
			</div>
		</c:forEach>
		
		<div class="clearBoth"></div>
	</div> <!-- .artistBox END -->
	</div><!-- .result END -->
</div><!-- .container END -->

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