<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.DecimalFormat" %>
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
        <a class="navbar-brand" href="/index">WAP 도서관</a>
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
            <li><a href="AboutWapLib.jsp">도서관 이용안내</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="/logout" role="button" aria-haspopup="true" aria-expanded="false">로그아웃<span class="caret"></span></a>
            </li>
        </ul>
    </div>
</nav>
<%
    Date toDay = new Date();
    SimpleDateFormat date  = new SimpleDateFormat("yyyyMMdd");
    String today = date.format(toDay);

    String laterDay = null;

    Calendar cal = Calendar.getInstance();
    Date originDate = new Date();
    Date laterDate = new Date();
    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
    originDate = format.parse(today);

    cal.setTime(laterDate);
    cal.add(Calendar.DATE, 14);
    laterDate = cal.getTime();
    laterDay = format.format(laterDate);

    request.setCharacterEncoding("utf-8"); // 한글깨짐현상 바로잡음
    String booknum = request.getParameter("no");
    String id = (String)session.getAttribute("id");
    String unavail = "1";
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
    pstmt.setString(1,unavail);
    pstmt.setString(2,booknum);
    pstmt.executeUpdate();

    sql = "select name from member where id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    rs= pstmt.executeQuery();
    rs.next();
    String borrower = rs.getString("name");

    sql = "select * from book where no = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,booknum);
    rs = pstmt.executeQuery();
    rs.next();
    String bookname = rs.getString("name");

    sql = "insert into list values(?,?,?,?,?,?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    pstmt.setString(2,borrower);
    pstmt.setString(3,bookname);
    pstmt.setString(4,booknum);
    pstmt.setString(5,today);
    pstmt.setString(6,laterDay);
    pstmt.setString(7,"null");
    pstmt.setString(8,"null");
    pstmt.executeUpdate();
%>
<%
    rs.close();
    pstmt.close();
    conn.close();
%>
<h2>
    <%=bookname%>을(를) 대여하였습니다. <%=laterDay%> 까지 반납해 주시기 바랍니다.
</h2>
<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.min.js"></script>
</body>
</html>