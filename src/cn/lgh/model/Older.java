package cn.lgh.model;

import java.sql.Date;

public class Older {
    private int oid;
    private String oname;
    private String osex;
    private Date obirth;
    private String ophone;
    private String ozone;
    private String otown;
    private String oaddress;
    private String ojuzhu;
    private String oself;
    private String ojname;
    private String onumber;
    private boolean ostaut = false;


    public boolean isOstaut() {
        return ostaut;
    }

    public void setOstaut(boolean ostaut) {
        this.ostaut = ostaut;
    }

    public String getOnumber() {
        return onumber;
    }

    public void setOnumber(String onumber) {
        this.onumber = onumber;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public String getOsex() {
        return osex;
    }

    public void setOsex(String osex) {
        this.osex = osex;
    }

    public Date getObirth() {
        return obirth;
    }

    public void setObirth(Date obirth) {
        this.obirth = obirth;
    }

    public String getOphone() {
        return ophone;
    }

    public void setOphone(String ophone) {
        this.ophone = ophone;
    }

    public String getOzone() {
        return ozone;
    }

    public void setOzone(String ozone) {
        this.ozone = ozone;
    }

    public String getOtown() {
        return otown;
    }

    public void setOtown(String otown) {
        this.otown = otown;
    }

    public String getOaddress() {
        return oaddress;
    }

    public void setOaddress(String oaddress) {
        this.oaddress = oaddress;
    }

    public String getOjuzhu() {
        return ojuzhu;
    }

    public void setOjuzhu(String ojuzhu) {
        this.ojuzhu = ojuzhu;
    }

    public String getOself() {
        return oself;
    }

    public void setOself(String oself) {
        this.oself = oself;
    }

    public String getOjname() {
        return ojname;
    }

    public void setOjname(String ojname) {
        this.ojname = ojname;
    }

    public String getOguanxi() {
        return oguanxi;
    }

    public void setOguanxi(String oguanxi) {
        this.oguanxi = oguanxi;
    }

    public String getOjphone() {
        return ojphone;
    }

    public void setOjphone(String ojphone) {
        this.ojphone = ojphone;
    }

    private String oguanxi;
    private String ojphone;
}
