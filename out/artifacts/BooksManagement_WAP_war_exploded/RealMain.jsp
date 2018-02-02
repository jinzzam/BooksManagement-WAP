<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="ko-kr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width = device-width" initial-scale = "1">
    <link rel = "stylesheet" href="./css/bootstrap.min.css">
    <title>WAP 도서관</title>
    <!-- Bootstrap -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/kfonts2.css" rel="stylesheet">
    <style>
        body { padding-top: 20px; }
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
%>
<nav class = "navbar navbar-default">
    <div class = "navbar-header">
        <button type="button" class = "navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="RealMain.jsp">WAP 도서관</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="main.jsp">자료 검색</a></li>
            <li><a href="bbs.jsp">도서관 서비스</a></li>
            <li><a href="bbs.jsp">내 정보</a></li>
            <li><a href="bbs.jsp">도서관 이용안내</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">접속하기<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li class="active"><a href="LoginMain.jsp">로그인</a></li>
                    <li><a href="JoinIn.jsp">회원가입</a> </li>
                </ul>
            </li>
        </ul>
        <form class="navbar-form navbar-right" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="검색">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
</nav>
    <article>
        <%=id%>님 반갑습니다!<br>
        비밀번호 (디버그용) : <%=password%>
    </article>
</div> <!-- container 끝 -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="./js/bootstrap.min.js"></script>
</body>
</html>