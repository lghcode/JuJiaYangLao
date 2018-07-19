package cn.lgh.dao.Impl;

import cn.lgh.dao.OlderDao;
import cn.lgh.model.Advice;
import cn.lgh.model.Business;
import cn.lgh.model.Older;
import cn.lgh.model.Pager;
import cn.lgh.util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OlderDaoImpl implements OlderDao {
    @Override
    public void add(Older older) {
        Connection conn = DB.createConn();
        String sql = "insert into older values (null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstm = DB.prepare(conn, sql);
        try {
            pstm.setString(1, older.getOname());
            pstm.setString(2, older.getOsex());
            pstm.setDate(3, older.getObirth());
            pstm.setString(4, older.getOphone());
            pstm.setString(5, older.getOzone());
            pstm.setString(6, older.getOtown());
            pstm.setString(7, older.getOaddress());
            pstm.setString(8, older.getOjuzhu());
            pstm.setString(9, older.getOself());
            pstm.setString(10, older.getOjname());
            pstm.setString(11, older.getOguanxi());
            pstm.setString(12, older.getOjphone());
            pstm.setString(14, older.getOnumber());
            pstm.setBoolean(13, older.isOstaut());
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
        String sql = "delete from older where oid = " + id;
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
    public void update(Older older) {
        Connection conn = DB.createConn();
        String sql = "update older set oname = ?,osex = ?,obirth = ?,ophone = ?,ozone = ?" +
                ",otown = ?,oaddress = ?,ojuzhu = ?,oself = ?" +
                ",ojname = ?,oguanxi = ?,ojphone = ?,onumber = ? where oid = ?";
        PreparedStatement pstm = DB.prepare(conn, sql);
        try {
            pstm.setString(1, older.getOname());
            pstm.setString(2, older.getOsex());
            pstm.setDate(3, older.getObirth());
            pstm.setString(4, older.getOphone());
            pstm.setString(5, older.getOzone());
            pstm.setString(6, older.getOtown());
            pstm.setString(7, older.getOaddress());
            pstm.setString(8, older.getOjuzhu());
            pstm.setString(9, older.getOself());
            pstm.setString(10, older.getOjname());
            pstm.setString(11, older.getOguanxi());
            pstm.setString(12, older.getOjphone());
            pstm.setString(13, older.getOnumber());
            pstm.setInt(14, older.getOid());

            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.close(pstm);
        DB.close(conn);
    }

    @Override
    public List<Older> query() {
        Connection conn = DB.createConn();
        String sql = "select * from older";
        PreparedStatement ps = DB.prepare(conn, sql);
        List<Older> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            Older data = null;
            while (rs.next()) {
                data = new Older();
                data.setOid(rs.getInt("oid"));
                data.setOname(rs.getString("oname"));
                data.setOsex(rs.getString("osex"));
                data.setObirth(rs.getDate("obirth"));
                data.setOphone(rs.getString("ophone"));
                data.setOzone(rs.getString("ozone"));
                data.setOtown(rs.getString("otown"));
                data.setOaddress(rs.getString("oaddress"));
                data.setOjuzhu(rs.getString("ojuzhu"));
                data.setOself(rs.getString("oself"));
                data.setOjname(rs.getString("ojname"));
                data.setOguanxi(rs.getString("oguanxi"));
                data.setOjphone(rs.getString("ojphone"));
                data.setOnumber(rs.getString("onumber"));
                data.setOstaut(rs.getBoolean("ostaut"));
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
    public Older getOlder(int id) {
        Connection conn = DB.createConn();
        String sql = "select * from older where oid = " + id;
        PreparedStatement ps = DB.prepare(conn, sql);
        Older data = null;
        try {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                data = new Older();
                data.setOid(rs.getInt("oid"));
                data.setOname(rs.getString("oname"));
                data.setOsex(rs.getString("osex"));
                data.setObirth(rs.getDate("obirth"));
                data.setOphone(rs.getString("ophone"));
                data.setOzone(rs.getString("ozone"));
                data.setOtown(rs.getString("otown"));
                data.setOaddress(rs.getString("oaddress"));
                data.setOjuzhu(rs.getString("ojuzhu"));
                data.setOself(rs.getString("oself"));
                data.setOjname(rs.getString("ojname"));
                data.setOguanxi(rs.getString("oguanxi"));
                data.setOjphone(rs.getString("ojphone"));
                data.setOnumber(rs.getString("onumber"));
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
    public Pager<Older> fenYe(int pageNum, int pageSize) {
        List<Older> listP = query();
        Pager<Older> pager = new Pager<Older>(pageNum,pageSize,listP);
        return pager;
    }

    @Override
    public boolean shenHe(int id) {
        Older older = getOlder(id);
        boolean isSt;
        int m = 0;
        if (older.isOstaut()==true){
           isSt = false;
        }else {
            isSt = true;
        }
        Connection conn = DB.createConn();
        String sql = "update older set ostaut = ? where oid = ?";
        PreparedStatement pstm = DB.prepare(conn, sql);
        try {
            pstm.setBoolean(1, isSt);
            pstm.setInt(2, id);
             m = pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.close(pstm);
        DB.close(conn);
        if (m!=-1){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List<Older> search(String name) {
        Connection conn = DB.createConn();
        String sql = "select * from older where oname like '%"+name+"%'";
        PreparedStatement ps = DB.prepare(conn, sql);
        List<Older> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            Older data = null;
            while (rs.next()) {
                data = new Older();
                data.setOid(rs.getInt("oid"));
                data.setOsex(rs.getString("osex"));
                data.setOname(rs.getString("oname"));
                data.setObirth(rs.getDate("obirth"));
                data.setOphone(rs.getString("ophone"));
                data.setOzone(rs.getString("ozone"));
                data.setOtown(rs.getString("otown"));
                data.setOaddress(rs.getString("oaddress"));
                data.setOjuzhu(rs.getString("ojuzhu"));
                data.setOself(rs.getString("oself"));
                data.setOjname(rs.getString("ojname"));
                data.setOguanxi(rs.getString("oguanxi"));
                data.setOjphone(rs.getString("ojphone"));
                data.setOnumber(rs.getString("onumber"));
                data.setOstaut(rs.getBoolean("ostaut"));
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
