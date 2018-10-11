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
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.jsp";
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
	<li><a href="${path}/guestbook_servlet/list.do">공동구매</a></li>></li>
	</ol>
  </div>
	
  <div id="main">		
    <header id="header">
      <h2>라켓 후기 게시판</h2>
      <form name="form1" method="post" action="${path}/board_servlet/search.do">
        <select name="search_option">
          <c:choose>
            <c:when test="${search_option == 'writer' }">
              <option value="writer" selected>작성자</option>
              <option value="subject">라켓 이름</option>
              <option value="content">후기</option>
              <option value="all">작성자+라켓 이름+후기</option>
            </c:when>
  
            <c:when test="${search_option == 'subject' }">
              <option value="writer">작성자</option>
              <option value="subject" selected>라켓 이름</option>
              <option value="content">후기</option>
              <option value="all">작성자+라켓 이름+후기</option>
            </c:when>
  
            <c:when test="${search_option == 'content' }">
              <option value="writer">작성자</option>
              <option value="subject">라켓 이름</option>
              <option value="content" selected>후기</option>
              <option value="all">작성자+라켓 이름+후기</option>
            </c:when> 
   
            <c:when test="${search_option == 'all' }">
              <option value="writer">작성자</option>
              <option value="subject">라켓 이름</option>
              <option value="content">후기</option>
              <option value="all" selected>작성자+라켓 이름+후기</option>
            </c:when>
          </c:choose>  
        </select>
        <input name="keyword">
        <button id="btnSearch">검색</button>
      </form>
    </header>
    <table>
      <tr>
        <th>번호</th>
        <th>작성자</th>
        <th>라켓 이름</th>
        <th>날짜</th>
        <th>조회수</th>
        <th>첨부파일</th>
        <th>다운로드</th>
      </tr>
      <c:forEach var="dto" items="${list}">
        <c:choose> 
          <c:when test="${dto.show == 'y'}">
            <tr>
              <td>${dto.num}</td>
              <td>${dto.writer}</td>
              <td>
                <c:forEach var="i" begin="1" end="${dto.re_level}"> &nbsp;&nbsp;</c:forEach>
                <a href="${path}/board_servlet/view.do?num=${dto.num}">${dto.subject}</a>
                <c:if test="${dto.comment_count > 0}">
                  <span style="color:red;">(${dto.comment_count})</span>
                </c:if>
              </td>
              <td>${dto.reg_date}</td>
              <td>${dto.readcount}</td>
              <td align="center">
                <c:if test="${dto.filesize > 0 }">
                  <a href="${path}/board_servlet/download.do?num=${dto.num}">
                    <img src="../images/file.gif">
                  </a>  
                </c:if>
              </td>
              <td>${dto.down}</td>
            </tr>
          </c:when>
          <c:otherwise>
            <tr>
              <td>${dto.num}</td>
              <td colspan="6" align="center">삭제된 게시물입니다.</td> 
            </tr>
          </c:otherwise>
        </c:choose>
      </c:forEach>
    </table>
    <footer>
      <button id="btnWrite">글쓰기</button>
    </footer>
  </div>
  <div id="footer1">
   <h5>RacketMoa(라켓모아)</h5>
		<h6>주소 : 서울시 강남구 000</h6>
		<h6>전화번호 : 000-0000-0000</h6>
   </div>
</div>
</body>
</html>