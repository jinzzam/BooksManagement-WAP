<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-03
  Time: 오전 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>도서 검색 결과</title>
</head>
<body>
<%
    Connection conn = null;

    try{
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbId = "system";
        String dbPass = "pass";

        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

        String sql = "select * from book where name = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            out.println(rs.getString("bigfield")+" ");
            out.println(rs.getString("no")+" ");
            out.println(rs.getString("name")+" ");
        }
    }catch(Exception e){
        e.printStackTrace();
    }
%>
</body>
</html>
