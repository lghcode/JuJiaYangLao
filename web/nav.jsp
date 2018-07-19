<%--
  Created by IntelliJ IDEA.
  User: lgh
  Date: 2018/7/12
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/iconfont/iconfont.css">
<div class="nav">
    <ul>
        <li><a href="index.jsp">网站首页</a></li>
        <li><a href="fuWu.html" id="fw">服务项目</a></li>
        <li><a href="News-queryByType.action?news.ntype=1&pageNum=1">新闻资讯</a></li>
        <li><a href="liaoJie.jsp">了解我们</a></li>
        <li><a href="jianYan.jsp">建言献策</a></li>
        <li><a href="News-queryByType.action?news.ntype=3&pageNum=1">政策法规</a></li>
        <li><a href="older.jsp">老人登记</a></li>
        <li><a href="News-queryByType.action?news.ntype=4&pageNum=1">服务制度</a></li>
    </ul>
</div>
<%--<div class="fuWu">--%>
    <%--<a href="${pageContext.request.contextPath}/Business-queryByName.action?business.btype=1&pageNum=1">&#xe61c;养老家政</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=2&pageNum=1" class="iconfont">&#xe62c;房屋维修</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=3&pageNum=1" class="iconfont">&#xe684;家电维修</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=4&pageNum=1" class="iconfont">&#xe871;家庭用餐</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=5&pageNum=1" class="iconfont">&#xe62b;家庭购物</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=6&pageNum=1" class="iconfont">&#xe75a;法律资讯</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=7&pageNum=1" class="iconfont">&#xe6c6;开锁服务</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=8&pageNum=1" class="iconfont">&#xe603;家庭旅游</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=9&pageNum=1" class="iconfont">&#xe6d8;医疗服务</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=10&pageNum=1" class="iconfont">&#xe600;休闲健身</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=11&pageNum=1" class="iconfont">&#xe6cb;保险金融</a>--%>
    <%--<a href="Business-queryByName.action?business.btype=12&pageNum=1" class="iconfont">&#xe74c;丧葬服务</a>--%>
<%--</div>--%>

<%--<a href="index.jsp?id=(8-1)">sfsf</a>--%>
<script src="js/jquery-1.11.0.min.js"></script>
<script>

    $("#fw").mouseenter(function(){
        $(".fuWu").css("display","block");
    });
    $(".fuWu").mouseleave(function(){
        $(this).css("display","none");
    });


</script>