<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
</head>
<body>
<h2>파일 업로드</h2>
<form name="form1" method="post" enctype="multipart/form-data" action="upload_result.jsp">
작성자 : <input name="name"><br>
라켓 이름 : <input name="subject"><br>
파일1 : <input type="file" name="file1"><br>
파일2 : <input type="file" name="file2"><br>
<input type="submit" value="업로드">
</form>
</body>
</html>