package cn.lgh.dao;

import cn.lgh.model.Business;
import cn.lgh.model.News;
import cn.lgh.model.Pager;

import java.util.List;

public interface BusinessDao {
    void add(Business business);

    void delete(int id);

    void update(Business business);

    List<Business> query();

    Business getBusiness(int id);

    List<Business> queryByName(int id);

    Pager<Business> fenYe(int pageNum, int pageSize);

    Pager<Business> fenYe2(int id, int pageNum, int pageSize);

    List<Business> search(String name);
}
