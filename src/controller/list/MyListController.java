package controller.list;

import model.Service.MemberService;
import model.dao.ListDao;
import model.dto.ListDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/my-list")
public class MyListController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ListDao listDao = ListDao.getInstance();
        if (session.getAttribute("id") != null) {
            MemberService memberService = MemberService.getInstance();
            String name = memberService.getName((String) session.getAttribute("id"));
            if (listDao.readByBorrower(name).size()!=0) {
                request.setAttribute("borrower", name);
                ArrayList<ListDto> ListDtoArr = listDao.readByBorrower(name);
                request.setAttribute("List", ListDtoArr);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("ListView.jsp");
                requestDispatcher.forward(request, response);
                return;
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("NoListAlert.jsp");
                requestDispatcher.forward(request, response);
                return;
            }
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
