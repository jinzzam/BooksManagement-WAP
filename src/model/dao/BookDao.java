package model.dao;

import model.dto.BookDto;

import java.sql.*;
import java.util.ArrayList;

public class BookDao {
    private static BookDao instance = new BookDao();
    private String url;
    private String user;
    private String pass;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private BookDao() {
        url = "jdbc:oracle:thin:@localhost:1521:xe";
        user = "system";
        pass = "pass";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<BookDto> readAll(){
        ArrayList<BookDto> bookDtoArr = new ArrayList<>();
        String sql = "select * from book";
        try{
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                bookDtoArr.add(new BookDto(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)
                        ));
            }
            if(bookDtoArr.size()==0){
                return null;
            }else{
                return  bookDtoArr;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public BookDto read(String no){
        BookDto bookDto = null;
        String sql = "select * from book where no = ?";
        try{
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, no);
         rs = pstmt.executeQuery();
         while(rs.next()){
             bookDto = new BookDto(rs.getString(1),
                     rs.getString(2),
                     rs.getString(3),
                     rs.getString(4),
                     rs.getString(5),
                     rs.getString(6),
                     rs.getString(7)
                     );
         }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookDto;
    }

    public static BookDao getInstance(){
        return instance;
    }
}
