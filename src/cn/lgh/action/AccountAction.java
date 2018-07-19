package cn.lgh.action;

import cn.lgh.model.Account;
import cn.lgh.service.AccountService;
import cn.lgh.service.Impl.AccountServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AccountAction extends ActionSupport implements ModelDriven<Account>,RequestAware,SessionAware {
    private Account account;
    private AccountService accountService = new AccountServiceImpl();
    private Map<String, Object> request = null;
    private Map<String, Object> session = null;
    private String acid;
    private Map<String,Object> jsonMap = new HashMap<String,Object>();
    private String[] ids;

    public String[] getIds() {
        return ids;
    }

    public void setIds(String[] ids) {
        this.ids = ids;
    }
    public String dels(){
        for (int i = 0;i<ids.length;i++){
            accountService.delete(Integer.parseInt(ids[i]));
        }
        return SUCCESS;
    }
    public Map<String, Object> getJsonMap() {
        return jsonMap;
    }

    public void setJsonMap(Map<String, Object> jsonMap) {
        this.jsonMap = jsonMap;
    }

    public String getAcid() {
        return acid;
    }

    public void setAcid(String acid) {
        this.acid = acid;
    }

    public AccountService getAccountService() {
        return accountService;
    }

    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public Account getModel() {
        return account;
    }

    public String save(){
        accountService.save(account);
        return SUCCESS;
    }

    public String query(){
        List<Account> accountList = accountService.query();
        request.put("accounts",accountList);
        return "accountQuery";
    }

    public String delete(){
        accountService.delete(account.getAid());
        jsonMap.put("del",true);
        return "json";
    }

    public String get(){
        Account account1 = accountService.get(account.getAid());
        request.put("account",account1);
        return "accountUpdate";
    }

    public String update(){
        accountService.update(account);
        return SUCCESS;
    }

    public String login(){
        boolean isLogin = accountService.login(account.getAlogin(),account.getApwd());
        if (isLogin){
            Account account1 = accountService.get(account.getAlogin());
            session.put("login",account1);
            return "loginOk";
        }else{
            return "loginFail";
        }
    }
    public String exit(){
        session.clear();
        return "login";
    }
    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
}
