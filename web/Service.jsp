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
            <li><a href="Service.jsp">������ ����</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">�� ����</a>
                <ul class = "dropdown-menu">
                    <li><a href="/get-new-info">������������</a></li>
                    <li><a href="BorrowingExtensionReservation.jsp">����/����/����</a> </li>
                </ul>
            </li>
            <li><a href="bbs.jsp">������ �̿�ȳ�</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="/logout" role="button" aria-haspopup="true" aria-expanded="false">�α׾ƿ�<span class="caret"></span></a>
            </li>
        </ul>
    </div>
</nav>

<div class = "container">
    <div class = "col">
                <h3>WAP ���� �뿩 ���</h3>
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

            String id = (String)session.getAttribute("id");
            System.out.println(id);
            String sql = "select * from list";
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
        %>
        <div class = "col-md-6">
            <div class="container">
                <table border="1">
                    <tr>
                        <th>�̸�</th>
                        <th>������ȣ</th>
                        <th>å����</th>
                        <th>�뿩��</th>
                        <th>�ݳ�������</th>
                        <th>�ݳ���</th>
                        <th>�ݳ�����</th>
                    </tr>
                    <%while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString("borrower")%></td>
                        <td><%=rs.getString("no")%></td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("outdate")%></td>
                        <td><%=rs.getString("duedate")%></td>
                        <td><%=rs.getString("returndate")%></td>
                        <td><%=rs.getString("returntype")%></td>
                    </tr>
                    <%}%>
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