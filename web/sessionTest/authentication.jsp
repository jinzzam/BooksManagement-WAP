<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-04
  Time: 오후 7:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //0. 인증 가능 사용자 및 비밀번호 목록
    String[] users = {"youjin", "jungmin"};
    String[] password = {"123123", "234234"};

    //1, form 으로부터 전달된 데이터를 변수에 저장
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    //2. 사용자 인증
    String redirectUrl = "form.jsp"; //인증 실패 시 재요청 될 url

    for(int i = 0;i< users.length; i++){
        if(users[i].equals(id) && password[i].equals(pw)){
            session.setAttribute("signedUser", id); //인증되었음 세션에 남김
            redirectUrl = "welcome.jsp"; //인증 성공 시 재요청 url
        }
    }

    response.sendRedirect(redirectUrl);
%>
</body>
</html>
