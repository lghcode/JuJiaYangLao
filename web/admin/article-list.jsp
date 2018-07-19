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
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/respond.min.js"></script>
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
<title>资讯列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 资讯管理 <span class="c-gray en">&gt;</span> 资讯列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
	  日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" name=""  placeholder=" 资讯名称" style="width:250px" class="input-text">
		<button name=""  class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜资讯</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" data-title="添加资讯" data-href="article-add.jsp" onclick="Hui_admin_tab(this)" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加资讯</a></span> <span class="r">共有数据：<strong>${requestScope.result.totalRecord}</strong> 条</span> </div>
	<div class="mt-20">
		<c:if test="${requestScope.result.dataList!=null}">
			<form id="for1" action="${pageContext.request.contextPath}/News-dels.action" method="post">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th>标题</th>
					<th width="80">分类</th>
					<th width="80">来源</th>
					<th width="120">更新时间</th>
					<th width="75">浏览次数</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.result.dataList}" var="news" varStatus="num">
				<tr class="text-c">
					<td><input type="checkbox" value="${news.nid}" name="ids"></td>
					<td>${news.nid}</td>
					<td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','News-get1.action?news.nid='+${news.nid},'10001')" title="查看">${news.ntitle}</u></td>
					<td>
						<c:if test="${news.ntype==1}">
							新闻资讯
						</c:if>
						<c:if test="${news.ntype==2}">
							网站公告
						</c:if>
						<c:if test="${news.ntype==3}">
							政策法规
						</c:if>
						<c:if test="${news.ntype==4}">
							服务制度
						</c:if>
					</td>
					<td>${news.writer}</td>
					<td>${news.ndate}</td>
					<td>${news.nview}</td>
					<td class="f-14 td-manage"> <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','News-get.action?news.nid='+${news.nid},'10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,${news.nid})" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
			</form>
		</c:if>
	</div>
	<span style="color: #666666;margin-top: 10px;display:inline-block">显示 ${requestScope.result.currentPage} / ${requestScope.result.totalPage}，共 ${requestScope.result.totalPage} 页</span>
	<div class="lghqw">
		<a href="javascript:void(0)" onclick="previousPage()">上一页</a>
		<a href="javascript:void(0)" id="pageNum">${requestScope.result.currentPage}</a>
		<a href="javascript:void(0)" onclick="nextPage()">下一页</a>
	</div>
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
            submitForm("${pageContext.request.contextPath}/News-query.action?pageNum="+(currentPage+1));
            return true;
        }
    }

    // 上一页
    function previousPage(){
        if(currentPage == 1){
            alert("已经是第一页数据");
            return false;
        }else{
            submitForm("${pageContext.request.contextPath}/News-query.action?pageNum="+(currentPage-1));
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
/*资讯-添加*/
function article_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'News-delete.action',
			data:'news.nid='+id,
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