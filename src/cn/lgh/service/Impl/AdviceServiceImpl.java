package cn.lgh.service.Impl;

import cn.lgh.dao.AdviceDao;
import cn.lgh.dao.Impl.AdviceDaoImpl;
import cn.lgh.model.Advice;
import cn.lgh.model.Pager;
import cn.lgh.service.AdviceService;

import java.util.List;

public class AdviceServiceImpl implements AdviceService {
    AdviceDao adviceDao = new AdviceDaoImpl();
    @Override
    public void save(Advice advice) {
        adviceDao.add(advice);
    }

    @Override
    public void delete(int id) {
        adviceDao.delete(id);
    }


    @Override
    public List<Advice> query() {
        return adviceDao.query();
    }

    @Override
    public Advice get(int id) {
        return adviceDao.getAdvice(id);
    }
    @Override
    public Pager<Advice> fenYe(int pageNum, int pageSize) {
        return adviceDao.fenYe(pageNum,pageSize);
    }
}
