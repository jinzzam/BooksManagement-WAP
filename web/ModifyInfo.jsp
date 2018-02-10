<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-10
  Time: 오후 7:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 정보 수정</title>
</head>
<body>
<form method="post" action="/modify-info">
    이름 : <%out.println(request.getAttribute("name"));%><br>
    아이디 : <%out.println(request.getAttribute("id"));%><br>
    패스워드 : <input type="password" name="newPassword"><br>
    이메일 :<input type="text" name="newEmail"><br>
    폰 번호 : <input type="text" name="newPhone"><br>
    <input type="submit" value="수정하기">
</form>

</body>
</html>
