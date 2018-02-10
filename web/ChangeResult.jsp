<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-10
  Time: 오후 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    if ((boolean) request.getAttribute("ch") == true) {
%>
<script>
    alert('변경되었습니다.');
    location.href="/index";
</script>
<%
} else {
%>
<script>
    alert('변경사항이 없습니다.');
    location.href="/index";
</script>
<%
    }
%>

</body>
</html>
