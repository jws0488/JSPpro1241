<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemDTO"%>
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
		$("#btnUpdate").click(function() {
			document.form1.action = "/jspPro1241_/member_servlet/update.do";
			document.form1.submit();
		});
		$("#btnDelete")
				.click(
						function() {
							if (confirm("삭제하시겠습니까?")) {
								document.form1.action = "/jspPro1241_/member_servlet/delete.do";
								document.form1.submit();
							}
						});
	});
	$(function(){
		$("#btnLogout").click(function(){
			location.href="${path}/admin_servlet/sessionLogout.do";
		});
	});
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
				<%
					MemDTO dto = (MemDTO) request.getAttribute("dto");
				%>
				<form name="form1" method="post">
				    <img src="../images/admin.png" width="250" height="200"> <br>
					<table border="1">
						<tr>
							<td>아이디</td>
							<td><%=dto.getUserid()%></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="passwd"
								value="<%=dto.getPasswd()%>"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input name="name" value="<%=dto.getName()%>"></td>
						</tr>

						<tr>
							<td>이메일</td>
							<td><input name="email" value="<%=dto.getEmail()%>"></td>
						</tr>

						<tr>
							<td colspan="2" align="center"><input type="hidden"
								name="userid" value="<%=dto.getUserid()%>">
								<button type="button" id="btnUpdate">수정</button>
								<button type="button" id="btnDelete">삭제</button></td>
						</tr>
					</table>
				</form>
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