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
	comment_list();
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnList").click(function(){
		location.href="${path}/board_servlet/list.do";
	});
	$("#btnReply").click(function(){
		document.form1.action = "${path}/board_servlet/reply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function(){
		document.form1.action = "${path}/board_servlet/pass_check.do";
		document.form1.submit();
	});
});
function comment_add(){
	var param="board_num=${dto.num}&writer="
	+$("#writer").val()+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}

function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
}
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
      <h2>상세화면</h2>
    </header>
    <form name="form1" method="post">
      <table>
        <tr>
          <td>날짜</td>
          <td>${dto.reg_date}</td>
          <td>조회수</td>
          <td>${dto.readcount}</td>
        </tr>
        <tr>
          <td>작성자</td>
          <td colspan="3">${dto.writer}</td>
        </tr>
        <tr>
          <td>라켓 이름</td>
          <td colspan="3">${dto.subject}</td>
        </tr>
        <tr>
          <td>후기</td>
          <td colspan="3">${dto.content}</td>
        </tr>
        <tr>
          <td>비밀번호</td>
          <td colspan="3">
            <input type="password" name="passwd" id="passwd">
            <c:if test="${param.message == 'error' }">
              <span style="color:red">비밀번호가 일치하지 않습니다.</span>
            </c:if>
          </td>
        </tr>
        <tr>
          <td>첨부파일</td>
          <td colspan="3">(라켓상세정보)
            <c:if test="${dto.filesize > 0 }"> ${dto.filename}(${dto.filesize} bytes )
              <a href="${path}/board_servlet/download.do?num=${dto.num}">[다운로드]</a>
            </c:if>
          </td>
        </tr>
        <tr>
          <td colspan="4" align="center">
            <input type="hidden" name="num" value="${dto.num}">
            <input type="button" value="수정/삭제" id="btnEdit">
            <input type="button" value="답변" id="btnReply">
            <input type="button" value="목록" id="btnList">
          </td>  
        </tr>
      </table>
    </form>
    <footer>
      <table>
        <tr>
          <td><input id="writer" placeholder="이름"></td>
          <td rowspan="2">
            <button id="btnSave" type="button">확인</button>
          </td>
        </tr>
        <tr>
          <td><textarea rows="5" cols="80" 
               placeholder="내용을 입력하세요" id="content"></textarea></td>
        </tr>
      </table>
    </footer>
   
    <div id="commentList">
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