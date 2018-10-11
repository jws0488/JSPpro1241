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
	$("#btnJoin").click(function(){
	  	var param="userid="+$("#userid").val()
	  	+"&passwd="+$("#passwd").val()
	  	+"&name="+$("#name").val();
		$.ajax({
			type: "post",
			url: "/jspPro1241_/member_servlet/join.do",
			data: param,
			success: function(){
				alert("추가되었습니다.");
			}
		});
	});
})
</script>

</head>
<body>
	<div id="page">
		<header id="h1">
			<br>
			<h6 id="h61"><a href="${path}/admin/login.jsp" target="_blank">관리자 로그인</a></h6>
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
			    <img src="../images/jo.jpg" width="250" height="150">
			    <br>
				<h2>회원가입</h2>
					<table border="1">
						<tr>
							<td>아이디</td>
							<td><input name="userid"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="passwd"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input id="name"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button" id="btnJoin"
								value="회원가입"><a href="${path}/member/login.jsp"><input type="button"
								value="로그인"></a></td>
						</tr>
					</table>
				
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