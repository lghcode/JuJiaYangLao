<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>居家养老服务平台</title>
    <link rel="stylesheet" href="css/second.css"/>
    <link rel="stylesheet" href="css/validate.css">
    <style>
        .jianYan{
            width: 55%;
            margin: 0 auto;
            margin-top: 15px;
        }
        .jianYan span{
           font-size: 15px;
            color: #0a63ab;
            margin-bottom: 20px;
        }
        .jianYan input{
            width: 180px;
            height: 26px;
            border: 1px solid #0a63ab;
            margin-bottom: 20px;
        }
        .jianYan textarea{
            width: 250px;
            border: 1px solid #0a63ab;
        }
        #sb{
            width: 60px;
            height: 25px;
            color: #fff;
            font-size: 14px;
            text-align: center;
            line-height: 25px;
            background-color: #0a63ab;
            margin-top: 20px;
            cursor: pointer;
        }
    </style>
</head>
<body style="width:100%;height:100%">
<div class="logo">
    <img src="image/logo.png" alt="">
    <h3>居家养老服务平台</h3>
</div>
<%@include file="nav.jsp"%>
<div class="contains">
    <div class="name">
        建言献策
        <p></p>
    </div>
    <div class="wen" style="border: 1px solid #e7e1f1;height: 400px">
        <div class="weizhi">当前位置：首页><span>建言献策</span></div>
        <form action="${pageContext.request.contextPath}/Advice-save.action" class="jianYan">
            <span>姓名：</span> <input type="text" name="advice.adname" datatype="s2-5" errormsg="请输入姓名"/> <br/>
            <span>电话：</span> <input type="text" name="advice.adphone" datatype="m" errormsg="请输入11位手机号码"/> <br/>
            <span>邮箱：</span> <input type="email" name="advice.admail"/> <br/>
            <span>内容：</span> <textarea name="advice.adcont" id="" cols="." rows="10" datatype="s10-200" errormsg="请输入建议内容大于10个字"></textarea> <br/>
            <input type="submit" value="提交" id="sb"/>
        </form>
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
<script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<script src="js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".jianYan").Validform();
    })
</script>
</html>