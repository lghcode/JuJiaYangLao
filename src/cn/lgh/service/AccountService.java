package cn.lgh.service;

import cn.lgh.model.Account;

import java.util.List;

public interface AccountService {
    void save(Account account);
    void delete(int id);
    void update(Account account);
    List<Account> query();
    Account get(int id);
    Account get(String name);
    boolean login(String login,String pwd);
}
