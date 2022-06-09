<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <title>小米商城-个人中心</title>>
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>
<style>
    .pagination{text-align:center;margin-top:20px;margin-bottom: 20px;}
    .pagination li{margin:0px 0px; border:1px solid #e6e6e6;padding: 3px 8px;display: inline-block;}
    .pagination .active{background-color: #dd1a20;color: #fff;}
    .pagination .disabled{color:#aaa;}
</style>
<script src="/js/jquery-3.6.0.min.js"></script>
<body>
<!-- start header -->
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="/index/index">小米商城</a></li>
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
            <div class="gouwuche fr"><a href="{:url('index/shopping_cart/index')}">购物车</a></div>
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
    <a href="/index/index" target="_blank"><div class="logo fl"></div></a>
    <a href=""><div class="ad_top fl"></div></a>
    <div class="nav fl">
        <ul>
            <li><a href="">小米手机</a></li>
            <li><a href="">红米</a></li>
            <li><a href="">平板·笔记本</a></li>
            <li><a href="">电视</a></li>
            <li><a href="">盒子·影音</a></li>
            <li><a href="">路由器</a></li>
            <li><a href="">智能硬件</a></li>
            <li><a href="">服务</a></li>
            <li><a href="">社区</a></li>
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
<!-- self_info -->
<div class="grzxbj">
    <div class="selfinfo center">
        <div class="lfnav fl">
            <div class="ddzx">订单中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="/user/order_center" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
                    <li><a href="">意外保</a></li>
                    <li><a href="">团购订单</a></li>
                    <li><a href="">评价晒单</a></li>
                </ul>
            </div>
            <div class="ddzx">个人中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="/user/index">我的个人中心</a></li>
                    <li><a href="">消息通知</a></li>
                    <li><a href="">优惠券</a></li>
                    <li><a href="/user/receiving_address">收货地址</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr">
            <div class="ddzxbt">交易订单</div>
            <c:forEach items="${orderList}" var="orlist">
            <div class="ddxq">
                <!-- <div class="ddspt fl"><img style="widows: 80px; height: 80px;" src="__PUBLIC__/image/" alt=""></div> -->
                <div class="ddbh fl">订单号:${orlist.orderNumber}</div>
                <div class="ztxx fr">
                    <ul>
                        <c:choose>
                            <c:when test="${orlist.state == 0}">
                                <li>待付款</li>
                            </c:when>
                            <c:when test="${orlist.state == 3}">
                                <li>已发货</li>
                            </c:when>
                        </c:choose>
                        <li>￥${orlist.totalPrice}</li>

                        <li>
                            <jsp:useBean id="Timestamp" class="java.util.Date"/>
                            <c:set target="${Timestamp}" property="time" value="${orlist.createTime}"/>
                            <fmt:formatDate pattern="yyyy-MM-dd" value="${Timestamp}" type="both"/>
                        </li>
                        <li><a href="/order_details/index/${orlist.id}">订单详情></a></li>
                        <div class="clear"></div>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            </c:forEach>
            {$shop->render()}
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- self_info -->

<footer class="mt20 center">
    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>
</body>
</html>
