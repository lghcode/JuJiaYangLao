package cn.lgh.model;

public class News {
    private int nid;
    private String ntitle;
    private String ncont;
    private int ntype;
    private String ndate;
    private int nview = 0;
    private String writer;
    private String image;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public String getNtitle() {
        return ntitle;
    }

    public void setNtitle(String ntitle) {
        this.ntitle = ntitle;
    }

    public String getNcont() {
        return ncont;
    }

    public void setNcont(String ncont) {
        this.ncont = ncont;
    }

    public int getNtype() {
        return ntype;
    }

    public void setNtype(int ntype) {
        this.ntype = ntype;
    }

    public String getNdate() {
        return ndate;
    }

    public void setNdate(String ndate) {
        this.ndate = ndate;
    }

    public int getNview() {
        return nview;
    }

    public void setNview(int nview) {
        this.nview = nview;
    }
}
