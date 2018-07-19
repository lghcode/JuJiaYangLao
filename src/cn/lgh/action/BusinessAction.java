package cn.lgh.action;

import cn.lgh.model.Business;
import cn.lgh.model.News;
import cn.lgh.model.Pager;
import cn.lgh.service.BusinessService;
import cn.lgh.service.Impl.BusinessServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.RequestAware;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BusinessAction extends ActionSupport implements ModelDriven<Business>, RequestAware {
    private Business business;
    private BusinessService businessService = new BusinessServiceImpl();
    private Map<String, Object> request = null;
    private String bid;
    private Map<String, Object> jsonMap = new HashMap<String, Object>();
    private String[] ids;
    private String pageNum;
    private int type;
    private String name;
    private int search;

    public int getSearch() {
        return search;
    }

    public void setSearch(int search) {
        this.search = search;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

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
    public Map<String, Object> getJsonMap() {
        return jsonMap;
    }

    public void setJsonMap(Map<String, Object> jsonMap) {
        this.jsonMap = jsonMap;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public BusinessService getBusinessService() {
        return businessService;
    }

    public void setBusinessService(BusinessService businessService) {
        this.businessService = businessService;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    @Override
    public Business getModel() {
        return business;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public String save() {
        businessService.save(business);
        return SUCCESS;
    }

    public String query() {
        Pager<Business> result = businessService.fenYe(Integer.parseInt(pageNum),10);
        request.put("result",result);
        return "businessQuery";
    }

    public String query2() {
        Pager<Business> result = businessService.fenYe(Integer.parseInt(pageNum),15);
        request.put("result",result);
        return "bQ";
    }
    public String delete() {
        businessService.delete(business.getBid());
        jsonMap.put("del", true);
        return "json";
    }
    public String dels(){
        for (int i = 0;i<ids.length;i++){
            businessService.delete(Integer.parseInt(ids[i]));
        }
        return SUCCESS;
    }
    public String get() {
        Business business1 = businessService.get(business.getBid());
        request.put("business", business1);
        return "businessUpdate";
    }

    public String get2() {
        Business business1 = businessService.get(business.getBid());
        request.put("bs", business1);
        return "shangBy";
    }

    public String show() {
        Business business1 = businessService.get(business.getBid());
        request.put("business", business1);
        return "businessShow";
    }

    public String update() {
        businessService.update(business);
        return SUCCESS;
    }

    public String queryByName() throws UnsupportedEncodingException {
        type = business.getBtype();
        Pager<Business> result = businessService.fenYe2(business.getBtype(),Integer.parseInt(pageNum),15);
        request.put("result",result);
        return "shangByName";
    }

    public String search(){
        int se  = search;
        List<Business> list = businessService.search(name);
        request.put("busis",list);
        if(se==2) {
            return "businessQuery";
        }else{
            return "bQ";
        }
    }
}
