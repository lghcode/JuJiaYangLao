
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/style.css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>商家管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商家中心 <span
        class="c-gray en">&gt;</span> 商家管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
        <%--日期范围：--%>
        <%--<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin"--%>
               <%--class="input-text Wdate" style="width:120px;">--%>
        <%-----%>
        <%--<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax"--%>
               <%--class="input-text Wdate" style="width:120px;">--%>
            <form action="${pageContext.request.contextPath}/Business-search.action" method="post">
                <input type="hidden" name="search" value="2">
        <input type="text" class="input-text" style="width:250px" placeholder="输入商家名称" id="" name="name">
        <button type="submit" class="btn btn-success radius" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
            </form>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()"
                                                               class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a
            href="javascript:;" onclick="business_add('添加商家','shangjia-add.jsp','800','500')"
            class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加商家</a></span> <span
            class="r">共有数据：<strong>
        <c:if test="${requestScope.result!=null}">
            ${requestScope.result.totalRecord}
        </c:if>
        <c:if test="${requestScope.busis!=null}">
            ${fn:length(requestScope.busis)}
        </c:if>
    </strong> 条</span></div>
    <div class="mt-20">
        <c:if test="${requestScope.result!=null}">
            <form action="${pageContext.request.contextPath}/Business-dels.action" method="post" id="for1">
            <table class="table table-border table-bordered table-hover table-bg table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="80">ID</th>
                    <th width="100">商家名称</th>
                    <th width="100">法人代表</th>
                    <th width="90">服务类型</th>
                    <th width="150">员工人数</th>
                    <th width="80">联系电话</th>
                    <th width="130">注册时间</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>


                <c:forEach items="${requestScope.result.dataList}" var="business" varStatus="num">

                    <tr class="text-c">
                        <td><input type="checkbox" value="${business.bid}" name="ids"></td>
                        <td>${business.bid}</td>

                        <td><u style="cursor:pointer" class="text-primary"
                               onclick="business_show('${business.bname}','Business-show.action?business.bid=${business.bid}','10001','400','500')">${business.bname}</u>
                        </td>
                        <td>${business.blegal}</td>
                        <td>
                            <c:if test="${business.btype==1}">
                                养老家政
                            </c:if>
                            <c:if test="${business.btype==2}">
                                房屋维修
                            </c:if>
                            <c:if test="${business.btype==3}">
                                家电维修
                            </c:if>
                            <c:if test="${business.btype==4}">
                                家庭用餐
                            </c:if>
                            <c:if test="${business.btype==5}">
                                家庭购物
                            </c:if>
                            <c:if test="${business.btype==6}">
                                法律咨询
                            </c:if>
                            <c:if test="${business.btype==7}">
                                开锁服务
                            </c:if>
                            <c:if test="${business.btype==8}">
                                家庭旅游
                            </c:if>
                            <c:if test="${business.btype==9}">
                                医疗服务
                            </c:if>
                            <c:if test="${business.btype==10}">
                                休闲健身
                            </c:if>
                            <c:if test="${business.btype==11}">
                                保险金融
                            </c:if>
                            <c:if test="${business.btype==12}">
                                丧葬服务
                            </c:if>
                            <c:if test="${business.btype==13}">
                                婚姻介绍
                            </c:if>
                        </td>
                        <td>${business.bmeber}</td>
                        <td>${business.bphone}</td>
                        <td>${business.bdate}</td>


                        <td class="td-manage"><a title="编辑" href="javascript:;"
                                                 onclick="business_edit('商家编辑','Business-get.action?business.bid=${business.bid}','1','800','500')"
                                                 class="ml-5" style="text-decoration:none"><i
                                class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;"
                                                                         onclick="business_del(this,${business.bid})"
                                                                         class="ml-5" style="text-decoration:none"><i
                                class="Hui-iconfont">&#xe6e2;</i></a></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
            </form>
                </c:if>
        <c:if test="${requestScope.busis!=null}">
            <form action="${pageContext.request.contextPath}/Business-dels.action" method="post" id="for1">
                <table class="table table-border table-bordered table-hover table-bg table-sort">
                    <thead>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" name="" value=""></th>
                        <th width="80">ID</th>
                        <th width="100">商家名称</th>
                        <th width="100">法人代表</th>
                        <th width="90">服务类型</th>
                        <th width="150">员工人数</th>
                        <th width="80">联系电话</th>
                        <th width="130">注册时间</th>
                        <th width="100">操作</th>
                    </tr>
                    </thead>
                    <tbody>


                    <c:forEach items="${requestScope.busis}" var="business" varStatus="num">

                        <tr class="text-c">
                            <td><input type="checkbox" value="${business.bid}" name="ids"></td>
                            <td>${business.bid}</td>

                            <td><u style="cursor:pointer" class="text-primary"
                                   onclick="business_show('${business.bname}','Business-show.action?business.bid=${business.bid}','10001','400','500')">${business.bname}</u>
                            </td>
                            <td>${business.blegal}</td>
                            <td>
                                <c:if test="${business.btype==1}">
                                    养老家政
                                </c:if>
                                <c:if test="${business.btype==2}">
                                    房屋维修
                                </c:if>
                                <c:if test="${business.btype==3}">
                                    家电维修
                                </c:if>
                                <c:if test="${business.btype==4}">
                                    家庭用餐
                                </c:if>
                                <c:if test="${business.btype==5}">
                                    家庭购物
                                </c:if>
                                <c:if test="${business.btype==6}">
                                    法律咨询
                                </c:if>
                                <c:if test="${business.btype==7}">
                                    开锁服务
                                </c:if>
                                <c:if test="${business.btype==8}">
                                    家庭旅游
                                </c:if>
                                <c:if test="${business.btype==9}">
                                    医疗服务
                                </c:if>
                                <c:if test="${business.btype==10}">
                                    休闲健身
                                </c:if>
                                <c:if test="${business.btype==11}">
                                    保险金融
                                </c:if>
                                <c:if test="${business.btype==12}">
                                    丧葬服务
                                </c:if>
                            </td>
                            <td>${business.bmeber}</td>
                            <td>${business.bphone}</td>
                            <td>${business.bdate}</td>


                            <td class="td-manage"><a title="编辑" href="javascript:;"
                                                     onclick="business_edit('商家编辑','Business-get.action?business.bid=${business.bid}','1','800','500')"
                                                     class="ml-5" style="text-decoration:none"><i
                                    class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;"
                                                                             onclick="business_del(this,${business.bid})"
                                                                             class="ml-5" style="text-decoration:none"><i
                                    class="Hui-iconfont">&#xe6e2;</i></a></td>
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
            submitForm("${pageContext.request.contextPath}/Business-query.action?pageNum="+(currentPage+1));
            return true;
        }
    }

    // 上一页
    function previousPage(){
        if(currentPage == 1){
            alert("已经是第一页数据");
            return false;
        }else{
            submitForm("${pageContext.request.contextPath}/Business-query.action?pageNum="+(currentPage-1));
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
    /*用户-添加*/
    function business_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-查看*/
    function business_show(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-停用*/
    function business_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: 'Business-delete.action',
                dataType: 'json',
                data: 'business.bid=' + id,
                success: function (data) {
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
                    $(obj).remove();
                    layer.msg('已停用!', {icon: 5, time: 1000});
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*用户-启用*/
    function business_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function (data) {
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                    $(obj).remove();
                    layer.msg('已启用!', {icon: 6, time: 1000});
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*用户-编辑*/
    function business_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*密码-修改*/
    function change_password(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-删除*/
    function business_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: 'Business-delete.action',
                data: 'business.bid=' + id,
                dataType: 'json',
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }
</script>
</body>
</html>