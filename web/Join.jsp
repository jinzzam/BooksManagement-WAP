<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-01-19
  Time: 오후 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko-kr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WAP JOIN</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/kfonts2.css" rel="stylesheet">
    <style>
        body {
            padding-top: 20px;
        }
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<h2>WAP 도서관 회원가입</h2>
<form method="post" action="/join" accept-charset="UTF-8">
    <div class="container">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="jumbotron" style="padding-top: 20px;">
                <h3 style="text-align: center;">PLEASE JOIN US</h3>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon"> <span class="glyphicon glyphicon-user"> </span> </span>
                    <input type="text" class="form-control" placeholder="이 름" name="name">
                </div>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon"> <span class="glyphicon glyphicon-user"> </span> </span>
                    <input type="text" class="form-control" placeholder="아이디" name="id">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon">  <span class="glyphicon glyphicon-lock"></span> </span>
                    <input type="password" class="form-control" placeholder="암 호" name="password">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon">  <span class="glyphicon glyphicon-lock"></span> </span>
                    <input type="password" class="form-control" placeholder="암호확인" name="password-verify">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"> <span class="glyphicon glyphicon-envelope"> </span> </span>
                    <input type="email" class="form-control" placeholder="이메일" name="email">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"> <span class="glyphicon glyphicon-phone"> </span> </span>
                    <input type="number" class="form-control" placeholder="핸드폰 번호" name="phone">
                </div>
                <br>
                <input type="submit" class="btn btn-primary form-control" value="join"></input>
            </div>
        </div>
    </div>
</form>

<script src="js/bootstrap.min.js"></script>
</body>
</html>
