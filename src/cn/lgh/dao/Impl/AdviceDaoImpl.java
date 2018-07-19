package cn.lgh.dao.Impl;

import cn.lgh.dao.AdviceDao;
import cn.lgh.model.Advice;
import cn.lgh.model.News;
import cn.lgh.model.Pager;
import cn.lgh.util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AdviceDaoImpl implements AdviceDao {
    @Override
    public void add(Advice advice) {
        Connection conn = DB.createConn();
        String sql = "insert into advice values (null,?,?,?,?,?)";
        PreparedStatement pstm = DB.prepare(conn,sql);
        try {
            pstm.setString(1,advice.getAdname());
            pstm.setString(2,advice.getAdphone());
            pstm.setString(3,advice.getAdmail());
            pstm.setString(4,advice.getAdcont());
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");//可以方便地修改日期格式
            String hehe = dateFormat.format(now);
            pstm.setString(5,hehe);

            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.close(pstm);
        DB.close(conn);
    }

    @Override
    public void delete(int id) {
        Connection conn = DB.createConn();
        String sql = "delete from advice where adid = "+id;
        PreparedStatement pstm = DB.prepare(conn,sql);
        try {
            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.close(pstm);
        DB.close(conn);
    }



    @Override
    public List<Advice> query() {
        Connection conn = DB.createConn();
        String sql = "select * from advice";
        PreparedStatement ps = DB.prepare(conn,sql);
        List<Advice> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            Advice data = null;
            while (rs.next()){
                data = new Advice();
                data.setAdid(rs.getInt("adid"));
                data.setAdname(rs.getString("adname"));
                data.setAdphone(rs.getString("adphone"));
                data.setAdmail(rs.getString("admail"));
                data.setAdcont(rs.getString("adcont"));
                data.setAdate(rs.getString("adate"));
                lists.add(data);
            }
            DB.close(rs);
            DB.close(ps);
            DB.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lists;
    }

    @Override
    public Advice getAdvice(int id) {
        Connection conn = DB.createConn();
        String sql = "select * from advice where adid = "+id;
        PreparedStatement ps = DB.prepare(conn,sql);
        Advice data = null;
        try {
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                data = new Advice();
                data.setAdid(rs.getInt("adid"));
                data.setAdname(rs.getString("adname"));
                data.setAdphone(rs.getString("adphone"));
                data.setAdmail(rs.getString("admail"));
                data.setAdcont(rs.getString("adcont"));
                data.setAdate(rs.getString("adate"));
            }
            DB.close(rs);
            DB.close(ps);
            DB.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return data;
    }

    @Override
    public Pager<Advice> fenYe(int pageNum, int pageSize) {
        List<Advice> listP = query();
        Pager<Advice> pager = new Pager<Advice>(pageNum,pageSize,listP);
        return pager;
    }
}
