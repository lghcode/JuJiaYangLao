<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>消费统计</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 二维码管理 <span class="c-gray en">&gt;</span> 消费统计 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<form action="${pageContext.request.contextPath}/Oform-searchOname.action" method="post" style="display: inline-block;margin-left: 1%">
		<input type="text" class="input-text" style="width:250px" placeholder="输入会员名"  name="oform.oname">
		<button type="submit" class="btn btn-success" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</form>
		<form action="${pageContext.request.contextPath}/Oform-searchBname.action" method="post" style="display: inline-block;margin-left: 1%">
			<input type="text" class="input-text" style="width:250px" placeholder="输入商家名"  name="oform.bname">
			<button type="submit" class="btn btn-success" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span><a href="${pageContext.request.contextPath}/Oform-excel.action"  class="btn btn-success radius"><i class="Hui-iconfont">&#xe644;</i> 导出表格</a></span>
        <span class="r">共有数据：<strong>
		<c:if test="${requestScope.result!=null}">
			${requestScope.result.totalRecord}
		</c:if>
        <c:if test="${requestScope.huiyuan!=null}">
			${fn:length(requestScope.huiyuan)}
		</c:if>
	</strong> 条</span> </div>
	<c:if test="${requestScope.result!=null}">
		<form action="${pageContext.request.contextPath}/Oform-dels.action" method="post" id="for1">
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">消费列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="70">会员号</th>
				<th width="110">会员姓名</th>
				<th width="110">消费金额</th>
				<th width="150">所属商家</th>
				<th>消费时间</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${requestScope.result.dataList}" var="code" varStatus="num">
			<tr class="text-c">
				<td><input type="checkbox" value="${code.fid}" name="ids"></td>
				<td>${code.oid}</td>
				<td>${code.oname}</td>
				<td>${code.money}</td>
				<td>${code.bname}</td>
				<td>${code.time}</td>
				<td class="td-manage"><a title="删除" href="javascript:;" onclick="admin_del(this,${code.fid})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		</form>
	</c:if>
	<c:if test="${requestScope.huiyuan!=null}">
		<form action="${pageContext.request.contextPath}/Oform-dels.action" method="post" id="for1">
			<table class="table table-border table-bordered table-bg">
				<thead>
				<tr>
					<th scope="col" colspan="9">消费列表</th>
				</tr>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="70">会员号</th>
					<th width="110">会员姓名</th>
					<th width="110">消费金额</th>
					<th width="150">所属商家</th>
					<th>消费时间</th>
					<th width="100">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${requestScope.huiyuan}" var="code" varStatus="num">
					<tr class="text-c">
						<td><input type="checkbox" value="${code.fid}" name="ids"></td>
						<td>${code.oid}</td>
						<td>${code.oname}</td>
						<td>${code.money}</td>
						<td>${code.bname}</td>
						<td>${code.time}</td>
						<td class="td-manage"><a title="删除" href="javascript:;" onclick="admin_del(this,${code.fid})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</form>
	</c:if>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/laypage/1.2/laypage.js"></script>
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
            submitForm("${pageContext.request.contextPath}/Oform-query.action?pageNum="+(currentPage+1));
            return true;
        }
    }

    // 上一页
    function previousPage(){
        if(currentPage == 1){
            alert("已经是第一页数据");
            return false;
        }else{
            submitForm("${pageContext.request.contextPath}/Oform-query.action?pageNum="+(currentPage-1));
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
    /*批量删除*/
    function datadel() {
        var form = document.getElementById("for1");
        form.submit();
    }
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'Oform-delete.action',
			data:'oform.fid='+id,
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

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!', {icon: 6,time:1000});
	});
}
</script>
</body>
</html>