<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-11
  Time: 오후 6:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원탈퇴</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width = device-width" initial-scale="1">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- Bootstrap -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/kfonts2.css" rel="stylesheet">
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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="./js/bootstrap.min.js"></script>

<h2>정말 탈퇴하시겠습니까?</h2><br>
<h3>이후에 WAP 도서관을 이용하실 수 없습니다.<br>
    대여하신 도서들은 동아리방에 방문하여 직접 반납해주시기 바랍니다.<br><br>
    아래의 입력칸에 회원님의 비밀번호를 입력한 후 탈퇴 버튼을 눌러주시기 바랍니다.<br>
    그 동안 이용해주셔서 감사합니다.<br><br>
</h3>
<form method="post" action="/delete">
    비밀번호 : <input type="password" name="password"><input type="submit" value="탈퇴하기">
</form>

</body>
</html>
