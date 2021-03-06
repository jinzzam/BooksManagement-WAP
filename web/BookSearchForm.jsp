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
    <style>
        body { padding-top: 20px; }
    </style>
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
<h2>WAP 도서관 검색</h2>
<br/>
<form method="post" action="BookSearchPro.jsp" accept-charset="UTF-8">
    <div class="container ">
        <div class="row">
            <div class="jumbotron center-block" style="height: 200px; width: 1000px; padding: 70px 200px;">
                <div id="custom-search-input">
                    <div class="input-group col-md-12">
                        <input type="text" class="form-control input-lg" name="search-book" placeholder="자료를 입력하세요" />
                        <span class="input-group-btn">
                        <button type="submit" class="btn btn-info btn-lg" type="button">검색</button>
                    </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.min.js"></script>
</body>
</html>