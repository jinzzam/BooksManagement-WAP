package model.Service;

import model.dao.MemberDao;
import model.dto.MemberDto;

import java.util.ArrayList;

public class MemberService {
    private MemberDao memberDao = MemberDao.getInstance();
    private static MemberService instance = new MemberService();

    private MemberService() {
        /*pass*/
    }

    public boolean isExistId(String id) {
        MemberDto memberDto = memberDao.read(id);
        if (memberDto != null) {
            return true;
        }
        return false;
    }

    public boolean isMatchPassword(String id, String password) {
        MemberDto memberDto = memberDao.read(id);
        if (password.equals(memberDto.getPassword())) {
            return true;
        }
        return false;
    }

    public boolean isPasswordVerified(String password, String passwordVerified) {
        if (password.equals(passwordVerified)) {
            return true;
        }
        return false;
    }

    public boolean isJoin(MemberDto memberDto) {
        return memberDao.create(memberDto);
    }

    public String getName(String id) {
        return memberDao.read(id).getName();
    }

    public ArrayList<MemberDto> getList(String name) {
        return memberDao.readAll();
    }

    public MemberDto getMember(String id) {
        return memberDao.read(id);
    }

    public static MemberService getInstance() {
        return instance;
    }

}
