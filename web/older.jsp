<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>老年人登记</title>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/older.css"/>
    <link rel="stylesheet" href="css/laydate.css">
    <link rel="stylesheet" href="css/validate.css">
    <script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
    <script src="js/laydate.js"></script>

</head>
<body>
<div class="logo">
    <img src="image/logo.png" alt="">
    <h3>老年人登记</h3>
</div>
<%@include file="nav.jsp"%>
<form class="registerform" action="Older-save.action" method="post">
    <table>
        <tr>
            <th colspan="4" align="center">老年人登记表</th>
        </tr>
        <tr>
            <td>姓名：</td>
            <td><input type="text" class="ip" name="older.oname" datatype="s2-5" errormsg="请输入姓名"/></td>
            <td>性别：</td>
            <td>
                <span><input type="radio" name="older.osex" value="男" datatype="*" errormsg="请选择性别"/>男</span>
                <span><input type="radio" name="older.osex" value="女" datatype="*" errormsg="请选择性别"/>女</span>
            </td>
        </tr>
        <tr>
            <td>出生日期：</td>
            <td>
                <div class="laydate-box">
                    <input type="text" name="older.obirth" id="laydateInput" datatype="*" errormsg="请选择出生日期"/>
                    <div class="select-date">
                        <div class="select-date-header">
                            <ul class="heade-ul">
                                <li class="header-item header-item-one">
                                    <select name="" id="yearList"></select>
                                </li>
                                <li class="header-item header-item-two" onselectstart="return false">
                                    <select name="" id="monthList"></select>
                                </li>
                                <li class="header-item header-item-three" onselectstart="return false" >
                                    <span class="reback">回到今天</span>
                                </li>
                            </ul>
                        </div>
                        <div class="select-date-body">
                            <ul class="week-list">
                                <li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li>
                            </ul>
                            <ul class="day-tabel"></ul>
                        </div>
                    </div>
                </div>
            </td>
            <td>手机号码：</td>
            <td><input type="text" class="ip" name="older.ophone" datatype="m" errormsg="请输入11位手机号码"/></td>

        </tr>
        <tr>
            <td>居住地区：</td>
            <td><select name="older.ozone" id="adr" datatype="*" errormsg="请选择居住地区">
                <option value="临川区">临川区</option>
                <option value="东乡区">东乡区</option>
                <option value="南城县">南城县</option>
                <option value="黎川县">黎川县</option>
                <option value="南丰县">南丰县</option>
                <option value="崇仁县">崇仁县</option>
                <option value="乐安县">乐安县</option>
                <option value="宜黄县">宜黄县</option>
                <option value="金溪县">金溪县</option>
                <option value="资溪县">资溪县</option>
                <option value="广昌县">广昌县</option>
            </select></td>
            <td>街(乡、镇)：</td>
            <td><input type="text" class="ip" name="older.otown" datatype="*" errormsg="请输入地址"/></td>
        </tr>
        <tr>
            <td>详细地址：</td>
            <td colspan="3"><input type="text" class="ip" name="older.oaddress" datatype="*" errormsg="请输入详细地址"/></td>
        </tr>
        <tr>
            <td>居住情况：</td>
            <td>
                <span><input type="radio" name="older.ojuzhu" value="独自居住" datatype="*" errormsg="请选择居住情况"/>独自居住</span>
                <span><input type="radio" name="older.ojuzhu" value="与子女居住" datatype="*" errormsg="请选择居住情况"/>与子女居住</span>
            </td>
            <td>自理能力：</td>
            <td style="width: 23%;">
                <span><input type="radio" name="older.oself" value="健康完全自理" datatype="*" errormsg="请选择自理能力"/>健康完全自理</span>
                <span><input type="radio" name="older.oself" value="部分自理" datatype="*" errormsg="请选择自理能力"/>部分自理</span>
                <span><input type="radio" name="older.oself" value="不能自理" datatype="*" errormsg="请选择自理能力"/>不能自理</span>
            </td>
        </tr>
        <tr>
            <td>家属姓名：</td>
            <td><input type="text" class="ip" name="older.ojname" datatype="s2-5" errormsg="请输入姓名"/></td>
            <td>与家属关系：</td>
            <td><input type="text" class="ip" name="older.oguanxi" datatype="s2-10" errormsg="请输入家属关系"/></td>
        </tr>
        <tr>
            <td>联系电话：</td>
            <td><input type="text" class="ip" name="older.ojphone" datatype="*" errormsg="请输入联系电话"/></td>
            <td>老人身份证号：</td>
            <td><input type="text" class="ip" name="older.onumber" datatype="s18-18" errormsg="请输入身份证号码"/></td>
        </tr>
        <tr>
            <th align="center" colspan="4">
                <input type="submit" value="提交" id="sub"/>
            </th>
        </tr>
    </table>
</form>
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
<script src="js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".registerform").Validform();
    })
</script>

</html>