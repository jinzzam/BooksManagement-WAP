package controller.member;

import model.Service.MemberService;
import model.dto.MemberDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

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
//            if(!memberService.isExistId(id) && memberService.isPasswordVerified(password, passwordVerify)){
//                if(memberService.isJoin(new MemberDto(name, id, password, email, phone))){
//                    response.sendRedirect("login");
//                    return;
//                }
//            }
//        }
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
            System.out.println(request.getCharacterEncoding());
            System.out.println(response.getCharacterEncoding());
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
