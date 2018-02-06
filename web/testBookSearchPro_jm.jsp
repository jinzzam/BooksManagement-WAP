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
        <a class="navbar-brand" href="Main.jsp">WAP ������</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="BookSearchForm.jsp">�ڷ� �˻�</a></li>
            <li><a href="bbs.jsp">������ ����</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">�� ����</a>
                <ul class = "dropdown-menu">
                    <li><a href="#">������������</a> </li>
                    <li><a href="BorrowingExtensionReservation.jsp">����/����/����</a> </li>
                </ul>
            </li>
            <li><a href="bbs.jsp">������ �̿�ȳ�</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">�����ϱ�<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li class="active"><a href="Login.jsp">�α���</a></li>
                    <li><a href="JoinInForm.jsp">ȸ������</a> </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<%
    request.setCharacterEncoding("utf-8"); // �ѱ۱������� �ٷ�����
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "system";
    String pass = "pass";
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;

    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, pass);

    String name = request.getParameter("searchbook");
    out.println(name);

    String sql = "select * from book where name like '%"+name+"%'";
    pstmt=conn.prepareStatement(sql);

    rs=pstmt.executeQuery();
%>
<table border="1">
    <%while(rs.next()){
        String available = rs.getString("available");
        String unavail = "1";
        String vNo = rs.getString("no");
    %>
    <tr>
        <form method="post" action="testList_jm.jsp" accept-charset="UTF-8">
        <td><%=rs.getString("no")%></td>
        <td><%=rs.getString("name")%></td>
        <td><%=rs.getString("author")%></td>
        <td><%=rs.getString("translator")%></td>
        <td><%=available%></td>
        <%if(!unavail.equals(available)) {%>
        <td><button type="submit" class="btn btn-primary form-control" name = vNo>�뿩����</button></td>
        <%} else{%>
        <td>�뿩�Ұ�</td>
        <%}%>
        </form>
    </tr>
    <%}%>
</table>
<%
    rs.close();
    pstmt.close();
    conn.close();
%>


</body>
</html>