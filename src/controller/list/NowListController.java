package controller.list;

import model.Service.BookService;
import model.Service.MemberService;
import model.dao.BookDao;
import model.dto.BookDto;

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

@WebServlet("/now-my-books")
public class NowListController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        BookDao bookDao = BookDao.getInstance();
        if (session.getAttribute("id") != null) {
            MemberService memberService = MemberService.getInstance();
            String name = memberService.getName((String) session.getAttribute("id"));
            if (bookDao.readByCheckedOut(name).size() != 0) {
                request.setAttribute("name", name);
                ArrayList<BookDto> bookDtoArr = bookDao.readByCheckedOut(name);
                request.setAttribute("NowMyBooks", bookDtoArr);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("NowMyBooksView.jsp");
                requestDispatcher.forward(request, response);
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("NoListAlert.jsp");
                requestDispatcher.forward(request, response);
            }
        }
        response.sendRedirect("login");
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request,response);
    }
}
