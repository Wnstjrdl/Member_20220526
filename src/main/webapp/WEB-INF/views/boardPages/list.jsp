
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<h2>findAll.jsp</h2>
<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>작성시간</th>
            <th>조회수</th>

        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td>${board.boardWriter}</td>
                <td><a href="/board/detail?id=${board.id}">${board.boardTitle}</a></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.boardCreatedDate}"></fmt:formatDate>
                <td>${board.boardHits}</td>

            </tr>
        </c:forEach>

    </table>
    <div id="detail">

    </div>
</div>
</body>
<script>

</script>
</html>
