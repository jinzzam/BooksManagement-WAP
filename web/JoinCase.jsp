<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-11
  Time: 오후 7:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

<%
    if ((Integer) request.getAttribute("check") == 0) {
%>
<script>
    alert('WAP 도서관에 오신 것을 환영합니다! 로그인 해주시기 바랍니다.');
    location.href = "/login";
</script>
<%
} else if ((Integer) request.getAttribute("check") == 1) {
%>
<script>
    alert('이미 사용 중인 ID 입니다. 다른 ID를 사용해주십시오.');
    history.back();
</script>
<%
} else {
%>
<script>
    alert('비밀번호가 일치하지 않습니다. 다시 확인해주십시오.');
    history.back();
</script>
<%
    }
%>


</body>
</html>
