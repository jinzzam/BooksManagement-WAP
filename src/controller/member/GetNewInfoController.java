package controller.member;

import model.Service.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/get-new-info")
public class GetNewInfoController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        MemberService memberService = MemberService.getInstance();

        if (session.getAttribute("id") != null) {
            String id = (String) session.getAttribute("id");
            String name = memberService.getMember(id).getName();
            String password = memberService.getMember(id).getPassword();
            String email = memberService.getMember(id).getEmail();
            String phone = memberService.getMember(id).getPhone();

            request.setAttribute("id", id);
            request.setAttribute("name", name);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("ModifyInfo.jsp");
            requestDispatcher.forward(request, response);
            return;
        }
        response.sendRedirect("login");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
}
