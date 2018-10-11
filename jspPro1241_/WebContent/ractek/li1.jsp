<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="../css/style1.css" rel="stylesheet" type="text/css">
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script>
function changeImage0() {
	var img = document.getElementById("image");
	img.src = "../images/ll1.jpg";
	img.style.width = "450px";
	img.style.height = "400px";
}
function changeImage1() {
	var img = document.getElementById("image");
	img.src = "../images/ll2.jpg";
	img.style.width = "450px";
	img.style.height = "400px";
}
</script>
<script>
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/member_servlet/sessionLogout.do";
	});
});
</script>

</head>
<body>
<div id="page">
  <header id="h1">
    <h6 id="h61">${sessionScope.message}<a href="#" id="btnLogout">  로그아웃</a></h6>
    <br>
    <br>
    <h2>라켓모아</h2>
    <h3>RacketMoa</h3>
  </header>
  <div id="header1">
    <ol>
    <li><a href="${path}/home/home.jsp">Home</a></li>
    <li><a href="${path}/ractek/ractek.jsp">추천라켓</a></li>
	<li><a href="${path}/board_servlet/list.do">
	     후기게시판</a></li>
	<li><a href="${path}/guestbook_servlet/list.do">공동구매</a></li>
	</ol>
  </div>
  <div id="main">		
    <div id="divR">
       <h1>공격형 라켓 추천 리스트</h1>
	   <img id="image" src="../images/lili.PNG" width="450px" height="400px"><br>				
	   <input type="button" value="G-Force Power1900i" onclick="changeImage0()"><br>
	   <input type="button" value="Turno X90" onclick="changeImage1()">
    </div>
 </div>
   <div id="footer1">
   <h5>RacketMoa(라켓모아)</h5>
		<h6>주소 : 서울시 강남구 000</h6>
		<h6>전화번호 : 000-0000-0000</h6>
   </div>

   
</div>
</body>
</html>