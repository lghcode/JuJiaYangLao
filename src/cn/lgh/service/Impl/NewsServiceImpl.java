package cn.lgh.service.Impl;

import cn.lgh.dao.Impl.NewsDaoImpl;
import cn.lgh.dao.NewsDao;
import cn.lgh.model.News;
import cn.lgh.model.Pager;
import cn.lgh.service.NewsService;

import java.util.List;

public class NewsServiceImpl implements NewsService {
    NewsDao newsDao = new NewsDaoImpl();
    @Override
    public void save(News news) {
        newsDao.add(news);
    }

    @Override
    public void delete(int id) {
        newsDao.delete(id);
    }

    @Override
    public void update(News news) {
        newsDao.update(news);
    }

    @Override
    public List<News> query() {
        return newsDao.query();
    }

    @Override
    public News get(int id) {
        return newsDao.getNews(id);
    }

    @Override
    public List<News> queryByName(int id) {
        return newsDao.queryByName(id);
    }

    @Override
    public void addView(int id) {
        newsDao.addView(id);
    }

    @Override
    public Pager<News> fenYe(int pageNum, int pageSize) {
        return newsDao.fenYe(pageNum,pageSize);
    }

    @Override
    public Pager<News> fenYe2(int id, int pageNum, int pageSize) {
        return newsDao.fenYe2(id,pageNum,pageSize);
    }
}
