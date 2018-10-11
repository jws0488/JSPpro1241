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
<c:if test="${param.message == 'error' }">
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	</script>
</c:if>
<c:if test="${param.message == 'logout' }">
	<script>
		alert("로그아웃 되었습니다.");
	</script>
</c:if>

</head>
<body>
	<div id="page">
		<header id="h1">
			<br>
			<br>
			<h2>라켓모아</h2>
			<h3>RacketMoa</h3>
		</header>
		<div id="header1">
			<h3>관리자 로그인</h3>
		</div>
		<div id="main">
			<div id="divH">
				<img src="../images/admin.png" width="250" height="200"> <br>
				<h2>관리자 로그인</h2>
				<form method="post" name="form1"
					action="${path}/admin_servlet/sessionLogin.do">
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
							<td colspan="2" align="center"><input type="submit"
								value="로그인"></td>
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