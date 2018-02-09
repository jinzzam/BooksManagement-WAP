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
                listDtoArr.add(new ListDto(rs.getInt("id"),
                        rs.getString("borrower"),
                        rs.getString("name"),
                        rs.getString("no"),
                        rs.getDate("outdate"),
                        rs.getDate("duedate"),
                        rs.getDate("returndate"),
                        rs.getString("returntype")));
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

    public ArrayList<ListDto> readByBorrower(String borrower) {
        ArrayList<ListDto> ListDtoArr = new ArrayList<>();
        String sql = "select * from list where borrower = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, borrower);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ListDtoArr.add(new ListDto(rs.getInt("id"),
                        rs.getString("borrower"),
                        rs.getString("name"),
                        rs.getString("no"),
                        rs.getDate("outdate"),
                        rs.getDate("duedate"),
                        rs.getDate("returndate"),
                        rs.getString("returntype")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ListDtoArr;
    }

    public static ListDao getInstance() {
        return instance;
    }
}
