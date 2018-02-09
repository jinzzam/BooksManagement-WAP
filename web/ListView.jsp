<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dto.ListDto" %><%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-08
  Time: 오전 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MY LIST</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    out.println((ArrayList<ListDto>)request.getAttribute("List"));
%>
</body>
</html>
