package cn.lgh.model;

public class Advice {
    private int adid;

    public int getAdid() {
        return adid;
    }

    public void setAdid(int adid) {
        this.adid = adid;
    }

    public String getAdname() {
        return adname;
    }

    public void setAdname(String adname) {
        this.adname = adname;
    }

    public String getAdphone() {
        return adphone;
    }

    public void setAdphone(String adphone) {
        this.adphone = adphone;
    }

    public String getAdmail() {
        return admail;
    }

    public void setAdmail(String admail) {
        this.admail = admail;
    }

    public String getAdcont() {
        return adcont;
    }

    public void setAdcont(String adcont) {
        this.adcont = adcont;
    }

    private String adname;
    private String adphone;
    private String admail;
    private String adcont;
    private String adate;

    public String getAdate() {
        return adate;
    }

    public void setAdate(String adate) {
        this.adate = adate;
    }
}

