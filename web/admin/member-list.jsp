<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<%--日期范围：--%>
		<%--<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">--%>
		<%-----%>
		<%--<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">--%>
			<form action="${pageContext.request.contextPath}/Older-search.action" method="post">
		<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称" id="" name="older.oname">
		<button type="submit" class="btn btn-success radius"  name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
			</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加用户','member-add.html','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span> <span class="r">共有数据：<strong>
		<c:if test="${requestScope.result!=null}">
			${requestScope.result.totalRecord}
		</c:if>
        <c:if test="${requestScope.olders!=null}">
			${fn:length(requestScope.olders)}
		</c:if>
	</strong> 条</span> </div>
	<div class="mt-20">
	<c:if test="${requestScope.result!=null}">
		<form action="${pageContext.request.contextPath}/Older-dels.action" method="post" id="for1">
			<table class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th width="100">用户名</th>
					<th width="40">性别</th>
					<th width="90">手机</th>
					<th width="150">身份证号</th>
					<th width="">居住地区</th>
					<th width="130">出生日期</th>
					<th width="70">状态</th>
					<th width="100">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${requestScope.result.dataList}" var="older" varStatus="num">
					<tr class="text-c">
						<td><input type="checkbox" value="${older.oid}" name="ids"></td>
						<td>${num.count}</td>
						<td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','Older-show1.action?older.oid='+${older.oid},'10001','360','400')">${older.oname}</u></td>
						<td>${older.osex}</td>
						<td>${older.ophone}</td>
						<td>${older.onumber}</td>
						<td class="text-l">${older.ozone}-${older.otown}</td>
						<td>${older.obirth}</td>
						<td class="td-status">
							<c:if test="${older.ostaut==false}">
								<span class="label label-defaunt radius">待审核</span>
							</c:if>
							<c:if test="${older.ostaut==true}">
								<span class="label label-success radius">已通过</span>
							</c:if>
						</td>
						<td class="td-manage">
							<c:if test="${older.ostaut==false}">
								<a style="text-decoration:none" onClick="member_start(this,${older.oid})" href="javascript:;" title="待审核"><i class="Hui-iconfont">&#xe6e0;</i></a>
							</c:if>
							<a title="编辑" href="javascript:;" onclick="member_edit('编辑','Older-get.action?older.oid='+${older.oid},'4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  <a title="删除" href="javascript:;" onclick="member_del(this,${older.oid})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</form>
	</c:if>
		<c:if test="${requestScope.olders!=null}">
			<form action="${pageContext.request.contextPath}/Older-dels.action" method="post" id="for1">
				<table class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="80">ID</th>
						<th width="100">用户名</th>
						<th width="40">性别</th>
						<th width="90">手机</th>
						<th width="150">身份证号</th>
						<th width="">居住地区</th>
						<th width="130">出生日期</th>
						<th width="70">状态</th>
						<th width="100">操作</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${requestScope.olders}" var="older" varStatus="num">
						<tr class="text-c">
							<td><input type="checkbox" value="${older.oid}" name="ids"></td>
							<td>${num.count}</td>
							<td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','Older-show1.action?older.oid='+${older.oid},'10001','360','400')">${older.oname}</u></td>
							<td>${older.osex}</td>
							<td>${older.ophone}</td>
							<td>${older.onumber}</td>
							<td class="text-l">${older.ozone}-${older.otown}</td>
							<td>${older.obirth}</td>
							<td class="td-status">
								<c:if test="${older.ostaut==false}">
									<span class="label label-defaunt radius">待审核</span>
								</c:if>
								<c:if test="${older.ostaut==true}">
									<span class="label label-success radius">已通过</span>
								</c:if>
							</td>
							<td class="td-manage">
								<c:if test="${older.ostaut==false}">
									<a style="text-decoration:none" onClick="member_start(this,${older.oid})" href="javascript:;" title="待审核"><i class="Hui-iconfont">&#xe6e0;</i></a>
								</c:if>
								<a title="编辑" href="javascript:;" onclick="member_edit('编辑','Older-get.action?older.oid='+${older.oid},'4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  <a title="删除" href="javascript:;" onclick="member_del(this,${older.oid})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</form>
		</c:if>
	</div>
	<c:if test="${requestScope.result!=null}">
	<span style="color: #666666;margin-top: 10px;display:inline-block">显示 ${requestScope.result.currentPage} / ${requestScope.result.totalPage}，共 ${requestScope.result.totalPage} 页</span>
	<div class="lghqw">
		<a href="javascript:void(0)" onclick="previousPage()">上一页</a>
		<a href="javascript:void(0)" id="pageNum">${requestScope.result.currentPage}</a>
		<a href="javascript:void(0)" onclick="nextPage()">下一页</a>
	</div>
	</c:if>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
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
            submitForm("${pageContext.request.contextPath}/sublist/SublistServlet?pageNum=1");
            return true;
        }
    }

    // 下一页
    function nextPage(){
        if(currentPage == totalPage){
            alert("已经是最后一页数据");
            return false;
        }else{
            submitForm("${pageContext.request.contextPath}/Older-query.action?pageNum="+(currentPage+1));
            return true;
        }
    }

    // 上一页
    function previousPage(){
        if(currentPage == 1){
            alert("已经是第一页数据");
            return false;
        }else{
            submitForm("${pageContext.request.contextPath}/Older-query.action?pageNum="+(currentPage-1));
            return true;
        }
    }

    // 尾页
    function lastPage(){
        if(currentPage == totalPage){
            alert("已经是最后一页数据");
            return false;
        }else{
            <%--submitForm("<%=context %>/sublist/SublistServlet?pageNum=${result.totalPage}");--%>
            return true;
        }
    }
    /*
     * 在初次加载时默认选择全部
     */
</script>
<script type="text/javascript">
	function datadel() {
		var form = document.getElementById("for1");
		form.submit();
    }
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-审核通过*/
function member_start(obj,id){
	layer.confirm('确认审核通过吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'Older-shenHe.action',
			data:'older.oid='+id,
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage a:nth-child(1)").remove();
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已通过</span>');
				$(obj).remove();
				layer.msg('已通过审核!',{icon: 6,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}


// function member_stop(obj,id){
// 	layer.confirm('确认要停用吗？',function(index){
// 		$.ajax({
// 			type: 'POST',
// 			url: 'Older-shenHe.action',
//             data:'older.oid='+id,
// 			dataType: 'json',
// 			success: function(data){
// 				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="待审核"><i class="Hui-iconfont">&#xe6e0;</i></a>');
// 				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
// 				$(obj).remove();
// 				layer.msg('已停用!',{icon: 5,time:1000});
// 			},
// 			error:function(data) {
// 				console.log(data.msg);
// 			},
// 		});
// 	});
// }
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'Older-delete.action',
			data:'older.oid='+id,
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script> 
</body>
</html>