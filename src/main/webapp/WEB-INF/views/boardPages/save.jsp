<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>


    <h2>save.jsp</h2>
    <div class="py-5 text-center">

        <form action="/board/save" method="post" enctype="multipart/form-data">
            <input class="form-control mb-2" type="text"  name="boardTitle" placeholder="제목"  >
            <input class="form-control mb-2"  type="text" value="${loginMemberId}" name="boardWriter" placeholder="작성자" readonly>
            <textarea class="form-control" name="boardContents" rows="5" cols="10"></textarea>
            첨부파일:<input  type="file" name="boardFile">
            <input class="btn btn-primary" type="submit" value="글작성">
        </form>
    </div>
    </div>
</body>
</html>
