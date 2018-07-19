package cn.lgh.action;

import cn.lgh.model.News;
import cn.lgh.model.Older;
import cn.lgh.model.Pager;
import cn.lgh.service.Impl.OlderServiceImpl;
import cn.lgh.service.OlderService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.RequestAware;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OlderAction extends ActionSupport implements ModelDriven<Older>,RequestAware {
    private Older older;
    private OlderService olderService = new OlderServiceImpl();
    private Map<String,Object> jsonMap = new HashMap<String,Object>();
    private String[] ids;
    private String pageNum;

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
            olderService.delete(Integer.parseInt(ids[i]));
        }
        return SUCCESS;
    }
    public Map<String, Object> getJsonMap() {
        return jsonMap;
    }

    public void setJsonMap(Map<String, Object> jsonMap) {
        this.jsonMap = jsonMap;
    }

    public OlderService getOlderService() {
        return olderService;
    }

    public void setOlderService(OlderService olderService) {
        this.olderService = olderService;
    }

    private Map<String,Object> request = null;
    public Older getOlder() {
        return older;
    }

    public void setOlder(Older older) {
        this.older = older;
    }

    public String  save(){
        olderService.save(older);
        return "olderSave";
    }

    public String query(){
        Pager<Older> result = olderService.fenYe(Integer.parseInt(pageNum),10);
        request.put("result",result);
        return "olderQuery";
    }

    public String delete(){
        olderService.delete(older.getOid());
        jsonMap.put("del",true);
        return "json";
    }


    public String get(){
        Older older1 = olderService.get(older.getOid());
        request.put("older",older1);
        return "olderUpdate";
    }

    public String show(){
//        System.out.println(older.getOid());
        Older older2 = olderService.get(older.getOid());
        String str = older2.getOname()+"#"+older2.getOsex()+"#"+older2.getOnumber();
        jsonMap.put("lao",str);
//        System.out.println("json 已经返回");
        return "json";
    }
    public String show1(){
        Older older2 = olderService.get(older.getOid());
        request.put("older",older2);
        return "show1";
    }
    public String shenHe(){
        boolean sw = olderService.shenHe(older.getOid());
        jsonMap.put("del",sw);
        return "json";
    }
    public String update(){
        olderService.update(older);
        return SUCCESS;
    }

    public String search(){
        List<Older> olderList = olderService.search(older.getOname());
        request.put("olders",olderList);
        return "olderQuery";
    }
    @Override
    public Older getModel() {
        return older;
    }


    @Override
    public void setRequest(Map<String, Object> map) {
            this.request = map;
    }
}
