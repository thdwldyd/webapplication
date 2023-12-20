<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/insertform.jsp"/>
<fieldset>
<legend>목록리스트</legend>
검색:<input type="text" name="key" id="key" onkeyup="search(this)">
<div id="list" style="height:200px;overflow: scroll;overflow-x:hidden"></div>
</fieldset>

<fieldset>
<legend>상세보기</legend>
<div id="view"></div>
</fieldset>
<script>
//reqpage 첫번째 입력값을 url, 두번째 입력값을 div 위치 지정
reqpage('list','list');
function search(obj){
	var key=obj.value;
	fetch('/searchlist?key='+key)
	.then(obj => obj.text())
	.then(text =>
	document.querySelector("#list").innerHTML = text
	)
}
function reqpage(page,area){
fetch('/'+page)
.then(obj => obj.text())
.then(text =>
document.querySelector("#"+area).innerHTML = text
)
}
</script>
</body>
</html>