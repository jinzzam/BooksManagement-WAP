<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-11
  Time: 오후 6:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원탈퇴</title>
</head>
<body>
<h2>정말 탈퇴하시겠습니까?</h2><br>
<h3>이후에 WAP 도서관을 이용하실 수 없습니다.<br>
    대여하신 도서들은 동아리방에 방문하여 직접 반납해주시기 바랍니다.<br><br>
    아래의 입력칸에 회원님의 비밀번호를 입력한 후 탈퇴 버튼을 눌러주시기 바랍니다.<br>
    그 동안 이용해주셔서 감사합니다.<br><br>
</h3>
<form method="post" action="/delete">
    비밀번호 : <input type="password" name="password"><input type="submit" value="탈퇴하기">
</form>

</body>
</html>
