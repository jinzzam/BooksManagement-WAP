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
    request.setCharacterEncoding("utf-8"); // 한글깨짐현상 바로잡음
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "system";
    String pass = "pass";
    Connection conn;
    Statement stmt;
    ResultSet rs;
    String vName,vId,vPwd,vEmail,vPhone;

    conn = DriverManager.getConnection(url, user, pass);
    stmt = conn.createStatement();
    Class.forName("oracle.jdbc.driver.OracleDriver");
    int su = 0;
    request.setCharacterEncoding("UTF-8");
    vName = request.getParameter("name");
    vId = request.getParameter("id");
    vPwd = request.getParameter("password");
    vEmail = request.getParameter("email");
    vPhone = request.getParameter("phone");


    String sql = "insert into member values('"+vName+"','"+vId+"','"+vPwd+"','"+vEmail+"','"+vPhone+"')";
    su = stmt.executeUpdate(sql);

    if(su!=0){
        %>
            <script>
                alert('<%=vId%>'+'님 회원가입 성공!!');
            </script>
        <%
            } else{
        %>
            <script>
                alert('회원가입 실패');
            </script>
<%
}
    %>
    stmt.close();
    conn.close();



</body>
</html>