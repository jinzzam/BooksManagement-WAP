package model.dao;

import model.dto.ListDto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ListDao {
    private static ListDao instance = new ListDao();
    private String url;
    private String user;
    private String pass;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private ListDao() {
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

    public ArrayList<ListDto> readAll() {
        ArrayList<ListDto> listDtoArr = new ArrayList<>();
        String sql = "select * from list";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                listDtoArr.add(new ListDto(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getDate(6),
                        rs.getString(7)
                ));
            }
            if (listDtoArr.size() == 0) {
                return null;
            } else {
                return listDtoArr;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ListDto read(String borrower){
        ListDto listDto = null;
        String sql = "select * from list where borrower = ?";
        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, borrower);
            rs = pstmt.executeQuery();
            while(rs.next()){
                listDto = new ListDto(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listDto;
    }
    public static ListDao getInstance(){
        return instance;
    }
}
