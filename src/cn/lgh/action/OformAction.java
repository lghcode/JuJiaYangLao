package cn.lgh.action;

import cn.lgh.model.News;
import cn.lgh.model.Oform;
import cn.lgh.model.Pager;
import cn.lgh.service.Impl.OformServiceImpl;
import cn.lgh.service.OformService;
import cn.lgh.util.ExcelUtils2;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.RequestAware;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OformAction extends ActionSupport implements ModelDriven<Oform>,RequestAware {
    private Oform oform;
    private OformService oformService = new OformServiceImpl();
    private Map<String, Object> request = null;
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
            oformService.delete(Integer.parseInt(ids[i]));
        }
        return SUCCESS;
    }
    public Map<String, Object> getJsonMap() {
        return jsonMap;
    }

    public void setJsonMap(Map<String, Object> jsonMap) {
        this.jsonMap = jsonMap;
    }

    @Override
    public Oform getModel() {
        return oform;
    }

    public String save(){
        oformService.save(oform);
        return SUCCESS;
    }

    public String query(){
        Pager<Oform> result = oformService.fenYe(Integer.parseInt(pageNum),10);
        request.put("result",result);
        return "oformQuery";
    }

    public String excel() throws Exception {
        HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
        String fileName = "会员消费统计表";
        String[] excelHeader = {"会员号#oid","姓名#oname","消费金额#money","所在商家#bname","消费时间#time"};
        List<Oform> oformList1 = oformService.query();
        ExcelUtils2.export(response,fileName,excelHeader,oformList1);
        return "excel";
    }
    public String delete(){
        oformService.delete(oform.getFid());
        jsonMap.put("del",true);
        return "json";
    }

    public String searchOname(){
        List<Oform> list2 = oformService.search1(oform.getOname());
        request.put("huiyuan",list2);
        return "oformQuery";
    }
    public String searchBname(){
        List<Oform> list3 = oformService.search2(oform.getBname());
        request.put("huiyuan",list3);
        return "oformQuery";
    }
    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Oform getOform() {
        return oform;
    }

    public void setOform(Oform oform) {
        this.oform = oform;
    }

    public OformService getOformService() {
        return oformService;
    }

    public void setOformService(OformService oformService) {
        this.oformService = oformService;
    }
}
