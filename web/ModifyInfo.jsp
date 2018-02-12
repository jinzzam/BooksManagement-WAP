<%@ page import="model.dto.MemberDto" %>
<%@ page import="model.dao.MemberDao" %><%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-10
  Time: 오후 7:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        MemberDao memberDao = MemberDao.getInstance();
        MemberDto memberDto = memberDao.read((String)request.getAttribute("id"));
    %>
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

    <title>회원 정보 수정</title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/index">WAP 도서관</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="BookSearchForm.jsp">자료 검색</a></li>
            <li><a href="Service.jsp">도서관 서비스</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">내 정보</a>
                <ul class="dropdown-menu">
                    <li><a href="/get-new-info">개인정보관리</a></li>
                    <li><a href="BorrowingExtensionReservation.jsp">대출/연장/예약</a></li>
                </ul>
            </li>
            <li><a href="AboutWapLib.jsp">도서관 이용안내</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">로그아웃<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="/logout">로그아웃</a></li>
                    <li><a href="DeleteMember.jsp">회원탈퇴</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<form method="post" action="/modify-info" accept-charset="UTF-8">
    <div class="container">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="jumbotron" style="padding-top: 20px;">
                <h2 style="text-align: center;">회원 정보 수정</h2>
                <br/>
                <h3>name : <%out.println(request.getAttribute("name"));%></h3>
                <h3>ID : <%out.println(request.getAttribute("id"));%></h3>
                <br/>
                변경할 암호:<input type="password" class="form-control" placeholder="NEW PASSWORD" name="newPassword">
                <br/>
                변경할 이메일:<input type="email" class="form-control" placeholder="NEW E-MAIL" name="newEmail">
                <br/>
                변경할 폰번호:<input type="text" class="form-control" placeholder="NEW PHONE NUMBER" name="newPhone">
                <br/>
                <input type="submit" class="btn btn-primary form-control" value="수정하기">
            </div>
        </div>
    </div>
</form>
<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.min.js"></script>
</body>
</html>
