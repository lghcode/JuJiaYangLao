package cn.lgh.dao.Impl;

import cn.lgh.dao.NewsDao;
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

public class NewsDaoImpl implements NewsDao {
    @Override
    public void add(News news) {
        Connection conn = DB.createConn();
        String sql = "insert into news values (null,?,?,?,?,?,?,?)";
        PreparedStatement pstm = DB.prepare(conn, sql);
        try {
            pstm.setString(1, news.getNtitle());
            pstm.setString(2, news.getNcont());
            pstm.setInt(3, news.getNtype());
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");//可以方便地修改日期格式
            String hehe = dateFormat.format(now);
            pstm.setString(4, hehe);
            pstm.setInt(5, news.getNview());
            pstm.setString(6, news.getWriter());
            pstm.setString(7, news.getImage());
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
        String sql = "delete from news where nid = " + id;
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
    public void update(News news) {
        Connection conn = DB.createConn();
        String sql = "update news set ntitle = ?,ncont = ?,ntype = ?,ndate = ?,nview = ?,writer = ?,image = ? where nid = ?";
        PreparedStatement pstm = DB.prepare(conn, sql);
        try {
            pstm.setString(1, news.getNtitle());
            pstm.setString(2, news.getNcont());
            pstm.setInt(3, news.getNtype());
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");//可以方便地修改日期格式
            String hehe = dateFormat.format(now);
            pstm.setString(4, hehe);
            pstm.setInt(5, news.getNview());
            pstm.setString(6, news.getWriter());
            pstm.setString(7, news.getImage());
            pstm.setInt(8, news.getNid());
            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.close(pstm);
        DB.close(conn);
    }

    @Override
    public List<News> query() {
        Connection conn = DB.createConn();
        String sql = "select * from news";
        PreparedStatement ps = DB.prepare(conn, sql);
        List<News> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            News data = null;
            while (rs.next()) {
                data = new News();
                data.setNtype(rs.getInt("ntype"));
                data.setNid(rs.getInt("nid"));
                data.setNtitle(rs.getString("ntitle"));
                data.setNcont(rs.getString("ncont"));
                data.setNdate(rs.getString("ndate"));
                data.setNview(rs.getInt("nview"));
                data.setWriter(rs.getString("writer"));
                data.setImage(rs.getString("image"));
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
    public News getNews(int id) {
        Connection conn = DB.createConn();
        String sql = "select * from news where nid = " + id;
        PreparedStatement ps = DB.prepare(conn, sql);
        News data = null;
        try {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                data = new News();
                data.setNtype(rs.getInt("ntype"));
                data.setNid(rs.getInt("nid"));
                data.setNtitle(rs.getString("ntitle"));
                data.setNcont(rs.getString("ncont"));
                data.setNdate(rs.getString("ndate"));
                data.setNview(rs.getInt("nview"));
                data.setWriter(rs.getString("writer"));
                data.setImage(rs.getString("image"));
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
    public List<News> queryByName(int id) {
        Connection conn = DB.createConn();
        String sql = "select * from news where ntype = "+id;
        PreparedStatement ps = DB.prepare(conn, sql);
        List<News> listss = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            News data1 = null;
            while (rs.next()) {
                data1 = new News();
                data1.setNid(rs.getInt("nid"));
                data1.setNtitle(rs.getString("ntitle"));
                data1.setNcont(rs.getString("ncont"));
                data1.setNtype(rs.getInt("ntype"));
                data1.setNdate(rs.getString("ndate"));
                data1.setNview(rs.getInt("nview"));
                data1.setWriter(rs.getString("writer"));
                data1.setImage(rs.getString("image"));
                listss.add(data1);
            }
            DB.close(rs);
            DB.close(ps);
            DB.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listss;
    }

    @Override
    public void addView(int id) {
        Connection conn = DB.createConn();
        String sql = "update news set nview = nview+1 where nid = "+id;
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
    public Pager<News> fenYe(int pageNum, int pageSize) {
        List<News> listP = query();
        Pager<News> pager = new Pager<News>(pageNum,pageSize,listP);
        return pager;
    }

    @Override
    public Pager<News> fenYe2(int id, int pageNum, int pageSize) {
        List<News> listQ = queryByName(id);
        Pager<News> pager = new Pager<News>(pageNum,pageSize,listQ);
        return pager;

    }
}
