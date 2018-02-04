<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-04
  Time: 오후 7:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<%
    //인증된 세션이 없는 경우, 해당 페이지를 볼 수 없게 함
    if (session.getAttribute("signedUser") == null) {
        response.sendRedirect("logout.jsp");
    }
%>

<body>
<h1><%= session.getAttribute("signedUser") %>님
    <small>반갑습니다.</small>
</h1>
<a href="logout.jsp">로그아웃</a>
</body>
</html>
