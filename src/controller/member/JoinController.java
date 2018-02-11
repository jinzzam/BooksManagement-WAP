package controller.member;

import model.Service.MemberService;
import model.dto.MemberDto;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

@WebServlet("/join")
public class JoinController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        MemberService memberService = MemberService.getInstance();
        if (session.getAttribute("id") == null) {
            String name = request.getParameter("name");
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String passwordVerify = request.getParameter("password-verify");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            class MyAuthentication extends Authenticator{
                PasswordAuthentication pa;
                public MyAuthentication(){
                    pa = new PasswordAuthentication("firstmind_@naver.com", "nsksdbwlsdl");
                }

                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return pa;
                }
            }

            boolean isTranspot = false;
            //SMTP 서버 주소
            String smtpHost = "smtp.naver.com";

            //받는 사람의 정보
            String toName = name;
            String toEmail = email;

            //보내는 사람의 정보
            String fromName = "박유진";
            String fromEmail = "firstmind_@naver.com";

            try{
                Properties properties = new Properties();
                properties.put("mail.smtp.host", smtpHost);
                properties.put("mail.smtp.auth", "true");

                //메일 인증
                Authenticator myauth = new MyAuthentication();
                Session session1 = Session.getInstance(properties, myauth);

                InternetAddress address = new InternetAddress();
                address.setPersonal(fromName, "UTF-8");
                address.setAddress(fromEmail);

                Message message = new MimeMessage(session1);
                message.setFrom(address);
                message.setSubject(MimeUtility.encodeText("WAP LIBRARY 회원가입 인증", "UTF-8", "B"));
                message.setContent("왑 도서관 회원가입 인증 메일 테스트입니다.", "text/html;charset=utf-8");
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

                Transport.send(message);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            isTranspot = true;
            request.setAttribute("isTransport", isTranspot);

            int check;
            if (memberService.isExistId(id)) {
                check = 1;
            } else if (!memberService.isExistId(id) && !memberService.isPasswordVerified(password, passwordVerify)) {
                check = 2;
            } else {
                check = 0;
                memberService.isJoin(new MemberDto(name, id, password, email, phone));
            }
            request.setAttribute("check", check);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("JoinCase.jsp");
            requestDispatcher.forward(request, response);
        }

        response.sendRedirect("join");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("id") == null) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("Join.jsp");
            requestDispatcher.forward(request, response);
            return;
        }
        response.sendRedirect("index");
    }
}
