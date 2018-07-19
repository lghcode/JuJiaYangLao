package cn.lgh.dao;

import cn.lgh.model.News;
import cn.lgh.model.Oform;
import cn.lgh.model.Older;
import cn.lgh.model.Pager;

import java.util.List;

public interface OformDao {
    void add(Oform oform);

    void delete(int id);

    void update(Oform oform);

    List<Oform> query();

    Oform get(int id);

    Pager<Oform> fenYe(int pageNum, int pageSize);

    List<Oform> searchByName(String name);
    List<Oform> searchByBName(String name);
}
