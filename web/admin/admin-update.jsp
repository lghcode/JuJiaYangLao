<%--
  Created by IntelliJ IDEA.
  User: lgh
  Date: 2018/7/8
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加管理员</title>
    <link rel="stylesheet" href="../css/validate.css">

    <style>
        form{
            width: 80%;
            margin-left: 19%;
        }
        table{
            width: 100%;
        }
        table tr{
            width: 100%;

        }
        table tr td{
            padding-top: 16px;
        }
        form table tr td:nth-child(1){
            color: #555555;
            font-size: 14px;
            padding-right: 3%;
            text-align: right;

            width: 15%;
        }
        form table tr input{
            width: 98%;
            height: 26px;
            border: 1px solid #DDDDDD;
        }
        form table tr select{
            width: 20%;
            height: 26px;
            border: 1px solid #DDDDDD;
        }
        form table tr td span{
            color: red;
        }
        #sub{
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
    </style>
</head>
<body>
<form class="vali_form" action="${pageContext.request.contextPath}/Account-update.action" method="post">
    <table>
        <input type="hidden" name="account.aid" value="${requestScope.account.aid}">
        <tr><td><span>*</span>管理员:</td> <td><input datatype="*" errormsg="请输入管理员账号" type="text" name="account.alogin" value="${requestScope.account.alogin}"/></td></tr>
        <tr><td><span>*</span>密码:</td> <td><input class="userpassword" datatype="*" nullmsg="请设置密码！" errormsg="请设置密码！" type="password" name="account.apwd" value="${requestScope.account.apwd}"/></td></tr>
        <tr><td><span>*</span>确认密码:</td> <td><input datatype="*" class="userpassword2" recheck="account.apwd" nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！"  type="password"/></td></tr>
        <tr><td><span>*</span>真实名字:</td> <td><input datatype="s2-5" errormsg="请输入姓名" type="text" name="account.areal" value="${requestScope.account.areal}"/></td></tr>
        <tr><td><span>*</span>手机:</td> <td><input datatype="m" errormsg="请输入手机号码" type="tel" name="account.aphone" value="${requestScope.account.aphone}"/></td></tr>
        <tr><td><span>*</span>邮箱:</td><td><input datatype="*" errormsg="请输入邮箱" type="email" name="account.aemail" value="${requestScope.account.aemail}"/></td></tr>
        <tr><td><span>*</span>角色:</td>
            <%--将request中的btype数据放到input中--%>
            <input type="hidden" id="input_btype" value="${requestScope.account.arank}">
            <td><select name="account.arank" datatype="*" errormsg="请选择角色" id="select_id" value="${requestScope.account.arank}">

            <option value="3">请选择</option>
            <option value="0">超级管理员</option>
            <option value="1">编辑</option>
        </select></td></tr>
        <tr>
            <td></td>
            <td><input type="submit" value="提交" id="sub"/></td>

        </tr>
    </table>
</form>
</body>
<script src="lib/jquery/1.9.1/jquery.js"></script>
<script src="../js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".vali_form").Validform();
    });
    /**
     * 选中数据库中的选项
     */
    $("#select_id option[value='" + $("#input_btype").val() + "']").attr("selected", "selected");
</script>

</html>