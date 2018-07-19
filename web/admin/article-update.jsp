<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>新增文章</title>
    <link rel="stylesheet" href="../css/validate.css">
    <script type="text/javascript" charset="utf-8" src="../utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../utf8-jsp/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <style>
        form{
            width: 80%;
            height: 600px;
            /*border: 1px solid rosybrown;*/
            margin: 0 auto;
            position: relative;
        }
        form h5{
            font-weight: normal;
            font-style: normal;
            color: #555555;
            font-size: 14px;
            display: inline-block;
            margin-right: 3%;
        }
        .h4{
            position: absolute;
            top:29%;
        }
        form h5 span{
            color: red;
        }
        form input{
            width: 88%;
            height: 26px;
            border: 1px solid #DDDDDD;
        }
        .ip2{
            width: 88%;
            height: 26px;
            border: 1px solid #DDDDDD;
        }
        #editor{
            width: 88%;
            height: 1000px;
            border: 1px solid #DDDDDD;
            display: inline-block;
            margin-left: 10%;
        }
        #sub{
            width: 70px;
            height: 26px;
            line-height: 26px;
            font-size: 14px;
            color: #ffffff;
            background-color: #0f9ae0;
            text-align: center;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-bottom: 3%;
            margin-left: -7%;
        }
        #res{
            width: 70px;
            height: 26px;
            line-height: 26px;
            font-size: 14px;
            color: #333333;
            background-color: #e6e6e6;
            text-align: center;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-bottom: 3%;
            margin-left: 1%;
        }
    </style>
</head>
<body>
<form class="vali_form" action="${pageContext.request.contextPath}/News-update.action" method="post">
    <input type="hidden" name="news.nid" value="${requestScope.news2.nid}">
    <div><h5 class="h1"><span>*</span>文章标题:</h5><input type="text" class="ip1" name="news.ntitle" value="${requestScope.news2.ntitle}" datatype="*" errormsg="请输入文章标题"/></div>
    <%--将request中的btype数据放到input中--%>
    <input type="hidden" id="input_btype" value="${requestScope.news.ntype}">
    <div><h5 class="h2"><span>*</span>分类栏目:</h5>
        <select name="news.ntype" class="ip2" datatype="*" errormsg="请选择分类栏目" id="select_id">
            <option value="10">请选择栏目</option>
            <option value="1">新闻资讯</option>
            <option value="2">网站公告</option>
            <option value="3">政策法规</option>
            <option value="4">服务制度</option>
        </select>
    </div>
    <div><h5 class="h3"><span>*</span>编辑人员:</h5><input type="text" class="ip3" name="news.writer" value="${requestScope.news2.writer}" datatype="*" errormsg="请输入编辑人员"/></div>
    <div><h5 class="h4"><span>*</span>文章内容:</h5>
        <script id="editor" type="text/plain"></script>
    </div>
    <input type="hidden" value='${requestScope.news2.ncont}' id="cont">
    <input type="submit" value="提交文章" id="sub">
    <input type="reset" value="取消" id="res">
</form>
<script type="text/javascript">
    var ue = UE.getEditor('editor');
    UE.getEditor('editor').addListener("ready", function () {
// editor准备好之后才可以使用
        var cont = document.getElementById("cont");
        var con = cont.value;
        console.log(con);
        UE.getEditor('editor').setContent(''+con+'');
    });
</script>
</body>
<script src="../js/jquery-1.6.2.min.js"></script>
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