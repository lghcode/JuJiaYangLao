package cn.lgh.service;

import cn.lgh.model.News;
import cn.lgh.model.Older;
import cn.lgh.model.Pager;

import java.util.List;

public interface OlderService {
    void save(Older older);
    void delete(int id);
    void update(Older older);
    List<Older> query();
    Older get(int id);
    Pager<Older> fenYe(int pageNum, int pageSize);
    boolean shenHe(int id);
    List<Older> search(String str);
}
