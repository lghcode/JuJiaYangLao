package cn.lgh.service.Impl;

import cn.lgh.dao.Impl.OformDaoImpl;
import cn.lgh.dao.OformDao;
import cn.lgh.model.Oform;
import cn.lgh.model.Pager;
import cn.lgh.service.OformService;

import java.util.List;

public class OformServiceImpl implements OformService {
    OformDao oformDao = new OformDaoImpl();
    @Override
    public void save(Oform oform) {
        oformDao.add(oform);
    }

    @Override
    public void delete(int id) {
        oformDao.delete(id);
    }

    @Override
    public List<Oform> query() {
        return oformDao.query();
    }

    @Override
    public Pager<Oform> fenYe(int pageNum, int pageSize) {
        return oformDao.fenYe(pageNum,pageSize);
    }

    @Override
    public List<Oform> search1(String name) {
        return oformDao.searchByName(name);
    }

    @Override
    public List<Oform> search2(String name) {
        return oformDao.searchByBName(name);
    }
}
