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
    <title>Title</title>
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

        if (password.equals(pass)) {
            out.println("<script>");
            out.println("alert('로그인 되었습니다. 환영합니다. :)')");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('정보가 틀렸습니다!')");
            out.println("</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    session.setAttribute("id", id);
    session.setAttribute("password", pass);

    response.sendRedirect("Main.jsp");
%>
</body>
</html>
