package controller.book;

import model.Service.BookService;
import model.dto.BookDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/book-search")
public class BookSearchController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BookService bookService = BookService.getInstance();
        String name = request.getParameter("search-book");
        if(bookService.isExistBook(name)){
            ArrayList<BookDto> result = bookService.getBook(name);
            System.out.println(result);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("BookSearchPro.jsp");
            requestDispatcher.forward(request,response);
            return;
        }
        response.sendRedirect("book-search");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("book-search");
    }
}
