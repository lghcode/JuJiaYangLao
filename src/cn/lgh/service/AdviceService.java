package cn.lgh.service;

import cn.lgh.model.Advice;
import cn.lgh.model.News;
import cn.lgh.model.Pager;

import java.util.List;

public interface AdviceService {
    void save(Advice advice);
    void delete(int id);

    List<Advice> query();
    Advice get(int id);
    Pager<Advice> fenYe(int pageNum, int pageSize);
}
