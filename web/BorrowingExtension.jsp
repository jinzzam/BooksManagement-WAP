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
        table,th,td{
            border: 1px solid #bcbcbc;
            height: 40px;
        }
        table{
            width: 800px;
        }
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

<div class = "container">
    <div class = "row">

        <div class = "col-md-2">
            <div class="container">
                <h3>대출/연장/예약</h3>
                <div class="row">
                    <div class="col-md-2">
                        <nav class="nav-sidebar">
                            <ul class="nav">
                                <li class="active"><a href="BorrowingExtension.jsp">대출/연장 현황</a></li>
                                <li class=""><a href="Record.jsp">대출/반납 기록</a></li>
                                <li class=""><a href="Reservation.jsp">    예약</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <%
            request.setCharacterEncoding("utf-8"); // 한글깨짐현상 바로잡음
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String user = "system";
            String pass = "pass";
            Connection conn;
            PreparedStatement pstmt;
            ResultSet rs;

            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, user, pass);

            String id = (String)session.getAttribute("id");
            String sql = "select * from list where id like '%"+id+"%'";
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
        %>
        <div class = "col-md-6">
            <div class="container">
                <table border="1">
                    <tr>
                        <td><input type = "hidden" name = "nothing"></td>
                        <th class="text-center">도서번호</th>
                        <th class="text-center">책제목</th>
                        <th class="text-center">대여일</th>
                        <th class="text-center">반납예정일</th>
                        <th class="text-center">반납하기</th>
                    </tr>
                    <%while(rs.next()){
                        String returndate = rs.getString("returndate");
                        String notReturn = "null";
                        if(returndate.equals(notReturn)){
                    %>
                    <tr>
                        <form method="post" action="Return.jsp" accept-charset="UTF-8">
                            <td><input type = "hidden" name = "no"value=<%=rs.getString("no")%>></td>
                            <td align="center"><%=rs.getString("no")%></td>
                            <td align="center"><%=rs.getString("name")%></td>
                            <td align="center"><%=rs.getString("outdate")%></td>
                            <td align="center"><%=rs.getString("duedate")%></td>
                            <td align="center"><input type="submit" value = "반납"></td>
                        </form>
                    </tr>
                    <%}
                    }%>
                </table>
            </div>
        </div>
    </div>
</div>
<%
    rs.close();
    pstmt.close();
    conn.close();
%>
<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.min.js"></script>
</body>
</html>