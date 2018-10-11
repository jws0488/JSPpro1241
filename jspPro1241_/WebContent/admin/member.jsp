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
	$(function() {
		list();
		$("#btnSave").click(function() {
			insert();
		});
	});

	function insert() {
		var param = "userid=" + $("#userid").val() + "&passwd="
				+ $("#passwd").val() + "&name=" + $("#name").val() + "&email="
				+ $("#email").val();
		$.ajax({
			type : "post",
			url : "/jspPro1241_/member_servlet/join.do",
			data : param,
			success : function() {
				list();
				$("#userid").val("");
				$("#passwd").val("");
				$("#name").val("");
				$("#email").val("");
			}
		});
	}

	function list() {
		$.ajax({
			type : "post",
			url : "/jspPro1241_/member_servlet/list.do",
			success : function(result) {
				console.log(result);
				$("#memberList").html(result);
			}
		});
	}
</script>
</head>
<body>
	<div id="page">
		<header id="h1">
		    <h6 id="h61">${sessionScope.message}<a href="#" id="btnLogout">  로그아웃</a></h6>
			<br> <br>
			<h2>라켓모아</h2>
			<h3>RacketMoa</h3>
		</header>
		<div id="header1">
			<h3>관리자 페이지</h3>
		</div>
		<div id="main">
			<div id="A">
				<img src="../images/admin.png" width="250" height="200"> <br>
				<h2>회원관리</h2>
				<div id="memberList"></div>
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