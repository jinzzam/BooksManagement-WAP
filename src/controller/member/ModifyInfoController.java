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

@WebServlet("/modify-info")
public class ModifyInfoController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        MemberService memberService = MemberService.getInstance();
        String id = (String) session.getAttribute("id");
        boolean ch = false;
        if (request.getAttribute("newPassword") != null) {
            String newPassword = (String) request.getAttribute("newPassword");
            memberService.getMember(id).setPassword(newPassword);
            ch = true;
        }

        if (request.getAttribute("newEmail") != null) {
            String newEmail = (String) request.getAttribute("newEmail");
            memberService.getMember(id).setEmail(newEmail);
            ch = true;
        }

        if (request.getAttribute("newPhone") != null) {
            String newPhone = (String) request.getAttribute("newPhone");
            memberService.getMember(id).setPhone(newPhone);
            ch = true;
        }

        request.setAttribute("ch", ch);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ChangeResult.jsp");
        requestDispatcher.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
}
