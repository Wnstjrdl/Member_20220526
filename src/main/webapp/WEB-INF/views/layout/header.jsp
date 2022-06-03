
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오전 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
   <header class="p-3 bg-dark text-white">
       <div class="container">

           <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
               <li><a href="/"   class="nav-link px-2 text-primary">인덱스로돌아가기</a> </li>
               <li><a href="/board/save"   class="nav-link px-2 text-primary">글쓰기</a> </li>
               <li><a href="/member/logout"  class="nav-link px-2 text-white">로그아웃</a> </li>
               <c:if test="${sessionScope.loginMemberId eq 'admin'}">
                   <a href="/member/admin" class="nav-link px2 text-primary">관리자페이지로이동</a>

               </c:if>

             <c:if test="${loginMemberId != null }">
                 <td><a href="/member/detail?id=${loginId}" class="nav-link px2 text-primary">마이페이지로이동</a></td>
               </c:if>

           </ul>
       </div>
   </header>
</body>
</html>
