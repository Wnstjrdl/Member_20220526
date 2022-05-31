<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-31
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<h2 class="display-4 fw-normal">update.jsp</h2>
<div class="py-5 text-center">

<form action="/board/update" method="post" name="updateForm">
  글번호: <input type="text" name="id" value="${boardUpdate.id}" class="form-control" readonly><br />
    제목:<input type="text" name="boardTitle" value="${boardUpdate.boardTitle}" class="form-control" ><br />
    작성자:<input type="text" name="boardWriter" value="${boardUpdate.boardWriter}" class="form-control" readonly><br />
    내용:<br />
   <textarea name="boardContents" cols="70" rows="10">${boardUpdate.boardContents}</textarea><br />
    <button class="btn btn-primary" onclick="location.href='/board/update'">수정</button><br />
</form>
</div>
</div>
</body>
 <script>
     const boardUpdate = () => {
       location.href="board/update";
     }


 </script>
</html>
