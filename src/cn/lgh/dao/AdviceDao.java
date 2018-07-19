package cn.lgh.dao;

import cn.lgh.model.Advice;
import cn.lgh.model.News;
import cn.lgh.model.Pager;

import java.util.List;

public interface AdviceDao {
    void add(Advice advice);
    void delete(int id);
    List<Advice> query();
    Advice getAdvice(int id);
    Pager<Advice> fenYe(int pageNum, int pageSize);
}
