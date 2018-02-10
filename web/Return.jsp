<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width = device-width" initial-scale = "1">
    <link rel = "stylesheet" href="css/bootstrap.min.css">
    <title>Insert title here</title>
    <style>
        body { padding-top: 20px; }
    </style>
</head>
<body>
<nav class = "navbar navbar-default">
    <div class = "navbar-header">
        <button type="button" class = "navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="Main.jsp">WAP 도서관</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="BookSearchForm.jsp">자료 검색</a></li>
            <li><a href="Service.jsp">도서관 서비스</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">내 정보</a>
                <ul class = "dropdown-menu">
                    <li><a href="/get-new-info">개인정보관리</a></li>
                    <li><a href="BorrowingExtensionReservation.jsp">대출/연장/예약</a> </li>
                </ul>
            </li>
            <li><a href="bbs.jsp">도서관 이용안내</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="/logout" role="button" aria-haspopup="true" aria-expanded="false">로그아웃<span class="caret"></span></a>
            </li>
        </ul>
    </div>
</nav>
<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyMMdd");
    String today = formatter.format(new java.util.Date());
    System.out.println(today);

    request.setCharacterEncoding("utf-8"); // 한글깨짐현상 바로잡음
    String booknum = request.getParameter("no");
    String id = (String)session.getAttribute("id");
    String inTimeReturn = "정상반납";
    String lateReturn = "연체반납";
    String avail = "0";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "system";
    String pass = "pass";
    Connection conn;
    ResultSet rs = null;
    PreparedStatement pstmt;


    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, pass);

    String sql = "update book set available = ? where no = ?";
    pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,avail);
    pstmt.setString(2,booknum);
    pstmt.executeUpdate();

    sql = "select * from list where no = ? and returntype = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,booknum);
    pstmt.setString(2,"null");
    rs = pstmt.executeQuery();
    rs.next();
    String duedate = rs.getString("duedate");

    int int_duedate = Integer.parseInt(duedate);
    int int_today = Integer.parseInt(today);

    String returntype;
    if(int_today>int_duedate){
        returntype = lateReturn;
    }
    else
        returntype = inTimeReturn;



sql = "update list set returndate = ?, returntype = ? where no = ? and returntype =?";
    pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,today);
    pstmt.setString(2,returntype);
    pstmt.setString(3,booknum);
    pstmt.setString(4,"null");
    pstmt.executeUpdate();

%>
<%
    pstmt.close();
    conn.close();
%>
<jsp:forward page="BorrowingExtension.jsp"/>
<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.min.js"></script>
</body>
</html>
