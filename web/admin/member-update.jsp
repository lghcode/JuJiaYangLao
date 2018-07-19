<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<title>添加商家</title>
	<style>
		form{
			width: 82%;
			margin: 0 auto;
		}
		form table{
			width: 100%;
		}
		form table tr td{
			padding-top: 3%;
			font-size: 14px;
			color: #555555;
		}
		form table tr td:nth-child(odd){

			text-align: right;
		}
		form table span{
			color: red;
		}
		form table tr td input[type=text],select{
			width: 100%;
			height: 26px;
			border: 1px solid #DDDDDD;
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
		#res{
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
<form action="Older-update.action" method="post">
	<input type="hidden" name="older.oid" value="${requestScope.older.oid}">
	<table>
		<tr>
			<td><span>*</span>姓名:</td>
			<td><input type="text" name="older.oname" value="${requestScope.older.oname}"/></td>
			<td><span>*</span>性别:</td>
			<td>
				<input type="radio" value="男" name="older.osex" checked/>男  <input type="radio" value="女" name="older.osex"/>女
			</td>
		</tr>
		<tr>
			<td><span>*</span>出生日期:</td>
			<td><input type="text" name="older.obirth" value="${requestScope.older.obirth}"/></td>
			<td><span>*</span>手机号码:</td>
			<td><input type="text" name="older.ophone" value="${requestScope.older.ophone}"/></td>
		</tr>
		<tr>
			<td><span>*</span>身份账号码：</td>
			<td><input type="text" name="older.onumber" value="${requestScope.older.onumber}"/></td>
			<td><span>*</span>居住情况:</td>
			<td><input type="radio" value="独自居住" name="older.ojuzhu" checked/>独自居住  <input type="radio" value="与子女居住" name="older.ojuzhu"/>与子女居住</td>
		</tr>
		<tr>
			<td><span>*</span>居住地区:</td>
			<%--将request中的btype数据放到input中--%>
			<input type="hidden" id="input_btype" value="${requestScope.older.ozone}">
			<td>
				<select name="older.ozone" id="select_id" value="${requestScope.older.ozone}">
					<option value="0">请选择</option>
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
				</select>
			</td>
			<td><span>*</span>街(乡、镇):</td>
			<td><input type="text" name="older.otown" value="${requestScope.older.otown}"/></td>
		</tr>
		<tr>
			<td><span>*</span>详细地址:</td>
			<td colspan="3"><input type="text" name="older.oaddress" value="${requestScope.older.oaddress}"/></td>
		</tr>
		<tr>
			<td><span>*</span>自理能力:</td>
			<td>
				<input type="radio" value="完全自理" name="older.oself" checked/>完全自理  <input type="radio" value="部分自理" name="older.oself"/>部分自理  <input type="radio" value="不能自理" name="older.oself"/>不能自理
			</td>
			<td><span>*</span>家属姓名:</td>
			<td><input type="text" name="older.ojname" value="${requestScope.older.ojname}"/></td>
		</tr>
		<tr>
			<td><span>*</span>与家属关系:</td>
			<td><input type="text" name="older.oguanxi" value="${requestScope.older.oguanxi}"/></td>
			<td><span>*</span>联系电话:</td>
			<td><input type="text" name="older.ojphone" value="${requestScope.older.ojphone}"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="提交" id="sub"/></td>
			<td colspan="2"><input type="submit" value="取消" id="res"/></td>
		</tr>
	</table>

</form>
</body>
<script src="lib/jquery/1.9.1/jquery.js"></script>
<script>
    /**
     * 选中数据库中的选项
     */
    $("#select_id option[value='" + $("#input_btype").val() + "']").attr("selected", "selected");
</script>
</html>