<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>居家养老服务平台</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/second.css"/>
</head>
<body style="width:100%;height:100%">
<div class="logo">
    <img src="image/logo.png" alt="">
    <h3>居家养老服务平台</h3>
</div>
<%@include file="nav.jsp"%>
<div class="contains">
    <div class="name">
        <c:if test="${requestScope.news2.ntype==1}">
            新闻资讯
        </c:if>
        <c:if test="${requestScope.news2.ntype==2}">
            网站公告
        </c:if>
        <c:if test="${requestScope.news2.ntype==3}">
            政策法规
        </c:if>
        <c:if test="${requestScope.news2.ntype==4}">
            服务制度
        </c:if>
        <p></p>
    </div>
    <div class="wen">
        <div class="weizhi">当前位置：首页><span>
            <c:if test="${requestScope.news2.ntype==1}">
                新闻资讯
            </c:if>
        <c:if test="${requestScope.news2.ntype==2}">
            网站公告
        </c:if>
        <c:if test="${requestScope.news2.ntype==3}">
            政策法规
        </c:if>
        <c:if test="${requestScope.news2.ntype==4}">
            服务制度
        </c:if>
        </span></div>
        <h4>${requestScope.news2.ntitle}</h4>
        <span class="time">发布时间：<span>${requestScope.news2.ndate}</span></span>
        <span class="view1">浏览次数：<span>${requestScope.news2.nview}</span></span>
        <hr size="2" color="dimgray" width="93%" style="margin: 0 auto;margin-top: 10px"/>
        <div class="qe">
            ${requestScope.news2.ncont}
        </div>
    </div>
    <br style='clear:both'/>
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
</body>
</html>