<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8"); // ÇÑ±Û±úÁüÇö»ó ¹Ù·ÎÀâÀ½
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "system";
    String pass = "pass";
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;

    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, pass);

    String name = request.getParameter("name");
    out.println(name);

    String sql = "select * from book where name = '"+name+"'";
    pstmt=conn.prepareStatement(sql);

    rs=pstmt.executeQuery();
    out.println("<table border=\"1\">");
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>"+rs.getString("no")+"</td>");
        out.println("<td>"+rs.getString("name")+"</td>");
        out.println("<td>"+rs.getString("author")+"</td>");
        out.println("<td>"+rs.getString("translator")+"</td>");
        out.println("</tr>");
    }
    out.println("</table>");

    conn.close();
%>


</body>
</html>