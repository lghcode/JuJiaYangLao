package cn.lgh.dao.Impl;

import cn.lgh.dao.OformDao;
import cn.lgh.model.Advice;
import cn.lgh.model.Oform;
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

public class OformDaoImpl implements OformDao {
    @Override
    public void add(Oform oform) {
        Connection conn = DB.createConn();
        String sql = "insert into oform values (null,?,?,?,?,?)";
        PreparedStatement pstm = DB.prepare(conn, sql);
        try {
            pstm.setString(1,oform.getBname());
            pstm.setString(2,oform.getMoney());
            pstm.setInt(3,oform.getOid());
            pstm.setString(4,oform.getOname());
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");//可以方便地修改日期格式
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
        String sql = "delete from oform where fid = "+id;
        PreparedStatement pstm = DB.prepare(conn, sql);
        try {
            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.close(pstm);
        DB.close(conn);
    }

    @Override
    public void update(Oform oform) {

    }

    @Override
    public List<Oform> query() {
        Connection conn = DB.createConn();
        String sql = "select * from oform";
        PreparedStatement ps = DB.prepare(conn, sql);
        List<Oform> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            Oform data = null;
            while (rs.next()) {
                data = new Oform();
                data.setFid(rs.getInt(1));
                data.setBname(rs.getString(2));
                data.setMoney(rs.getString(3));
                data.setOid(rs.getInt(4));
                data.setOname(rs.getString(5));
                data.setTime(rs.getString(6));
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
    public Oform get(int id) {
        return null;
    }

    @Override
    public Pager<Oform> fenYe(int pageNum, int pageSize) {
        List<Oform> listP = query();
        Pager<Oform> pager = new Pager<Oform>(pageNum,pageSize,listP);
        return pager;
    }

    @Override
    public List<Oform> searchByName(String name) {
        Connection conn = DB.createConn();
        String sql = "select * from oform where oname = '"+name+"'";
        PreparedStatement ps = DB.prepare(conn, sql);
        List<Oform> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            Oform data = null;
            while (rs.next()) {
                data = new Oform();
                data.setFid(rs.getInt(1));
                data.setMoney(rs.getString(3));
                data.setBname(rs.getString(2));
                data.setOid(rs.getInt(4));
                data.setOname(rs.getString(5));
                data.setTime(rs.getString(6));
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
    public List<Oform> searchByBName(String name) {
        Connection conn = DB.createConn();
        String sql = "select * from oform where bname = '"+name+"'";
        PreparedStatement ps = DB.prepare(conn, sql);
        List<Oform> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            Oform data = null;
            while (rs.next()) {
                data = new Oform();
                data.setFid(rs.getInt(1));
                data.setBname(rs.getString(2));
                data.setOid(rs.getInt(4));
                data.setMoney(rs.getString(3));
                data.setOname(rs.getString(5));
                data.setTime(rs.getString(6));
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
}
