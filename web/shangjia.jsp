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
        加盟企业
        <p></p>
    </div>
    <a href="${pageContext.request.contextPath}/orderFrom.jsp?name=${requestScope.bs.bname}"  target="_blank" id="Code">商家二维码</a>
    <%--<form action="${pageContext.request.contextPath}/orderFrom.jsp" method="post">--%>
        <%--<input type="hidden" name="name" value="${requestScope.bs.bname}">--%>
        <%--<input type="submit" value="商家二维码" id="Code">--%>
    <%--</form>--%>
    <div class="wen">
        <div class="weizhi">当前位置：首页><span>加盟企业</span>><span>${requestScope.bs.bname}</span></div>
        <h3 align="center" style="margin-top: 20px">居家养老平台加盟企业基本信息</h3>
        <table border="1" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td>单位名称</td>
                <td colspan="2">${requestScope.bs.bname}</td>
                <td>法人姓名</td>
                <td colspan="2">${requestScope.bs.blegal}</td>
            </tr>
            <tr>
                <td>详细地址</td>
                <td colspan="5">${requestScope.bs.badress}</td>
            </tr>
            <tr>
                <td>注册时间</td>
                <td>${requestScope.bs.bdate}</td>
                <td>组织机构代码</td>
                <td>${requestScope.bs.bcode}</td>
                <td>员工人数</td>
                <td>${requestScope.bs.bmeber}</td>
            </tr>
            <tr>
                <td>业务负责人姓名</td>
                <td>${requestScope.bs.byewu}</td>
                <td>业务联系电话</td>
                <td colspan="3">${requestScope.bs.bphone}</td>
            </tr>
            <tr>
                <td>目前服务内容</td>
                <td colspan="5">${requestScope.bs.bcont}</td>
            </tr>
        </table>
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
</body>
</html>