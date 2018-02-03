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
<h2>WAP 도서관 회원가입</h2>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="RequestCertifyEmail.jsp">
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
                    <span class="input-group-addon"> <span class="glyphicon glyphicon-envelope"> </span> </span>
                    <input type="email" class="form-control" placeholder="이메일" name="email">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"> <span class="glyphicon glyphicon-phone"> </span> </span>
                    <input type="number" class="form-control" placeholder="핸드폰 번호" name="phone">
                </div>
                <br>
                <input type="submit" class="btn btn-primary form-control" value="JOIN !">
            </form>
        </div>
    </div>
</div>

<%
    Connection conn = null;

    try{
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbId = "system";
        String dbPass = "pass";

        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
        out.println("제대로 연결되었습니다.<br>");
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        String sql = "insert into member (name, id, password, email, phone)" +
                "values (?, ?, ?, ?, ?)";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, id);
        pstmt.setString(3, password);
        pstmt.setString(4, email);
        pstmt.setString(5, phone);

        pstmt.executeUpdate();
        pstmt.close();
    } catch (Exception e){
        e.printStackTrace();
    }


%>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
