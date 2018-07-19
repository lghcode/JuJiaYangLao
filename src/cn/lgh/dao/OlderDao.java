package cn.lgh.dao;

import cn.lgh.model.Business;
import cn.lgh.model.News;
import cn.lgh.model.Older;
import cn.lgh.model.Pager;

import java.util.List;

public interface OlderDao {
    void add(Older older);

    void delete(int id);

    void update(Older older);

    List<Older> query();

    Older getOlder(int id);

    Pager<Older> fenYe(int pageNum, int pageSize);

    boolean shenHe(int id);

    List<Older> search(String name);
}
