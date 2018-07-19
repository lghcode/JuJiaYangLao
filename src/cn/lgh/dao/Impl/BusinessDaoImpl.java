package cn.lgh.dao.Impl;

import cn.lgh.dao.BusinessDao;
import cn.lgh.model.Advice;
import cn.lgh.model.Business;
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

public class BusinessDaoImpl implements BusinessDao {
    @Override
    public void add(Business business) {
        Connection conn = DB.createConn();
        String sql = "insert into business values (null,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstm = DB.prepare(conn, sql);
        try {
            pstm.setString(1, business.getBname());
            pstm.setString(2, business.getBlegal());
            pstm.setString(3, business.getBadress());
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");//可以方便地修改日期格式
            String hehe = dateFormat.format(now);
            pstm.setString(4, hehe);
            pstm.setString(5, business.getBcode());
            pstm.setInt(6, business.getBmeber());
            pstm.setString(7, business.getByewu());
            pstm.setString(8, business.getBphone());
            pstm.setString(9, business.getBcont());
            pstm.setInt(10, 1);
            pstm.setInt(11, business.getBtype());

            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.close(pstm);
        DB.close(conn);
        // System.out.println("add-ok");
    }

    @Override
    public void delete(int id) {
        Connection conn = DB.createConn();
        String sql = "delete from business where bid = " + id;
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
    public void update(Business business) {
        Connection conn = DB.createConn();
        String sql = "update business set bname = ?,blegal = ?," +
                "badress = ?,bdate = ?,bcode = ?,bmeber = ?,byewu = ?," +
                "bphone = ?,bcont = ?, btype = ? where bid = ?";
        PreparedStatement pstm = DB.prepare(conn, sql);
        try {
            pstm.setString(1, business.getBname());
            pstm.setString(2, business.getBlegal());
            pstm.setString(3, business.getBadress());
            pstm.setString(4, business.getBdate());
            pstm.setString(5, business.getBcode());
            pstm.setInt(6, business.getBmeber());
            pstm.setString(7, business.getByewu());
            pstm.setString(8, business.getBphone());
            pstm.setString(9, business.getBcont());
            // pstm.setInt(10, business.getTid());
            pstm.setInt(10, business.getBtype());
            pstm.setInt(11, business.getBid());
            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.close(pstm);
        DB.close(conn);
    }

    @Override
    public List<Business> query() {
        Connection conn = DB.createConn();
        String sql = "select * from business";
        PreparedStatement ps = DB.prepare(conn, sql);
        List<Business> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            Business data = null;
            while (rs.next()) {
                data = new Business();
                data.setBid(rs.getInt("bid"));
                data.setBname(rs.getString("bname"));
                data.setBlegal(rs.getString("blegal"));
                data.setBadress(rs.getString("badress"));
                data.setBdate(rs.getString("bdate"));
                data.setBcode(rs.getString("bcode"));
                data.setBmeber(rs.getInt("bmeber"));
                data.setByewu(rs.getString("byewu"));
                data.setBphone(rs.getString("bphone"));
                data.setBcont(rs.getString("bcont"));

                data.setTid(1);
                data.setBtype(rs.getInt("btype"));
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
    public Business getBusiness(int id) {
        Connection conn = DB.createConn();
        String sql = "select * from business where bid = " + id;
        PreparedStatement ps = DB.prepare(conn, sql);
        Business data = null;
        try {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                data = new Business();
                data.setBid(rs.getInt("bid"));
                data.setBname(rs.getString("bname"));
                data.setBlegal(rs.getString("blegal"));
                data.setBadress(rs.getString("badress"));
                data.setBdate(rs.getString("bdate"));
                data.setBcode(rs.getString("bcode"));
                data.setBmeber(rs.getInt("bmeber"));
                data.setByewu(rs.getString("byewu"));
                data.setBphone(rs.getString("bphone"));
                data.setBcont(rs.getString("bcont"));
                data.setBtype(rs.getInt("btype"));
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
    public List<Business> queryByName(int id) {
        Connection conn = DB.createConn();
        String sql = "select * from business where btype = "+id+"";
        PreparedStatement ps = DB.prepare(conn, sql);
        List<Business> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            Business data = null;
            while (rs.next()) {
                data = new Business();
                data.setBname(rs.getString("bname"));
                data.setBlegal(rs.getString("blegal"));
                data.setBadress(rs.getString("badress"));
                data.setBdate(rs.getString("bdate"));
                data.setBcode(rs.getString("bcode"));
                data.setBmeber(rs.getInt("bmeber"));
                data.setByewu(rs.getString("byewu"));
                data.setBphone(rs.getString("bphone"));
                data.setBcont(rs.getString("bcont"));
                data.setBid(rs.getInt("bid"));
                data.setTid(1);
                data.setBtype(rs.getInt("btype"));
                lists.add(data);
            }
            DB.close(rs);
            DB.close(ps);
            DB.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //System.out.println("dao by name");
        return lists;
    }

    @Override
    public Pager<Business> fenYe(int pageNum, int pageSize) {
        List<Business> listP = query();
        Pager<Business> pager = new Pager<Business>(pageNum,pageSize,listP);
        return pager;
    }

    @Override
    public Pager<Business> fenYe2(int id, int pageNum, int pageSize) {
        List<Business> listy = queryByName(id);
        Pager<Business> pager = new Pager<Business>(pageNum,pageSize,listy);
        return pager;
    }

    @Override
    public List<Business> search(String name) {
        Connection conn = DB.createConn();
//        select * from business where bname like '%w%';
        String sql = "select * from business where bname like '%"+name+"%'";
        PreparedStatement ps = DB.prepare(conn, sql);
        List<Business> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            Business data = null;
            while (rs.next()) {
                data = new Business();
                data.setBlegal(rs.getString("blegal"));
                data.setBadress(rs.getString("badress"));
                data.setBdate(rs.getString("bdate"));
                data.setBcode(rs.getString("bcode"));
                data.setBmeber(rs.getInt("bmeber"));
                data.setByewu(rs.getString("byewu"));
                data.setBphone(rs.getString("bphone"));
                data.setBcont(rs.getString("bcont"));
                data.setBname(rs.getString("bname"));
                data.setBid(rs.getInt("bid"));
                data.setTid(1);
                data.setBtype(rs.getInt("btype"));
                lists.add(data);
            }
            DB.close(rs);
            DB.close(ps);
            DB.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //System.out.println("dao by name");
        return lists;
    }
}


