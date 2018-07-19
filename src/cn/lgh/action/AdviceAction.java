package cn.lgh.action;

import cn.lgh.model.Advice;
import cn.lgh.model.News;
import cn.lgh.model.Pager;
import cn.lgh.service.AdviceService;
import cn.lgh.service.Impl.AdviceServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.RequestAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdviceAction extends ActionSupport implements ModelDriven<Advice>,RequestAware {
    private Advice advice;
    private AdviceService adviceService = new AdviceServiceImpl();
    private Map<String, Object> request = null;
    private String adid;
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
            adviceService.delete(Integer.parseInt(ids[i]));
        }
        return SUCCESS;
    }
    public Map<String, Object> getJsonMap() {
        return jsonMap;
    }

    public void setJsonMap(Map<String, Object> jsonMap) {
        this.jsonMap = jsonMap;
    }



    public AdviceService getAdviceService() {
        return adviceService;
    }

    public void setAdviceService(AdviceService adviceService) {
        this.adviceService = adviceService;
    }

    public Advice getAdvice() {
        return advice;
    }

    public void setAdvice(Advice advice) {
        this.advice = advice;
    }



    public String save(){
        adviceService.save(advice);
        return SUCCESS;
    }

    public String query(){
        Pager<Advice> result = adviceService.fenYe(Integer.parseInt(pageNum),10);
        request.put("result",result);
        return "adviceQuery";
    }

    public String delete(){
        adviceService.delete(advice.getAdid());
        jsonMap.put("del",true);
        return "json";
    }

    public String get(){
        Advice advice1 = adviceService.get(advice.getAdid());
        request.put("advice",advice1);
        return SUCCESS;
    }


    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    @Override
    public Advice getModel() {
        return advice;
    }
}
