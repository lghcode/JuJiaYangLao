<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <link rel="stylesheet" href="css/order.css"/>
    <link rel="stylesheet" href="css/iconfont/iconfont.css"/>
    <title>居家养老</title>
</head>
<body>
    <header>福康安居家养老服务平台</header>
    <form action="${pageContext.request.contextPath}/Oform-save.action" method="post">
        <%
            request.setCharacterEncoding("utf-8");
            String nam= request.getParameter("name");
            String str = new String(nam.getBytes("UTF-8"),"UTF-8");
            System.out.println(str);
        %>
        <input type="hidden" name="oform.bname" value="<%= str %>">
        <input type="hidden" name="oform.oname" id="hi">
       <p><span class="iconfont ico">&#xe6b3;</span><input type="text" placeholder="会员号" name="oform.oid" id="num"/></p>
       <p><span class="iconfont ico">&#xe71b;</span><input type="text" placeholder="姓名(只读)" disabled  id="name" /></p>
       <p><span class="iconfont ico">&#xe641;</span><input type="text" placeholder="性别(只读)" disabled id="sex"/></p>
       <p><span class="iconfont ico" style="font-size: 1.4rem">&#xe62d;</span><input type="text" placeholder="身份证号(只读)" disabled id="number"/></p>
       <p><span class="iconfont ico">&#xe604;</span><input type="text" placeholder="总消费金额" name="oform.money"/></p>
        <input type="submit" value="提交" id="sub"/>
    </form>
    <script src="js/jquery.min.js"></script>
    <script>
        $("input[type=text]").focus(function(){
            $(this).css("border-bottom","2px solid #26a69a");
            $(this).prev().css("color","#26a69a");
        });
        $("input[type=text]").blur(function(){
            $(this).css("border-bottom","2px solid #000");
            $(this).prev().css("color","#000");
        })
        
        $("#num").blur(function(){
            var id = $(this).val();
            $.ajax({
                type: 'POST',
                url: 'Older-show.action',
                data:'older.oid='+id,
                dataType: 'json',
                success: function(data){
                    var list = (data.lao).split("#");
                    $("#name").attr("value",list[0]);
                    $("#hi").attr("value",list[0]);
                    $("#sex").attr("value",list[1]);
                    $("#number").attr("value",list[2]);
                },
                error:function(data) {
                    alert("请您输入正确的会员号");
                }
            });
        })
    </script>
</body>
</html>