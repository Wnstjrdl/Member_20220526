<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 2:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
       const saveForm = () => {
         location.href="/member/save"
       }
        const  loginForm =()=>{
           location.href="/member/login"
       }
       const loginForm = () => {
         location.href="/member/findAll"
       }

    </script>
</head>
<body>
<h2>index.jsp</h2>
<button class="btn btn-primary" onclick="saveForm()">회원가입</button>
<button class="btn btn-primary" onclick="loginForm()">로그인</button>
<button class="btn btn-primary" onclick="findAll()">글목록</button>
</body>
</html>
