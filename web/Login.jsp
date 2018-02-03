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
    <meta name="viewport" content="width = device-width" initial-scale = "1">
    <link rel = "stylesheet" href="css/bootstrap.min.css">
    <title>WAP LIBRARY</title>
</head>
<body>
<h2>Welcome to WAP library</h2>
<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <h3 style="text-align: center;">로그인 화면</h3>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20">
            </div>
            <form method="post" action="Main.jsp">
                <input type="submit" class="btn btn-primary form-control" value="로그인">
            </form>
            <form method="post" action="JoinIn.jsp">
                <input type="submit" class="btn btn-primary form-control" value="회원가입">
            </form>
        </div>
    </div>
</div>
<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.min.js"></script>
</body>
</html>