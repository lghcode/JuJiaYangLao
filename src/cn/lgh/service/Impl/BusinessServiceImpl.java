package cn.lgh.service.Impl;

import cn.lgh.dao.BusinessDao;
import cn.lgh.dao.Impl.BusinessDaoImpl;
import cn.lgh.model.Advice;
import cn.lgh.model.Business;
import cn.lgh.model.Pager;
import cn.lgh.service.BusinessService;

import java.util.List;

public class BusinessServiceImpl implements BusinessService {
    BusinessDao businessDao = new BusinessDaoImpl();

    @Override
    public void save(Business business) {
        businessDao.add(business);
    }

    @Override
    public void delete(int id) {
        businessDao.delete(id);
    }

    @Override
    public void update(Business business) {
        businessDao.update(business);
    }

    @Override
    public List<Business> query() {
        return businessDao.query();
    }

    @Override
    public Business get(int id) {
        return businessDao.getBusiness(id);
    }

    @Override
    public List<Business> queryByType(int id) {
        //System.out.println("service by name");
        return businessDao.queryByName(id);
    }
    @Override
    public Pager<Business> fenYe(int pageNum, int pageSize) {
        return businessDao.fenYe(pageNum,pageSize);
    }

    @Override
    public Pager<Business> fenYe2(int id, int pageNum, int pageSize) {
        return businessDao.fenYe2(id,pageNum,pageSize);
    }

    @Override
    public List<Business> search(String str) {
        return businessDao.search(str);
    }
}
