<%@ page import="model.dto.BookDto" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-10
  Time: 오후 6:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    out.println((ArrayList<BookDto>) request.getAttribute("NowMyBooks"));
%>
</body>
</html>
