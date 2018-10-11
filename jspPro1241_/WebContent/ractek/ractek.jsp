<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="../css/style1.css" rel="stylesheet" type="text/css">
<%@ include file="../include/header.jsp"%>
<script src="../include/jquery-3.3.1.min.js"></script>
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
				<li><a href="${path}/board_servlet/list.do"> 후기게시판</a></li>
				<li><a href="${path}/guestbook_servlet/list.do">공동구매</a></li>
			</ol>
		</div>
		<div id="main">
			<div id="divH">
				<h3>라켓 유형을 선택하세요.</h3>
				<img src="../images/yrogo.jpg" width="100" height="50"><br>
				<a href="${path}/ractek/yo1.jsp" data-transition="slidedown">공격형</a><br>
				<a href="${path}/ractek/yo2.jsp" data-transition="slidedown">수비형</a><br>
				<a href="${path}/ractek/yo3.jsp" data-transition="slidedown">올라운드형</a><br>
				<br>
				<img src="../images/vrogo.jpg" width="100" height="50"><br>
				<a href="${path}/ractek/vc1.jsp" data-transition="slidedown">공격형</a><br>
				<a href="${path}/ractek/vc2.jsp" data-transition="slidedown">수비형</a><br>
				<a href="${path}/ractek/vc3.jsp" data-transition="slidedown">올라운드형</a><br>
                <br>
                <img src="../images/lrogo.jpg" width="100" height="50"><br>
				<a href="${path}/ractek/li1.jsp" data-transition="slidedown">공격형</a><br>
				<a href="${path}/ractek/li1.jsp" data-transition="slidedown">수비형</a><br>
				<a href="${path}/ractek/li1.jsp" data-transition="slidedown">올라운드형</a>
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