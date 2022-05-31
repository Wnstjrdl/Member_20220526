
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <h2>detail.jsp</h2>


  글번호 : ${board.id}<br/>
   제목 :${board.boardTitle}<br/>
   작성자: ${board.boardWriter}<br/>
    내용:${board.boardContents}<br/>
    조회수:${board.boardHits}<br/>
    작성시간:${board.boardCreatedDate}<br/>
    <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}"
         alt="" height="100" width="100"><br /><br />




</body>
<c:if test="${sessionScope.loginMemberId eq board.boardWriter}">
<a href="/board/delete?id=${board.id}">삭제</a>
<a href="/board/update?id=${board.id}">업데이트</a>
    <a href="/">돌아가기</a>
</c:if>
<c:if test="${sessionScope.loginMemberId eq 'admin'}">
    <a href="/board/delete?id=${board.id}">삭제</a>
</c:if>
</html>
