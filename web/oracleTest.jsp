<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Insert title here</title>
</head>
<body>
<%
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "system";
    String pass = "bmwbmw";
    Connection conn;
    Statement  stmt;
    PreparedStatement pstmt;
    ResultSet rs;

    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, pass);
    stmt = conn.createStatement();
    pstmt=conn.prepareStatement("select * from book");
    rs=pstmt.executeQuery();
    System.out.println("<table border=\"1\">");
    while(rs.next()){
        System.out.println("<tr>");
        System.out.println("<td>"+rs.getString("no")+"</td>");
        System.out.println("<td>"+rs.getString("name")+"</td>");
        System.out.println("<td>"+rs.getString("author")+"</td>");
        System.out.println("<td>"+rs.getString("translator")+"</td>");
        System.out.println("</tr>");
    }
    System.out.println("</table>");

    conn.close();
%>


</body>
</html>