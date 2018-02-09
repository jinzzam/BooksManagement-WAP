package model.Service;

import model.dao.ListDao;

public class ListService {
    private ListDao listDao = ListDao.getInstance();
    private static ListService instance = new ListService();

    private ListService(){
        /*pass*/
    }




    public static ListService getInstance(){
        return instance;
    }
}
