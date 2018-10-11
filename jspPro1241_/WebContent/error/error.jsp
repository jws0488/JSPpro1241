<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int a=Integer.parseInt(request.getParameter("num"));
//null을 숫자로 바꿀 수 없기 때문에 에러
//java.lang.NumberFormatException: null
//http://localhost/jsp01/error/error.jsp?num=5

%>

a : <%=a %>

</body>
</html>