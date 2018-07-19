<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>商家加盟入口</title>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/older.css"/>
    <link rel="stylesheet" href="css/laydate.css">
    <link rel="stylesheet" href="css/validate.css">
    <script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
    <script src="js/laydate.js"></script>
    <style>
        form {
    width: 82%;
    margin: 0 auto;
    }

    form table {
    width: 100%;
    }

    form table tr td {
    padding-top: 3%;
    }

    form table tr td:nth-child(odd) {
    font-size: 14px;
    color: #555555;
    text-align: right;
    }

    form table span {
    color: red;
    }

    form table tr td input, select {
    width: 100%;
    height: 26px;
    border: 1px solid #DDDDDD;
    }

    #sub {
        width: 70px;
    height: 30px;
    border-radius: 3px;
    background-color: #5a98de;
    color: #fff;
    border: none;
    text-align: center;
    line-height: 30px;
    cursor: pointer;
    }

    #res {
    width: 70px;
    height: 30px;
    border-radius: 3px;
    color: #333333;
    background-color: #e6e6e6;
    border: none;
    text-align: center;
    line-height: 30px;
    cursor: pointer;
    }
    </style>
</head>
<body>
<div class="logo">
    <img src="image/logo.png" alt="">
    <h3>商家加盟入口</h3>
</div>
<%@include file="nav.jsp"%>
<form class="vali_form" action="${pageContext.request.contextPath}/Business-save.action" method="post">
    <table>
        <tr>
            <td><span>*</span>单位名称:</td>
            <td><input datatype="*" errormsg="请输入单位名称" type="text" name="business.bname"/></td>
            <td><span>*</span>法人姓名:</td>
            <td><input datatype="s2-5" errormsg="请输入法人姓名" type="text" name="business.blegal"/></td>
        </tr>
        <tr>
            <td><span>*</span>组织机构代码:</td>
            <td><input datatype="*" errormsg="请输入组织机构代码" type="text" name="business.bcode"/></td>
            <td><span>*</span>员工人数:</td>
            <td><input datatype="n" errormsg="请输入员工人数" type="text" name="business.bmeber"/></td>
        </tr>
        <tr>
            <td><span>*</span>业务负责人姓名:</td>
            <td><input datatype="s2-5" errormsg="请输入业务负责人姓名" type="text" name="business.byewu"/></td>
            <td><span>*</span>业务联系电话:</td>
            <td><input datatype="m" errormsg="请输入业务联系电话" type="text" name="business.bphone"/></td>
        </tr>
        <tr>
            <td><span>*</span>经营内容:</td>
            <td><input datatype="*" errormsg="请输入经营内容" type="text" name="business.bcont"/></td>
            <td><span>*</span>服务类型:</td>
            <td>
                <select datatype="*" errormsg="请选择服务类型" name="business.btype" id="">
                    <option value="0">请选择</option>
                    <option value="1">养老家政</option>
                    <option value="2">房屋维修</option>
                    <option value="3">家电维修</option>
                    <option value="4">家庭用餐</option>
                    <option value="5">家庭购物</option>
                    <option value="6">法律咨询</option>
                    <option value="7">开锁服务</option>
                    <option value="8">家庭旅游</option>
                    <option value="9">医疗服务</option>
                    <option value="10">休闲健身</option>
                    <option value="11">保险金融</option>
                    <option value="12">丧葬服务</option>
                    <option value="13">婚姻介绍</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><span>*</span>详细地址:</td>
            <td colspan="3"><input datatype="*" errormsg="请输入详细地址" type="text" name="business.badress"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="提交" id="sub"/></td>
            <td colspan="2"><input type="submit" value="取消" id="res"/></td>
        </tr>
    </table>

</form>
<div class="foot">
    <ul>
        <li>版权所有&copy;抚州福康安居家养老有限公司</li>
        <li>备案号：赣ICP备16277471</li>
        <li>技术支持：lgh&gsj</li>
        <li>当前访问量:120次</li>
    </ul>
    <a href="${pageContext.request.contextPath}/admin/login.html">后台管理</a>
</div>
</body>
<script src="admin/lib/jquery/1.9.1/jquery.js"></script>
<script src="js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".vali_form").Validform();
    });
</script>
</html>