<%@ page import="cn.lgh.model.News" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.lgh.service.NewsService" %>
<%@ page import="cn.lgh.service.Impl.NewsServiceImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.lgh.service.BusinessService" %>
<%@ page import="cn.lgh.service.Impl.BusinessServiceImpl" %>
<%@ page import="cn.lgh.model.Business" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>居家养老服务平台</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/iconfont/iconfont.css"/>
</head>
<body style="width:100%;height:100%">
<div class="logo">
    <img src="image/logo.png" alt="">
    <h3>福康安居家养老服务平台</h3>
</div>
<%@include file="nav.jsp"%>
<div class="a-content">
        <div class="carousel-content">
            <ul class="carousel">
                <li><img src="image/pic1.png"></li>
                <li><img src="image/pic2.png"></li>
                <li><img src="image/pic3.png"></li>
                <li><img src="image/pic4.png"></li>
                <li><img src="image/pic5.png"></li>
            </ul>
            <ul class="img-index"></ul>
            <div class="carousel-prev"><img src="image/left1.png"></div>
            <div class="carousel-next"><img src="image/right1.png"></div>
        </div>
</div>
<div class="zhuce">
    <a class="older" href="older.jsp"><span class="iconfont">&#xe657;</span>老年人登记入口</a>
    <a class="shang" href="gongSi.jsp"><span class="iconfont">&#xe616;</span>商家加盟入口</a>
</div>
<div class="cont">
    <div class="wzgg">
        <div class="title">
            <span>|</span>
            <h3>网站公告</h3>
        </div>
        <ul class="news">
            <%
                NewsService newsService1 = new NewsServiceImpl();
                List<News> listS = newsService1.queryByName(2);
                List<News> lists = null;
                if (listS.size()>7){
                     lists = new ArrayList<News>();
                    for(int i = 0;i < 7;i ++){
                        lists.add(listS.get(listS.size()-1-i));
                    }
                }else{
                    lists = new ArrayList<News>();
                    for(int i = 0;i < listS.size();i ++){
                        lists.add(listS.get(listS.size()-1-i));
                    }
                }
                for(News e:lists){
            %>
                <li><a href="News-get2.action?news.nid=<%= e.getNid() %>"><%= e.getNtitle() %></a><span><%= e.getNdate() %></span></li>
            <%
                }
            %>
        </ul>
        <a href="News-queryByType.action?news.ntype=2&pageNum=1" class="more">更多</a>
    </div>
    <div class="wzgg xwzx">
        <div class="title">
            <span>|</span>
            <h3>新闻资讯</h3>
        </div>
        <ul class="news">
            <%
                NewsService newsService2 = new NewsServiceImpl();
                List<News> listS2 = newsService2.queryByName(1);
                List<News> lists2 = new ArrayList<News>();;
                if (listS2.size()>7){
                    for(int i = 0;i < 7;i ++){
                        lists2.add(listS2.get(listS2.size()-1-i));
                    }
                }else{
                    for(int i = 0;i < listS2.size();i ++){
                        lists2.add(listS2.get(listS2.size()-1-i));
                    }
                }
                for(News e:lists2){
            %>
            <li><a href="${pageContext.request.contextPath}/News-get2.action?news.nid=<%= e.getNid() %>"><%= e.getNtitle() %></a><span><%= e.getNdate() %></span></li>
            <%
                }
            %>
        </ul>
        <a href="${pageContext.request.contextPath}/News-queryByType.action?news.ntype=1&pageNum=1" class="more">更多</a>
    </div>
    <div class="wzgg sjzs">
        <div class="title">
            <span>|</span>
            <h3>商家展示</h3>
        </div>
        <%
            BusinessService businessService = new BusinessServiceImpl();
            List<Business> listB = businessService.query();
        %>
        <ul class="news shop" style="list-style-type: disc">
            <%
                for(int i = 0;i<7;i++){
            %>
            <li><a href="${pageContext.request.contextPath}/Business-get2.action?business.bid=<%=listB.get(i).getBid()%>"><%=listB.get(i).getBname()%></a></li>
            <%
                }
            %>
        </ul>
        <ul class="news shop" style="list-style-type: disc;margin-left: 45px">

            <%
                if (listB.size()>14){
                for(int j = 7;j<14;j++){
            %>
            <li><a href="${pageContext.request.contextPath}/Business-get2.action?business.bid=<%=listB.get(j).getBid()%>"><%=listB.get(j).getBname()%></a></li>
            <%
                    }
                }else if(listB.size()<=14){
                    for (int k = 7;k<listB.size();k++){
            %>
            <li><a href="${pageContext.request.contextPath}/Business-get2.action?business.bid=<%=listB.get(k).getBid()%>"><%=listB.get(k).getBname()%></a></li>
            <%
                    }
                }
            %>
        </ul>
        <a href="${pageContext.request.contextPath}/Business-query2.action?pageNum=1" class="more we">更多</a>
    </div>
    <div class="wzgg photo">
        <div class="title">
            <span>|</span>
            <h3>平台图展</h3>
        </div>
        <a href="image.jsp" class="ph">
            <img src="image/02.jpg" alt=""/>
        </a>
        <a href="image.jsp" class="more">更多</a>
    </div>
    <div class="wzgg zcfg">
        <div class="title">
            <span>|</span>
            <h3>政策法规</h3>
        </div>
        <ul class="news">
            <%
                NewsService newsService3 = new NewsServiceImpl();
                List<News> listS3 = newsService3.queryByName(3);
                List<News> lists3 = new ArrayList<News>();;
                if (listS3.size()>7){
                    for(int i = 0;i < 7;i ++){
                        lists3.add(listS3.get(listS3.size()-1-i));
                    }
                }else{
                    for(int i = 0;i < listS3.size();i ++){
                        lists3.add(listS3.get(listS3.size()-1-i));
                    }
                }
                for(News e:lists3){
            %>
            <li><a href="News-get2.action?news.nid=<%= e.getNid() %>"><%= e.getNtitle() %></a><span><%= e.getNdate() %></span></li>
            <%
                }
            %>
        </ul>
        <a href="News-queryByType.action?news.ntype=3&pageNum=1" class="more">更多</a>
    </div>
    <div class="wzgg fwzd">
        <div class="title">
            <span>|</span>
            <h3>服务制度</h3>
        </div>
        <ul class="news">
            <%
                NewsService newsService4 = new NewsServiceImpl();
                List<News> listS4 = newsService4.queryByName(4);
                List<News> lists4 = new ArrayList<News>();;
                if (listS4.size()>7){
                    for(int i = 0;i < 7;i ++){
                        lists4.add(listS4.get(listS4.size()-1-i));
                    }
                }else{
                    for(int i = 0;i < listS4.size();i ++){
                        lists4.add(listS4.get(listS4.size()-1-i));
                    }
                }
                for(News e:lists4){
            %>
            <li><a href="News-get2.action?news.nid=<%= e.getNid() %>"><%= e.getNtitle() %></a><span><%= e.getNdate() %></span></li>
            <%
                }
            %>
        </ul>
        <a href="News-queryByType.action?news.ntype=4&pageNum=1" class="more">更多</a>
    </div>
</div>
<div class="foot">
    <ul>
        <li>版权所有&copy;抚州福康安居家养老有限公司</li>
        <li>备案号：赣ICP备18009244号</li>
        <li>技术支持：lgh&gsj</li>
        <li>当前访问量:120次</li>
    </ul>
    <a href="${pageContext.request.contextPath}/admin/login.html">后台管理</a>
</div>
<script src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/carousel.js"></script>
<script type="text/javascript">
    $(function(){
        $(".carousel-content").carousel({
            carousel : ".carousel",//轮播图容器
            indexContainer : ".img-index",//下标容器
            prev : ".carousel-prev",//左按钮
            next : ".carousel-next",//右按钮
            timing : 3000,//自动播放间隔
            animateTime : 700,//动画时间
            autoPlay : true,//是否自动播放 true/false
            direction : "left"//滚动方向 right/left
        });

        $(".carousel-content").hover(function(){
            $(".carousel-prev,.carousel-next").fadeIn(300);
        },function(){
            $(".carousel-prev,.carousel-next").fadeOut(300);
        });

        $(".carousel-prev").hover(function(){
            $(this).find("img").attr("src","image/left2.png");
        },function(){
            $(this).find("img").attr("src","image/left1.png");
        });
        $(".carousel-next").hover(function(){
            $(this).find("img").attr("src","image/right2.png");
        },function(){
            $(this).find("img").attr("src","image/right1.png");
        });
    });
</script>
</body>
</html>