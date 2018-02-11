<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-11
  Time: 오후 7:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if ((boolean) request.getAttribute("isMatch") == true) {
%>
<script>
    alert('탈퇴되었습니다.');
    location.href="/index";
</script>
<%
} else {
%>
<script>
    alert('비밀번호가 일치하지 않습니다.');
    location.href="/index";
</script>
<%
    }
%>
</body>
</html>
