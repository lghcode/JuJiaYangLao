package cn.lgh.service.Impl;

import cn.lgh.dao.AccountDao;
import cn.lgh.dao.Impl.AccountDaoImpl;
import cn.lgh.model.Account;
import cn.lgh.service.AccountService;

import java.util.List;

public class AccountServiceImpl implements AccountService {
    AccountDao accountDao = new AccountDaoImpl();
    @Override
    public void save(Account account) {
        accountDao.add(account);
    }

    @Override
    public void delete(int id) {
        accountDao.delete(id);
    }

    @Override
    public void update(Account account) {
        accountDao.update(account);
    }

    @Override
    public List<Account> query() {
        return accountDao.query();
    }

    @Override
    public Account get(int id) {
        return accountDao.getAccount(id);
    }

    @Override
    public Account get(String name) {
        return accountDao.getAccount(name);
    }

    @Override
    public boolean login(String login, String pwd) {
        return accountDao.login(login,pwd);
    }
}
