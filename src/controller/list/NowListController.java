package controller.list;

import model.Service.MemberService;
import model.dao.BookDao;
import model.dao.ListDao;
import model.dto.BookDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "NowListController")
public class NowListController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        BookDao bookDao = BookDao.getInstance();
        if (session.getAttribute("id") != null) {
            MemberService memberService = MemberService.getInstance();
            String name = memberService.getName((String) session.getAttribute("id"));
            if (bookDao.readAll().size() != 0) {
                request.setAttribute("name", name);
               // ArrayList<BookDto> bookDto.bookDtoArr
            } else {
                /*현재 빌리고 있는 책이 없습니다.*/
            }
        }
        response.sendRedirect("login");
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
