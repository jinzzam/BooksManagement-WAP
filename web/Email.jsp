<%@ page import="java.net.Authenticator" %>
<%@ page import="java.net.PasswordAuthentication" %>
<%@ page import="java.util.Properties" %>
<%@ page import="org.apache.catalina.Session" %><%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018-02-11
  Time: 오후 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
  class MyAuth extends Authenticator{
      PasswordAuthentication pa;
      public MyAuth(){
          pa = new PasswordAuthentication("firstmind_@naver.com", "nsksdbwlsdl".toCharArray());
      }

      @Override
      protected PasswordAuthentication getPasswordAuthentication() {
          return pa;
      }
  }

  //SMTP 서버 주소
    String smtpHost = "smtp.naver.com";

  //받는 사람 정보
    String toName = "박유진";
    String toEmail = "firstmind_@naver.com";

    //보내는 사람의 정보
    String fromName = "박유진";
    String fromEMail = "firstmind_@naver.com";

    try{
    Properties properties = new Properties();
    properties.put("mail.smtp.host", smtpHost);
    properties.put("mail.smtp.auth", "true");

    //메일 인증
    javax.mail.Authenticator myauth = new javax.mail.Authenticator();
    Session session = javax.mail.Session.getDefaultInstance(properties, myauth);
    }
%>
</body>
</html>
