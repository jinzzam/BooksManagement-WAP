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
<body>
<%
    //1. 기존의 세션 데이터를 모두 삭제
    session.invalidate();

    //2. 로그인 페이지로 이동시킴
    response.sendRedirect("form.jsp");
%>
</body>
</html>
