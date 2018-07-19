package cn.lgh.action;

import cn.lgh.model.News;
import cn.lgh.model.Pager;
import cn.lgh.service.Impl.NewsServiceImpl;
import cn.lgh.service.NewsService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.RequestAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NewsAction extends ActionSupport implements ModelDriven<News>,RequestAware {
    private News news;
    private NewsService newsService = new NewsServiceImpl();
    private Map<String, Object> request = null;
    private Map<String,Object> jsonMap = new HashMap<String,Object>();
    private String[] ids;
    private String pageNum;
    private int type;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getPageNum() {
        return pageNum;
    }

    public void setPageNum(String pageNum) {
        this.pageNum = pageNum;
    }

    public String[] getIds() {
        return ids;
    }

    public void setIds(String[] ids) {
        this.ids = ids;
    }
    public String dels(){
        for (int i = 0;i<ids.length;i++){
            newsService.delete(Integer.parseInt(ids[i]));
        }
        return SUCCESS;
    }
    public Map<String, Object> getJsonMap() {
        return jsonMap;
    }

    public void setJsonMap(Map<String, Object> jsonMap) {
        this.jsonMap = jsonMap;
    }

    public NewsService getNewsService() {
        return newsService;
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    @Override
    public News getModel() {
        return news;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
            this.request = map;
    }

    public String save(){
        newsService.save(news);
        return SUCCESS;
    }

    public String query(){
        Pager<News> result = newsService.fenYe(Integer.parseInt(pageNum),10);
        request.put("result",result);
        return "newsQuery";
    }

    public String get1(){
        News news1 = newsService.get(news.getNid());
        request.put("news1",news1);
        return "zhang";
    }

    public String get2(){
        newsService.addView(news.getNid());
        News news1 = newsService.get(news.getNid());
        request.put("news2",news1);
        return "three";
    }

    public String delete(){
        newsService.delete(news.getNid());
        jsonMap.put("del",true);
        return "json";
    }

    public String get(){
        News news2 = newsService.get(news.getNid());
        request.put("news2",news2);
        return "newsUpdate";
    }

    public String update(){
        newsService.update(news);
        return SUCCESS;
    }

    public String queryByType(){
        type = news.getNtype();
        Pager<News> result = newsService.fenYe2(news.getNtype(),Integer.parseInt(pageNum),15);
        request.put("result",result);
        return "queryBy";
    }
}
