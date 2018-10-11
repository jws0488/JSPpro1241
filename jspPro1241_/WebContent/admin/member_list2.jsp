<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import문 모두 필요없다 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>

<script type="text/javascript">
	function view(userid) {
		document.form1.userid.value = userid;
		document.form1.submit();
	}
	$(function(){
		$("#btnLogout").click(function(){
			location.href="${path}/admin_servlet/sessionLogout.do";
		});
	});
</script>

</head>
<body>

	등록된 회원수 : ${map.count}명
	<table border="1" width="600px">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
		</tr>
		<c:forEach var="dto" items="${map.list}">
			<tr>
				<td><a href="#" onclick="view('${dto.userid}')">
						${dto.name}</a></td>
				<td>${dto.userid }</td>
				<td>${dto.email}</td>
			</tr>
		</c:forEach>
	</table>
	<form name="form1" method="post"
		action="/jspPro1241_/member_servlet/view.do">
		<input type="hidden" name="userid">
	</form>

</body>
</html>