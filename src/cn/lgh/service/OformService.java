package cn.lgh.service;

import cn.lgh.model.News;
import cn.lgh.model.Oform;
import cn.lgh.model.Pager;

import java.util.List;

public interface OformService {
    void save(Oform oform);

    void delete(int id);

    List<Oform> query();

    Pager<Oform> fenYe(int pageNum, int pageSize);

    List<Oform> search1(String name);
    List<Oform> search2(String name);
}
