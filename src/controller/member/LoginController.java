package controller.member;

import model.Service.MemberService;
import model.dao.MemberDao;
import model.dto.MemberDto;
import org.apache.catalina.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        if(session.getAttribute("id")==null){
            MemberService memberService = MemberService.getInstance();
            PrintWriter out = response.getWriter();

            if(memberService.isExistId(id)){
                if(memberService.isMatchPassword(id,password)){
                    session.setAttribute("id",id);
                    response.sendRedirect("index");
                    return;
                }

            }
            response.sendRedirect("login");
            return;
        }
        response.sendRedirect("index");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("id")==null){
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
            requestDispatcher.forward(request,response);
            return;
        }
        response.sendRedirect("index");
    }
}
