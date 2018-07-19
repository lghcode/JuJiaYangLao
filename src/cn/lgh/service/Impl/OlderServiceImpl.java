package cn.lgh.service.Impl;

import cn.lgh.dao.Impl.OlderDaoImpl;
import cn.lgh.dao.OlderDao;
import cn.lgh.model.Older;
import cn.lgh.model.Pager;
import cn.lgh.service.OlderService;

import java.util.List;

public class OlderServiceImpl implements OlderService {
    OlderDao olderDao = new OlderDaoImpl();
    @Override
    public void save(Older older) {
        olderDao.add(older);
    }

    @Override
    public void delete(int id) {
        olderDao.delete(id);
    }

    @Override
    public void update(Older older) {
        olderDao.update(older);
    }

    @Override
    public List<Older> query() {
        return olderDao.query();
    }

    @Override
    public Older get(int id) {
        return olderDao.getOlder(id);
    }

    @Override
    public Pager<Older> fenYe(int pageNum, int pageSize) {
        return olderDao.fenYe(pageNum,pageSize);
    }

    @Override
    public boolean shenHe(int id) {
        return olderDao.shenHe(id);
    }

    @Override
    public List<Older> search(String str) {
        return olderDao.search(str);
    }
}
