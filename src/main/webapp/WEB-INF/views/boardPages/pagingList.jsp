
<%--
  Created by IntelliJ IDEA.
  User: adwin21-175
  Date: 2022-05-28
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>


<h2>pagingList.jsp</h2>
    <div class="container mt-3">
        <form action="/board/search" method="get">
    <select name="searchType">
        <option value="boardTitle">제목</option>
        <option value="boardWriter">작성자</option>
    </select>
        <input type="text" name="q" placeholder="검색어입력">
        <input type="submit"   value="검색">

        </form>
    </div>





    <div class="container ">
        <table  class="table">
            <tr>
                <td>글번호</td>
                <td>작성자</td>
                <td>제목</td>
                <td>내용</td>
                <th>작성시간</th>
                <th>조회수</th>

            </tr>
        <c:forEach items="${boardList}" var="board">

            <tr>
                <td>${board.id}</td>
                <td>${board.boardWriter}</td>
                <td><a href="/board/detail?page=${paging.page}&id=${board.id}">${board.boardTitle}</a></td>
                <td>${board.boardContents}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                    value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <td>${board.boardHits}</td>




            </tr>
        </c:forEach>
        </table>
    </div>
    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                </c:choose>
            </c:forEach>
                <c:choose>
                    <c:when test="${paging.page>=paging.maxPage}">
                        <li class="page-item disabled">
                            <a class="page-link">[다음]</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/paging?page${paging.page+1}">[다음]</a>
                        </li>
                    </c:otherwise>
                </c:choose>
        </ul>
    </div>
</body>
</html>
