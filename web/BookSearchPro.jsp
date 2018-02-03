<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-03
  Time: 오전 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>도서 검색 결과</title>
</head>
<body>
<%
    String bf,no;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs;

        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbId = "system";
        String dbPass = "bmwbmw";

        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

        pstmt = conn.prepareStatement("SELECT NAME FROM BOOK WHERE NAME=?");
        pstmt.setString(1, "searchbook");

        rs = pstmt.executeQuery();

        while(rs.next()){
            bf = rs.getString(1);
            no = rs.getString(2);
            System.out.println(bf+no);
        }
        rs.close();
        pstmt.close();
        conn.close();

%>
</body>
</html>
