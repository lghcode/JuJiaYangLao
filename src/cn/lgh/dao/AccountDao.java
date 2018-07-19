package cn.lgh.dao;

import cn.lgh.model.Account;

import java.util.List;

public interface AccountDao {
    void add(Account account);
    void delete(int id);
    void update(Account account);
    List<Account> query();
    Account getAccount(int id);
    Account getAccount(String str);
    boolean login(String login,String pwd);
}
