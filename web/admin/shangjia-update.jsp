<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>添加商家</title>
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
<form action="${pageContext.request.contextPath}/Business-update.action" method="post">
    <table>
        <input type="hidden" name="business.bid" value="${requestScope.business.bid}">
        <tr>
            <td><span>*</span>单位名称:</td>
            <td><input type="text" name="business.bname" value="${requestScope.business.bname}"/></td>
            <td><span>*</span>法人姓名:</td>
            <td><input type="text" name="business.blegal" value="${requestScope.business.blegal}"/></td>
        </tr>
        <tr>
            <td><span>*</span>组织机构代码:</td>
            <td><input type="text" name="business.bcode" value="${requestScope.business.bcode}"/></td>
            <td><span>*</span>员工人数:</td>
            <td><input type="text" name="business.bmeber" value="${requestScope.business.bmeber}"/></td>
        </tr>
        <tr>
            <td><span>*</span>业务负责人姓名:</td>
            <td><input type="text" name="business.byewu" value="${requestScope.business.byewu}"/></td>
            <td><span>*</span>业务联系电话:</td>
            <td><input type="text" name="business.bphone" value="${requestScope.business.bphone}"/></td>
        </tr>
        <tr>
            <td><span>*</span>经营内容:</td>
            <td><input type="text" name="business.bcont" value="${requestScope.business.bcont}"/></td>
            <td><span>*</span>服务类型:</td>
            <%--将request中的btype数据放到input中--%>
            <input type="hidden" id="input_btype" value="${requestScope.business.btype}">
            <td>
                <select name="business.btype" id="select_id">
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
            <td colspan="3"><input type="text" name="business.badress" value="${requestScope.business.badress}"/></td>
        </tr>
        <tr>
            <td><span>*</span>注册时间:</td>
            <td colspan="3"><input type="text" name="business.bdate" value="${requestScope.business.bdate}"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="提交" id="sub"/></td>
            <td colspan="2"><input type="submit" value="取消" id="res"/></td>
        </tr>
    </table>

</form>
</body>
<script src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.js"></script>
<script>
    /**
     * 选中数据库中的选项
     */
    $("#select_id option[value='" + $("#input_btype").val() + "']").attr("selected", "selected");
</script>
</html>