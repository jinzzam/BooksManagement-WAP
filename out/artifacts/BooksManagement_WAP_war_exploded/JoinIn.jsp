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

    <script>
        function radioCheck(objName) {
            var radio = document.all[objName];

            var bCheck = false;
            for(var i=0; i<radio.length; i++){
                if(radio[i].checked == true){
                    alert(radio[i].value);
                    bCheck = true;
                }
            }
            if(bCheck == false){
                alert("선택된 값이 없습니다.");
                radio[0].focus();
            }
        }
    </script>
</head>
<body>
<h2>WAP 도서관 회원가입</h2>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="RequestCertifyEmail.jsp">
                <h3 style="text-align: center;">PLEASE JOIN US</h3>

                <div class="input-group">
                    <span class="input-group-addon"> <span class="glyphicon glyphicon-user"> </span> </span>
                    <input type="text" class="form-control" placeholder="이 름" name="name">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon">  <span class="glyphicon glyphicon-heart"></span> </span>
                    <input type="date" class="form-control" placeholder="생년월일" name="birthday">
                </div>
                <br>
                <div class="radio">
                    <label class="pull-left">
                        <div class="pull-left">
                            <input type="radio" name="gender" value="f">
                            여자
                        </div>
                    </label>
                    <label class="pull-right">
                        <div class="pull-right">
                            <input type="radio" name="gender" value="m">
                            남자
                        </div>
                    </label>
                </div>
                <br>
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
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        System.out.println(gender);

        String sql = "insert into member (name, birthday, gender, id, password, email, phone)" +
                "values (?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, birthday);
        pstmt.setString(3, gender);
        pstmt.setString(4, id);
        pstmt.setString(5, password);
        pstmt.setString(6, email);
        pstmt.setString(7, phone);

        pstmt.executeUpdate();
        pstmt.close();
    } catch (Exception e){
        e.printStackTrace();
    }


%>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
