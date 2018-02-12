<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-04
  Time: 오후 4:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String pass = request.getParameter("password");

    Connection conn = null;

    try {
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbId = "system";
        String dbPass = "pass";

        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

        String sql = "select * from member where id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        rs.next();
        String password = rs.getString("password");
        rs.close();
        pstmt.close();
        conn.close();

        if (password.equals(null)) {
            request.setAttribute("errMsg","아이디가 존재하지 않습니다.");
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request,response);
        } else if(password.equals(pass)) {
            out.println("<script>");
            out.println("alert('로그인 되었습니다. 환영합니다. :)')");
            out.println("</script>");
            session.setAttribute("id", id);
        } else{
            request.setAttribute("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request,response);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
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
id와 password 세션 속성을 설정하였습니다.<br>

<%=(String)session.getAttribute("id")%>님 반갑습니다 !<br>
(디버그용)비밀번호는 <%=(String)session.getAttribute("password")%>입니다.<br>
</div> <!-- container 끝 -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="./js/bootstrap.min.js"></script>
</body>
</html>