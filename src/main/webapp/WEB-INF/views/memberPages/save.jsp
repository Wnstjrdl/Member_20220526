<%--
  Created by IntelliJ IDEA.
  User: adwin21-175
  Date: 2022-05-26
  Time: 오후 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<div class="container">
    <h2 class="display-4 fw-normal">save.jsp</h2>
    <div class="py-5 text-center">

    <form action="/member/save" method="post" enctype="multipart/form-data">
        <input class="form-control mb-2" type="text"  onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="아이디">
        <span id="dup-check-result"></span>
        <input class="form-control mb-2" type="text"  id="memberPassword" name="memberPassword" placeholder="비밀번호를 입력하세요">
        <div  id="pwCheck"></div>
        <input class="form-control mb-2" type="text" name="memberName" placeholder="이름를 입력하세요">
        <input class="form-control mb-2" type="text" name="memberEmail" placeholder="이메일를 입력하세요">
        <input class="form-control mb-2" type="text" id="memberMobile" name="memberMobile" placeholder="전화번호를 입력하세요">
        <div id="mobileCheck"></div>
        프로필사진을 등록해주세요:<input type="file" name="memberFile">
        <input class="btn btn-danger" type="submit" value="회원가입">
    </form>
    </div>
</div>
</body>
    <script>
        const duplicateCheck = () => {
          const memberId=document.getElementById("memberId").value;
          const checkResult=document.getElementById("dup-check-result");
            $.ajax({
                type:"post",
                url: "/member/duplicate-check",
              data:{"memberId":memberId},
              dataType:"text",
              success:function (result){
                  if(result == "ok"){
                      checkResult.innerHTML="사용가능합니다.";
                      checkResult.style.color="green";
                  }else{
                      checkResult.innerHTML="중복된 아이디 값입니다";
                      checkResult.style.color="red";
                  }
              }
          });



        }

        const pwJ= /^[A-Za-z0-9]{4,12}$/;

        $('#memberPassword').blur(function () {
            if(pwJ.test($('#memberPassword').val())){
                console.log('true');
                $('#pwCheck').text('ok');
                $('#pwCheck').css('color','green');
            }else {
                console.log('false');
                $('#pwCheck').text('숫자 or 문자로만4~12자리입력');
                $('#pwCheck').css('color','red');

            }

        });
      const mobileJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
            $('#memberMobile').blur(function (){
                if(mobileJ.test($('#memberMobile').val())){
                    console.log('true');
                    $('#mobileCheck').text('ok');
                    $('#mobileCheck').css('color','green');
                }else {
                    console.log('false');
                    $('#mobileCheck')
                    $('#mobileCheck').text('잘못된입력방식입니다');
                    $('#mobileCheck').css('color','red');
                }
            })

    </script>

</html>
