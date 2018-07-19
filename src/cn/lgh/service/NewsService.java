package cn.lgh.service;

import cn.lgh.model.News;
import cn.lgh.model.Pager;

import java.util.List;

public interface NewsService {
    void save(News news);

    void delete(int id);

    void update(News news);

    List<News> query();

    News get(int id);

    List<News> queryByName(int id);

    void addView(int id);

    Pager<News> fenYe(int pageNum, int pageSize);

    Pager<News> fenYe2(int id, int pageNum, int pageSize);
}
