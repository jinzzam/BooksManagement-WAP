<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-01-14
  Time: 오전 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta name="viewport" content="width = device-width" initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <script type="text/javascript">
        function formCheck(obj) {
            if (!obj.id.value || obj.id.value.trim().length == 0) {
                alert("아이디를 입력해주세요.");
                obj.id.value = "";
                obj.id.focus();
                return false;
            }
            if (!obj.password.value || obj.password.value.trim().length == 0) {
                alert("비밀번호를 입력해주세요.");
                obj.password.value = "";
                obj.password.focus();
                return false;
            }
        }
    </script>


    <title>WAP LIBRARY</title>
</head>
<body>

<h2>Welcome to WAP library</h2>
<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <h3 style="text-align: center;">로그인 화면</h3>
            <form method="post" action="/login" onsubmit="return formCheck(this)">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20">
                </div>

                <input type="submit" class="btn btn-primary form-control" value="로그인">

            </form>
            <input type="button" class="btn btn-primary form-control" value="회원가입" onclick="location.href='join'">
        </div>
    </div>
</div>


<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>