<%@ page import="model.dao.MemberDao" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dto.MemberDto" %>
<%@ page import="model.dao.BookDao" %>
<%@ page import="model.dto.BookDto" %>
<%@ page import="model.dto.ListDto" %>
<%@ page import="model.dao.ListDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2018-02-04
  Time: 오후 6:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    MemberDao memberDao = MemberDao.getInstance();
    MemberDto memberDto = memberDao.read("youjin");
    out.println(memberDto);

    BookDao bookDao = BookDao.getInstance();
    BookDto bookDto = bookDao.read("I005.3");
    out.println(bookDto);

    ListDao listDao = ListDao.getInstance();
    ListDto listDto = listDao.read("박유진");
    out.println(listDto);
%>
</body>
</html>
