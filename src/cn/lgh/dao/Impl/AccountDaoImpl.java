package cn.lgh.dao.Impl;

import cn.lgh.dao.AccountDao;
import cn.lgh.model.Account;
import cn.lgh.util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDaoImpl implements AccountDao {
    @Override
    public void add(Account account) {
        Connection conn = DB.createConn();
        String sql = "insert into account values (null,?,?,?,?,?,?)";
        PreparedStatement pstm = DB.prepare(conn,sql);
        try {
            pstm.setString(1,account.getAlogin());
            pstm.setString(2,account.getApwd());
            pstm.setString(3,account.getAreal());
            pstm.setInt(4,account.getArank());
            pstm.setString(5,account.getAphone());
            pstm.setString(6,account.getAemail());
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
        String sql = "delete from account where aid = "+id;
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
    public void update(Account account) {
        Connection conn = DB.createConn();
        String sql = "update account set alogin = ?,apwd = ?,areal = ?,arank = ?,aphone = ?,aemail = ? where aid = ?";
        PreparedStatement pstm = DB.prepare(conn,sql);
        try {
            pstm.setString(1,account.getAlogin());
            pstm.setString(2,account.getApwd());
            pstm.setString(3,account.getAreal());
            pstm.setInt(4,account.getArank());
            pstm.setString(5,account.getAphone());
            pstm.setString(6,account.getAemail());
            pstm.setInt(7,account.getAid());
            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.close(pstm);
        DB.close(conn);
    }

    @Override
    public List<Account> query() {
        Connection conn = DB.createConn();
        String sql = "select * from account";
        PreparedStatement ps = DB.prepare(conn,sql);
        List<Account> lists = new ArrayList<>();
        try {
            ResultSet rs = ps.executeQuery();
            Account data = null;
            while (rs.next()){
                data = new Account();
                data.setAid(rs.getInt("aid"));
                data.setAlogin(rs.getString("alogin"));
                data.setApwd(rs.getString("apwd"));
                data.setAreal(rs.getString("areal"));
                data.setArank(rs.getInt("arank"));
                data.setAphone(rs.getString("aphone"));
                data.setAemail(rs.getString("aemail"));
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
    public Account getAccount(int id) {
        Connection conn = DB.createConn();
        String sql = "select * from account where aid = "+id;
        PreparedStatement ps = DB.prepare(conn,sql);
        Account data = null;
        try {
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                data = new Account();
                data.setAid(rs.getInt("aid"));
                data.setAlogin(rs.getString("alogin"));
                data.setApwd(rs.getString("apwd"));
                data.setAreal(rs.getString("areal"));
                data.setArank(rs.getInt("arank"));
                data.setAphone(rs.getString("aphone"));
                data.setAemail(rs.getString("aemail"));
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
    public Account getAccount(String str) {
        Connection conn = DB.createConn();
        String sql = "select * from account where alogin = '"+str+"'";
        PreparedStatement ps = DB.prepare(conn,sql);
        Account data = null;
        try {
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                data = new Account();
                data.setAid(rs.getInt("aid"));
                data.setAlogin(rs.getString("alogin"));
                data.setApwd(rs.getString("apwd"));
                data.setAreal(rs.getString("areal"));
                data.setAphone(rs.getString("aphone"));
                data.setArank(rs.getInt("arank"));
                data.setAemail(rs.getString("aemail"));
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
    public boolean login(String login, String pwd) {
        Connection conn = DB.createConn();
        String sql = "select * from account where alogin = ? and apwd = ?";
        PreparedStatement ps = DB.prepare(conn,sql);
        boolean m=false;
        try {
            ps.setString(1,login);
            ps.setString(2,pwd);
            ResultSet rs = ps.executeQuery();
            m = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(m==true){
            return true;
        }else{
           return false;
        }
    }
}
