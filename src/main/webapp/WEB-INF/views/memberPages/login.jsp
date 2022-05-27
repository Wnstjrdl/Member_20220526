<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <h2>login.jsp</h2>
</head>
<body>
        <form action="/member/login" method="post">
    <input type="text" name="memberId"  placeholder="아이디를 입력하세요">
    <input type="text" name="memberPassWord"  placeholder="비밀번호를 입력하세요">
    <input type="submit" value="로그인">
        </form>
</body>
</html>
