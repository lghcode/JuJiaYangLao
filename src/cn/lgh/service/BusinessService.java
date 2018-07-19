package cn.lgh.service;

import cn.lgh.model.Business;
import cn.lgh.model.News;
import cn.lgh.model.Pager;

import java.util.List;

public interface BusinessService {
    void save(Business business);

    void delete(int id);

    void update(Business business);

    List<Business> query();

    Business get(int id);

    List<Business> queryByType(int id);
    Pager<Business> fenYe(int pageNum, int pageSize);

    Pager<Business> fenYe2(int id, int pageNum, int pageSize);

    List<Business> search(String str);
}
