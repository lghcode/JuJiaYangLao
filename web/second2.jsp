<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>居家养老服务平台</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/second.css"/>
    <link rel="stylesheet" href="css/three.css"/>
</head>
<%
    String num = request.getParameter("type");
    int type = Integer.parseInt(num);
%>
<body style="width:100%;height:100%">
<div class="logo">
    <img src="image/logo.png" alt="">
    <h3>居家养老服务平台</h3>
</div>
<%@include file="nav.jsp"%>
<div class="contains">
    <div class="name">
        加盟企业
        <p></p>
    </div>
    <div class="wen" style="height: 600px;border: 1px solid #0a63ab">
        <form action="${pageContext.request.contextPath}/Business-search.action" id="search">
            <input type="search" class="ser" placeholder="请输入商家名称" name="name"/>
            <input type="submit" value="搜索" class="sb"/>
        </form>
        <div class="weizhi">当前位置：首页><span>
           加盟企业
        </span></div>
        <ul class="biao">
            <c:forEach items="${requestScope.result.dataList}" var="bu">
            <li><a href="${pageContext.request.contextPath}/Business-get2.action?business.bid=${bu.bid}">${bu.bname}</a></li>
            </c:forEach>
        </ul>
        <form action="" method="post" id="for1"></form>
        <div class="fenYe">
            <a href="javascript:void(0)" onclick="firstPage()">首&nbsp;页</a>
            <a href="javascript:void(0)" onclick="previousPage()">上一页</a>
            <a href="javascript:void(0)" onclick="nextPage()">下一页</a>
            <a href="javascript:void(0)" onclick="lastPage()">尾&nbsp;页</a>
            <form action="${pageContext.request.contextPath}/Business-queryByName.action?business.btype=<%= type %>" method="post">
                <input type="submit" value="转&nbsp;到" class="zd"/>
                <input type="text" class="num" name="pageNum"/>页
            </form>
            <span class="ji">${requestScope.result.currentPage}/${requestScope.result.totalPage}</span>
            <span class="total">共${requestScope.result.totalRecord}条</span>
        </div>
    </div>
    <div class="clear"></div>
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
<script type="text/javascript">
    // 当前第几页数据
    var currentPage = ${requestScope.result.currentPage};
    // 总页数
    var totalPage = ${requestScope.result.totalPage};

    function submitForm(actionUrl){
        var formElement = document.getElementById("for1");
        formElement.action = actionUrl;
        formElement.submit();
    }

    // 第一页
    function firstPage(){
        if(currentPage == 1){
            alert("已经是第一页数据");
            return false;
        }else{
            submitForm("${pageContext.request.contextPath}/Business-queryByName.action?business.btype=<%= type %>&pageNum=1");
            return true;
        }
    }

    // 下一页
    function nextPage(){
        if(currentPage == totalPage){
            alert("已经是最后一页数据");
            return false;
        }else{
            submitForm("${pageContext.request.contextPath}/Business-queryByName.action?business.btype=<%= type %>&pageNum="+(currentPage+1));
            return true;
        }
    }

    // 上一页
    function previousPage(){
        if(currentPage == 1){
            alert("已经是第一页数据");
            return false;
        }else{
            submitForm("${pageContext.request.contextPath}/Business-queryByName.action?business.btype=<%= type %>&pageNum="+(currentPage-1));
            return true;
        }
    }

    // 尾页
    function lastPage(){
        if(currentPage == totalPage){
            alert("已经是最后一页数据");
            return false;
        }else{
            submitForm("${pageContext.request.contextPath}/Business-queryByName.action?business.btype=<%= type %>&pageNum="+${requestScope.result.totalPage});
            return true;
        }
    }
    /*
     * 在初次加载时默认选择全部
     */
</script>
</body>
</html>