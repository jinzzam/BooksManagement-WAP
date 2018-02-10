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

@WebServlet("/modify-info")
public class ModifyInfoController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        MemberService memberService = MemberService.getInstance();
        String id = (String) session.getAttribute("id");
        MemberDto M = memberService.getMember(id);
        String newPassword;
        String newEmail;
        String newPhone;

        boolean ch = false;
        try {
            if (!request.getParameter("newPassword").isEmpty()) {
                newPassword = (String) request.getParameter("newPassword");
                M.setPassword(newPassword);
                ch = true;
            } else{
                M.setPassword(memberService.getMember(id).getPassword());
            }
            if (!request.getParameter("newEmail").isEmpty()) {
                newEmail = (String) request.getParameter("newEmail");
                M.setEmail(newEmail);
                ch = true;
            }else{
                M.setEmail(memberService.getMember(id).getEmail());
            }
            if (!request.getParameter("newPhone").isEmpty()) {
                newPhone = (String) request.getParameter("newPhone");
                M.setPhone(newPhone);
                ch = true;
            }else{
                M.setPhone(memberService.getMember(id).getPhone());
            }
            memberService.update(M, id);
        } catch (Exception e) {
            e.printStackTrace();
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
