package model.dao;

import model.dto.MemberDto;

import java.sql.*;
import java.util.ArrayList;

public class MemberDao {
    private static MemberDao instance = new MemberDao();
    private String url;
    private String user;
    private String pass;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private MemberDao() {
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

    public ArrayList<MemberDto> readAll() {
        ArrayList<MemberDto> memberDtoArr = new ArrayList<>();
        String sql = "select * from member";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                memberDtoArr.add(new MemberDto(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
            if (memberDtoArr.size() == 0) {
                return null;
            } else {
                return memberDtoArr;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public MemberDto read(String id) {
        MemberDto memberDto = null;
        String sql = "select * from member where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                memberDto = new MemberDto(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return memberDto;
    }

    public boolean create(MemberDto memberDto) {
        String sql = "insert into member values(?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDto.getName());
            pstmt.setString(2, memberDto.getId());
            pstmt.setString(3, memberDto.getPassword());
            pstmt.setString(4, memberDto.getEmail());
            pstmt.setString(5, memberDto.getPhone());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updatePassword(String newPassword, String name) {
        String sql = "update member set password=? where id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, name);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                MemberDto memberDto = new MemberDto(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public boolean updateEmail(String newEmail, String name) {
        String sql = "update member set email=? where id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            pstmt.setString(1, newEmail);
            pstmt.setString(2, name);
            rs = pstmt.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }



    public static MemberDao getInstance() {
        return instance;
    }
}
