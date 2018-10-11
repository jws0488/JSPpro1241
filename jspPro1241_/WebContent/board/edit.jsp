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
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/board_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		document.form1.action="${path}/board_servlet/delete.do";
		document.form1.submit();
	});	
});
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
    <header>
      <h2>수정/삭제</h2>
    </header>
    <form name="form1" method="post" action="${path}/board_servlet/insert.do" 
                enctype="multipart/form-data">
      <table border="1" width="700px">
        <tr>
          <td>이름</td>
          <td><input name="writer" id="writer" value="${dto.writer}"></td>
        </tr>
        <tr>
          <td>제목</td>
          <td><input name="subject" id="subject" size="60" value="${dto.subject}"></td>
        </tr>
        <tr>
          <td>본문</td>
          <td><textarea rows="5" cols="60" name="content" id="content">${dto.content}</textarea></td>
        </tr>
        <tr>
          <td>첨부파일</td>
          <td>
            <c:if test="${dto.filesize > 0}">${dto.filename} (${dto.filesize / 1024} KB )
              <input type="checkbox" name="fileDel">첨부파일 삭제 <br>
            </c:if>
            <input type="file" name="file1"></td>
        </tr>
        <tr>
          <td>비밀번호</td>
          <td><input type="password" name="passwd" id="passwd"></td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <input type="hidden" name="num" value="${dto.num}">
            <input type="button" value="수정" id="btnUpdate">
            <input type="button" value="삭제" id="btnDelete">
          </td>
        </tr>
      </table>
    </form>
  </div>
    <div id="footer1">
   <h5>RacketMoa(라켓모아)</h5>
		<h6>주소 : 서울시 강남구 000</h6>
		<h6>전화번호 : 000-0000-0000</h6>
   </div>
</div>
</body>
</html>