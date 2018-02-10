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
        String newPassword = memberService.getMember(id).getPassword();
        String newEmail = memberService.getMember(id).getEmail();
        String newPhone = memberService.getMember(id).getPhone();
        boolean ch = false;
        try {
            if(request.getAttribute("newPassword")!=null) {
                newPassword = (String) request.getAttribute("newPassword");
            }
            if(request.getAttribute("newEmail")!=null) {
                newEmail = (String) request.getAttribute("newEmail");
            }
            if(request.getAttribute("newPhone")!=null) {
                newPhone = (String) request.getAttribute("newPhone");
            }

            memberService.getMember(id).setPassword(newPassword);
            memberService.getMember(id).setEmail(newEmail);
            memberService.getMember(id).setEmail(newPhone);

            ch = memberService.update(memberService.getMember(id), id);
        } catch (Exception e){
            e.printStackTrace();
        }

        request.setAttribute("ch", ch);
        System.out.println(ch);
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
