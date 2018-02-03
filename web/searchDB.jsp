<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-03
  Time: 오후 3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Searching</title>
</head>
<body>
<%
    String name = request.getParameter("name");

    Connection conn = null;
    Statement stmt = null;

    try{
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbId = "system";
        String dbPass = "pass";

        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

        if(conn==null)
            throw new Exception("데이터베이스 연결 실패");
            //연결된 상태를 stmt 로
            stmt = conn.createStatement();

            //DB에 들어있는 정보를 가져와서 rs객체로 저장
            ResultSet rs = stmt.executeQuery("select * from test where name='name'");

            if(!rs.next()){
                out.println("해당하는 정보가 없습니다.");
            } else{
                rs.previous();
            }

            while (rs.next()){
                String bookname = rs.getString("name");
                String no = rs.getString("no");
                String author = rs.getString("author");

                out.println("sdferf");
                out.println(bookname);
                out.println(no);
                out.println(author);
            }
    } catch (Exception e){
        e.printStackTrace();
    } finally {

    }
%>
</body>
</html>
