<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오전 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>passwordCheck.jsp</h2>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<form action="member/update" method="post">
    <label for="passwordConfirm">비밀번호를 입력해주세요</label>
    <input type="text" id="passwordConfirm"><br />
    <input class="btn btn-primary" type="button " onclick="passwordCheck()" value="확인">
</form>

</body>
<script>
    const passwordCheck = () => {
        const passwordConfirm=document.getElementById("passwordConfirm").value;
        const passwordDB =  '${member.memberPassword}';
            if(passwordConfirm==passwordDB){
                location.href="/member/update?id=${member.id}";
            }else {
                    alert("비밀번호 불일치")
                location.href="/member/detail?id=${member.id}";
            }

    }
</script>
</html>
