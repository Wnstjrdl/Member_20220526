<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오전 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>update.jsp</h2>
<form action="/member/update" method="post" name="updateForm">
    <input type="text" name="id" value="${memberUpdate.id}" class="form-control" readonly>
    <input type="text" name="memberId" value="${memberUpdate.memberId}" class="form-control" readonly>
    <input type="text" name="memberPassword" value="${memberUpdate.memberPassword}" class="form-control" readonly>
    <input type="text" name="memberName" value="${memberUpdate.memberName}" class="form-control" readonly>
    <input type="text" name="memberEmail" value="${memberUpdate.memberEmail}" class="form-control" readonly>
    <input type="text" name="memberMobile" value="${memberUpdate.memberMobile}" class="form-control">
    <button class="btn btn-primary" onclick="location.href='/member/update'">수정</button><br />
</form>
</body>
<script>
    const memberUpdate = () => {
        const  passwordConfirm = document.getElementById("passwordConfirm").value;
        const passwordDB= '${memberUpdate.memberPassword}';
        if(passwordConfirm == passwordDB){
            updateForm.submit();
        }else{
            alert("비밀번호 불일치");

        }
    }
</script>
</html>
