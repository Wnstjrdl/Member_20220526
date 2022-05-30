<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>detail.jsp</h2>
    ${board.id}<br/>
    ${board.boardTitle}<br/>
    ${board.boardWriter}<br/>
    ${board.boardContents}<br/>
    ${board.boardHits}<br/>
    ${board.boardCreatedDate}<br/>
    <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}"
         alt="" height="100" width="100">

</body>
</html>
