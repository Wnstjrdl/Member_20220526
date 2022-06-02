
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-31
  Time: 오후 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>

<body>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<div  class="container">
    <h2>myPages.jsp</h2>

    회원번호: ${member.id}<br/>
    회원아이디:${member.memberId}<br/>
    회원 비밀번호: ${member.memberPassword}<br/>
    회원 이름:${member.memberName}<br/>
    회원 이메일:${member.memberEmail}<br/>
    회원 전화번호:${member.memberMobile}<br/>
    <img src="${pageContext.request.contextPath}/upload/${member.memberFileName}"
         alt="" height="100" width="100"><br /><br />
   <button class="btn btn-primary" onclick="memberUpdate()">수정</button>
    <a href="/" class="btn btn-primary stretched-link"  >돌아가기</a>

    </table>


</div>


</div>
</body>
<script>
    const memberUpdate = () => {
      location.href="/member/passwordCheck?id=${member.id}";
    }
</script>
</html>
