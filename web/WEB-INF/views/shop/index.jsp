<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <title>小米手机列表</title>
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>
<script src="/js/jquery-3.6.0.min.js"></script>
<body>
<!-- start header -->
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="/index/index" target="_blank">小米商城</a></li>
                <li>|</li>
                <li><a href="">MIUI</a></li>
                <li>|</li>
                <li><a href="">米聊</a></li>
                <li>|</li>
                <li><a href="">游戏</a></li>
                <li>|</li>
                <li><a href="">多看阅读</a></li>
                <li>|</li>
                <li><a href="">云服务</a></li>
                <li>|</li>
                <li><a href="">金融</a></li>
                <li>|</li>
                <li><a href="">小米商城移动版</a></li>
                <li>|</li>
                <li><a href="">问题反馈</a></li>
                <li>|</li>
                <li><a href="">Select Region</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <div class="gouwuche fr"><a href="/shopcart/index">购物车</a></div>
            <script>
                $(".gouwuche").click(function () {
                    window.location = "/shopcart/index";
                });
            </script>
            <div class="fr">
                <ul>
                    <c:choose>
                        <c:when test="${username != null}"><!-- 如果 -->
                            <li><a href="/user/index">${username}</a></li>
                            <li>|</li>
                            <li><a href="">消息通知</a></li>
                            <li>|</li>
                            <li><a href="javascript:if(confirm('确认注销当前用户？')) window.location ='/user/cancellation';">注销</a></li>
                        </c:when>
                        <c:otherwise> <!-- 否则 -->

                            <li><a href="/user/login">登录</a></li>
                            <li>|</li>
                            <li><a href="/user/register" >注册</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<!--end header -->

<!-- start banner_x -->
<div class="banner_x center">
    <a href="./index.html" target="_blank"><div class="logo fl"></div></a>
    <a href=""><div class="ad_top fl"></div></a>
    <div class="nav fl">
        <ul>
            <c:forEach items="${classifyList}" var="cs">
            <li><a href="/shop/index/${cs.id}">${cs.name}</a></li>
            </c:forEach>
        </ul>
    </div>
    <div class="search fr">
        <form action="" method="post">
            <div class="text fl">
                <input type="text" class="shuru"  placeholder="小米6&nbsp;小米MIX现货">
            </div>
            <div class="submit fl">
                <input type="submit" class="sousuo" value="搜索"/>
            </div>
            <div class="clear"></div>
        </form>
        <div class="clear"></div>
    </div>
</div>
<!-- end banner_x -->

<!-- start banner_y -->
<!-- end banner -->

<!-- start danpin -->
<div class="danpin center">

    <input type="hidden" value="1" id="sb">
    <div class="biaoti center">小米手机</div>
    <div class="main center" id="deta">
        <c:forEach items="${shopList}" var="list">
            <div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
                <div class="sub_mingxing"><a href="/shop/details/${list.id}"><img src="/image/${list.getImage()}" alt=""></a></div>
                <div class="pinpai"><a href="">${list.getName()}</a></div>
                <div class="youhui">${list.getDescription()}</div>
                <div class="jiage">${list.getMoney()}元</div>
            </div>
        </c:forEach>

        <div class="clear"></div>
    </div>
</div>
<div class="clear"></div>

<script>
    $(window).scroll(function() {

        if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
            $.ajax({
                type:'post',
                url: '/shop/drop',
                dataType:'json',
                data: {
                    cid:${cid},
                    num:$('#sb').val()
                },
                success: function(res) {
                    if (res.code != 0) {
                        //当请求成功时执行的回调函数；
                        $('#sb').val(res.code);
                        var str = "";
                        $.each(res.data, function (index, item) {
                            str+="<div class='mingxing fl mb20' style='border:2px solid #fff;width:230px;cursor:pointer;' onmouseout='this.style.border='2px solid #fff''onmousemove='this.style.border='2px solid red''><div class='sub_mingxing'><a href='/shop/details/"+item.id+"'><img src='/image/"+item.image+"'></a></div><div class='pinpai'>"+item.name+"</div><div class='youhui'>"+item.description+"</div><div class='jiage'>"+item.money+"元</div></div>";
                        });
                        $("#deta").append(str);
                    }
                },

            });
        }
    });
</script>

<footer class="mt20 center">
    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

</footer>

<!-- end danpin -->


</body>
</html>
