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

@WebServlet("/delete")
public class DeleteController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        String password = (String) request.getParameter("password");
        MemberService memberService = MemberService.getInstance();
        boolean isMatch = false;
        if(memberService.isMatchPassword(id, password)){
            isMatch = true;
            memberService.delete(id);
            session.invalidate();
        }
        request.setAttribute("isMatch", isMatch);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("AfterDelete.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
}
