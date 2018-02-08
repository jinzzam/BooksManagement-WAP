package model.Service;

import model.dao.BookDao;
import model.dto.BookDto;

import java.util.ArrayList;

public class BookService {
    private BookDao bookDao = BookDao.getInstance();
    private static BookService instance = new BookService();

    private BookService() {
        /*pass*/
    }

    public boolean isExistBook(String name) {
        ArrayList<BookDto> bookDtoArr = new ArrayList<>();
        bookDtoArr = bookDao.readName(name);
        if (bookDtoArr != null) {
            return true;
        }
        return false;
    }

    public ArrayList<BookDto> getBook(String name){
        return bookDao.readName(name);
    }

    public static BookService getInstance(){
        return instance;
    }
}
