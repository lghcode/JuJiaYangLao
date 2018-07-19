package cn.lgh.dao;

import cn.lgh.model.News;
import cn.lgh.model.Pager;

import java.util.List;

public interface NewsDao {
    void add(News news);

    void delete(int id);

    void update(News news);

    List<News> query();

    News getNews(int id);

    List<News> queryByName(int id);

    void addView(int id);

    Pager<News> fenYe(int pageNum, int pageSize);

    Pager<News> fenYe2(int id, int pageNum, int pageSize);
}
