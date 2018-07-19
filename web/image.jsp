<%--
  Created by IntelliJ IDEA.
  User: lgh
  Date: 2018/7/17
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图片展示</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jQuery响应式Pinterest样式无限动态加载图片瀑布流特效</title>
    <link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css" media="screen" />
    <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.lightbox-0.5.js"></script>
    <script type="text/javascript">
        $(function() {
            $('#div1 a').lightBox();
        });
    </script>
    <style>

        .jq22-container { margin-top: 50px; }
        #div1 { margin: auto; position: relative; }
        .box { float: left; padding: 10px; border: 1px solid #ccc; background: #f7f7f7; box-shadow: 0 0 8px #ccc; }
        .box:hover { box-shadow: 0 0 10px #999; }
        .box img { width: 240px; }
    </style>
    <!--[if IE]>
    <script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->
 </head>
<body>
<div class="logo">
    <img src="image/logo.png" alt="">
    <h3>居家养老服务平台</h3>
</div>
<%@include file="nav.jsp"%>
<div class="jq22-container">
    <div class="jq22-content bgcolor-3">
        <div id="div1">
            <a href="image/01.jpg" title="测试图片">
                <div class="box"><img src="image/01.jpg" alt=""></div>
            </a>
            <a href="image/02.jpg" title="测试图片">
                <div class="box"><img src="image/02.jpg" alt=""></div>
            </a>
            <a href="image/03.jpg" title="测试图片">
                <div class="box"><img src="image/03.jpg" alt=""></div>
            </a>
            <a href="image/04.jpg" title="测试图片">
                <div class="box"><img src="image/04.jpg" alt=""></div>
            </a>
            <a href="image/05.jpg" title="测试图片">
                <div class="box"><img src="image/05.jpg" alt=""></div>
            </a>
            <a href="image/06.jpg" title="测试图片">
                <div class="box"><img src="image/06.jpg" alt=""></div>
            </a>
            <a href="image/07.jpg" title="测试图片">
                <div class="box"><img src="image/07.jpg" alt=""></div>
            </a>
            <a href="image/08.jpg" title="测试图片">
                <div class="box"><img src="image/08.jpg" alt=""></div>
            </a>
            <a href="image/01.jpg" title="测试图片">
                <div class="box"><img src="image/01.jpg" alt=""></div>
            </a>
            <a href="image/02.jpg" title="测试图片">
                <div class="box"><img src="image/02.jpg" alt=""></div>
            </a>
            <a href="image/03.jpg" title="测试图片">
                <div class="box"><img src="image/03.jpg" alt=""></div>
            </a>
            <a href="image/04.jpg" title="测试图片">
                <div class="box"><img src="image/04.jpg" alt=""></div>
            </a>
            <a href="image/05.jpg" title="测试图片">
                <div class="box"><img src="image/05.jpg" alt=""></div>
            </a>
            <a href="image/06.jpg" title="测试图片">
                <div class="box"><img src="image/06.jpg" alt=""></div>
            </a>
            <a href="image/07.jpg" title="测试图片">
                <div class="box"><img src="image/07.jpg" alt=""></div>
            </a>
            <a href="image/08.jpg" title="测试图片">
                <div class="box"><img src="image/08.jpg" alt=""></div>
            </a>

        </div>
    </div>
</div>
<script src="js/jquery.waterfall.js"></script>
<script>
    $("#div1").waterfall({
        itemClass: ".box",
        minColCount: 2,
        spacingHeight: 10,
        resizeable: true,
        ajaxCallback: function(success, end) {
            var data = {"data": [
                    { "src": "image/01.jpg" }, { "src": "image/02.jpg" }, { "src": "image/03.jpg" }, { "src": "image/04.jpg" }, { "src": "image/05.jpg" }, { "src": "image/06.jpg" }, { "src": "image/07.jpg" }, { "src": "image/08.jpg" }
                ]};
            console.log(data)
            var str = "";
            for (var i = 0; i < data.data.length; i++) {
                str += '<a href="' + data.data[i].src + '" title="测试图片"><div class="box"><img src="' + data.data[i].src + '" alt=""></div></a>';
            }
            jQuery(str).appendTo(jQuery("#div1"));
            jQuery('#div1 a').lightBox();
            success();
            end();
        }
    });
</script>
</body>
</html>
