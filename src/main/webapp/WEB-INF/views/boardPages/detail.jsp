
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
    <div class="container mt-5">
        <div id="comment-write" class="input-group mb-3">
            <div class="form-floating">
                <input type="text" id="commentWriter" class="form-control" value="${loginMemberId}"  placeholder="작성자" readonly>
                <label for="commentWriter">작성자</label>
            </div>
            <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
        </div>



    <div id="comment-list">
        <table class="table">
            <tr>
                <th>댓글번호</th>
                <th>작성자</th>
                <th>작성시간</th>
            </tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                    <td>${comment.id}</td>
                    <td>${comment.commentWriter}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    </div>

</body>
<c:if test="${sessionScope.loginMemberId eq board.boardWriter}">
<a href="/board/delete?id=${board.id}">삭제</a>
<a href="/board/update?id=${board.id}">업데이트</a>
    <a href="/">돌아가기</a>
</c:if>
<c:if test="${sessionScope.loginMemberId eq 'admin'}">
    <a href="/board/delete?id=${board.id}">삭제</a>
</c:if>
<script>
    $("#comment-write-btn").click(function () {
        const cWriter=document.getElementById("commentWriter").value;
        const boardId='${board.id}';
          $.ajax({
              type:"post",
              url:"/comment/save",
              data:{
                  "commentWriter":cWriter,
                  "boardId":boardId,

              },
              data_type:"json",
              success: function (result){

                  let output = "<table class='table'>";
                  output += "<tr><th>댓글번호</th>";
                  output += "<th>작성자</th>";
                  output += "<th>작성시간</th></tr>";
                for (let i in result ){
                    output +="<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].commentWriter+"</td>";
                    output += "<td>"+moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output +="</tr>";
                }
                    output += "</table>";
                document.getElementById('comment-list').innerHTML=output;
                document.getElementById('commentWriter').value='';
              },

                  
          });

    });
</script>
</html>
