<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <title>小米商城-个人中心</title>
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <link rel="stylesheet" href="/css/common.css"/>
</head>
    <script src="/js/jquery-3.6.0.min.js"></script>
<style>
    .add{
        text-align: center;
        color: #b0b0b0;
        width: 268px;
        height: 178px;
        border: 1px solid #e0e0e0;
        line-height: 178px;
        cursor: pointer;
        position: relative;
        margin-left: 30px;
        margin-right: 20px;
        /* margin-top: 40px; */
        float: left;
    }
    .redss{
        display: inline;
        float: left;
        margin-left: 30px;
        margin-right: 20px;
        /* margin-top: 40px; */
        width: 268px;
        height: 178px;
        border: 1px solid #e0e0e0;
        margin-bottom: 30px;
    }

    }
    .redss dl{
        margin: 0;
        padding: 0px 24px 0;
        display: block;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
    }
    .redss .uname{
        font-size: 18px;
        color: #333;
        font-style: normal;
    }
    .redss .tag{
        float: right;
        color: #b0b0b0;
    }
    .redss .utel{
        margin: 15px 0 0 0;
        line-height: 22px;
        color: #757575;
        font-size: 14px;
    }
    .redss .uaddress{
        margin: 0;
        line-height: 22px;
        color: #757575;
        font-size: 14px;
    }
    .redss .actions{
        float: right;
        font-size: 14px;
        margin-top: 10px;
        margin-right: 25px;
    }
    .rtcont {
        padding-bottom: 30px;
    }
</style>
<body>
<!-- start header -->
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="{:url('index/index')}">小米商城</a></li>
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
    <a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>
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
                    <li><a href="/user/order_center">我的订单</a></li>
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
                    <li><a href="/user/receiving_address" style="color:#ff6700;font-weight:bold;">收货地址</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr" style="height: 100%;">
            <div class="ddzxbt" style="border-bottom: 0px solid #ccc;">收货地址</div>
            <div class="add" id="J_newAddress">
                <!-- <i class="iconfont">&#xe609;</i> -->
                <a href="javascript:;" class="dizhi">+添加新地址</a>
            </div>
            <c:forEach items="${receivingList}" var="relist">
            <div class="redss"
                 data-address_id="11000000106049110"
                 data-consignee="${relist.nickname}"
                 data-tel="${relist.phone}"
                 data-province_id="19"
                 data-province_name="${relist.province}"
                 data-city_id="228"
                 data-city_name="${relist.city}"
                 data-district_id="2149"
                 data-district_name="${relist.area}"
                 data-area="2149008"
                 data-area_name='骆仙街道'
                 data-zipcode="${relist.zipcode}"
                 data-address="${relist.detailed}"
                 data-tag_name="${relist.label}">
                <dl>
                    <dt>
                        <span class="tag">${relist.label}</span>
                        <em class="uname">${relist.nickname}</em>
                    </dt>
                    <dd class="utel">${relist.phone}</dd>
                    <dd class="uaddress">${relist.province} ${relist.city} ${relist.area}                                                                                <br />${relist.detailed} (${relist.zipcode})                                    </dd>
                </dl>
                <div class="actions">
                    <a class="modify${relist.id}" style="text-decoration: none;margin-left: 10px;color: #ff6700;" href="javascript:;">修改</a>
                    <a class="delete${relist.id}" style="text-decoration: none;margin-left: 10px;color: #ff6700;" href="javascript:;">删除</a>
                </div>
            </div>
            <script>
                $(document).ready(function(){
                    $('.modify${relist.id}').hDialog({box: '#NBox', effect: 'fadeOut', width: 700, height: 320,});
                    $('.modify${relist.id}').click(function(){
                        $('#genggai').val('${relist.id}');
                        var $nickname = $('.nickname');
                        $nickname.val('${relist.nickname}');
                        var $phone = $('.phone');
                        $phone.val('${relist.phone}');
                        var $Detailed = $('.Detailed');
                        $Detailed.val('${relist.detailed}');
                        var $Label = $('.Label');
                        $Label.val('${relist.label}');
                    });
                });
            </script>
            <script>
                $(document).ready(function(){
                    $('.delete${relist.id}').click(function(){
                        if (confirm('确定删除该地址吗？')) {
                            $.ajax({
                                type:'post',
                                url:"/shopcart/delete_address",
                                dataType:'json',
                                data:{id:${relist.id}},
                                success: function(res){
                                    $.tooltip(res.msg,1000,true);
                                    setInterval(function () {
                                        window.location = "/user/receiving_address";
                                    }, 1000);
                                }
                            });
                        } else {
                            return false;
                        }
                    });
                });
            </script>
            </c:forEach>

        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="NBox">
    <form id="form_address" onsubmit="return false;">
        <ul class="list">
            <li>
                <strong>姓 名  <span style="color: #ff0000; ">*</span></strong>
                <div class="fl"><input type="text"  placeholder="收货人姓名" id="nickname" class="ipt nickname" /></div>
            </li>
            <li>
                <strong>手 机 号  <span style="color: #ff0000; ">*</span></strong>
                <div class="fl"><input type="text"  placeholder="11位电话号码" id="phone" class="ipt phone" /></div>
            </li>
            <li>
                <strong>地 区  <span style="color: #ff0000; ">*</span></strong>
                <div class="wrap">
                    <select id="province" name="province">
                        <option value="">请选择省份</option>
                        <c:forEach items="${provinceList}" var="prlist">
                        <option value="${prlist.id}">${prlist.name}</option>
                        </c:forEach>
                    </select>
                    <select id="city" name="city">
                        <option value="">请选择城市</option>
                    </select>
                    <select id="area" name="area">
                        <option value="">请选择区/县</option>
                    </select>
                    <script>
                        $(document).ready(function(){
                            $('#province').change(function(){
                                $("#city").empty();
                                $("#area").empty();
                                $.ajax({
                                    type:'post',
                                    url:"/shopcart/urban_district",
                                    dataType:'json',
                                    data:{p_id:$('#province').val()},
                                    success: function(res){
                                        $("#city").append("<option value=''>请选择城市 </option>");
                                        $("#area").append("<option value=''>请选择区/县 </option>");
                                        $.each(res.data, function (index, itemobj) {
                                            $("#city").append("<option value='"+itemobj.id+"'>"+itemobj.name+"</option>");
                                        });
                                    }
                                });
                            });
                            $('#city').change(function(){
                                $("#area").empty();
                                $.ajax({
                                    type:'post',
                                    url:"/shopcart/urban_district",
                                    dataType:'json',
                                    data:{c_id:$('#city').val()},
                                    success: function(res){
                                        $("#area").append("<option value=''>请选择区/县 </option>");
                                        $.each(res.data, function (index, itemobj) {
                                            $("#area").append("<option value='"+itemobj.id+"'>"+itemobj.name+"</option>");
                                        });
                                    }
                                });
                            });
                        });
                    </script>
                </div>
            </li>
            <li>
                <strong>详 细 地 址  <span style="color: #ff0000; ">*</span></strong>
                <div class="fl"><textarea id="Detailed" class="ipt Detailed" placeholder="详细地址，路名或街道名称，门牌号" cols="47px"></textarea></div>
            </li>
            <li>
                <strong>地 址 标 签  <span style="color: #ff0000; ">*</span></strong>
                <div class="fl"><input type="text" placeholder="如'家'、'公司'。限5字内" maxlength="5" id="Label" class="ipt Label" /></div>
            </li>
            <input type="hidden" value="0" id="genggai">
            <li><input type="submit" value="编辑" class="submitBtn" id="edit_address" /></li>
        </ul>
    </form>
</div>
<script src="/js/jquery.hDialog.min.js"></script>
<script>
    $(document).ready(function(){
        $('#J_newAddress').click(function(){
            $('#genggai').val('0');
        });
        $('#J_newAddress').hDialog({box: '#NBox', effect: 'fadeOut', width: 700, height: 320,});
        var PhoneReg = /^0{0,1}(13[0-9]|15[0-9]|153|156|18[0-9])[0-9]{8}$/ ; //手机正则
        var $nickname = $('.nickname');
        var $phone = $('.phone');
        var $Detailed = $('.Detailed');
        var $Label = $('.Label');
        var form_address = $('#form_address').serialize();
        $('#edit_address').click(function () {
            if($nickname.val() == ''){
                $.tooltip('昵称还没填呢...');
            } else if ($phone.val() == '') {
                $.tooltip('手机号还没填呢...');
            } else if(!PhoneReg.test($phone.val())){
                $.tooltip('手机格式错咯...'); $phone.focus();
            } else if ($('#province').val() == '') {
                $.tooltip('请选择一个省份...');
            } else if ($('#city').val() == '') {
                $.tooltip('请选择一个城市...');
            } else if ($('#area').val() == '') {
                $.tooltip('请选择一个区或县...');
            } else if ($Detailed.val() == '') {
                $.tooltip('详细地址还没填呢...');
            } else if ($Label.val() == '') {
                $.tooltip('地址标签还没填呢...');
            } else {
                $.ajax({
                    type:'post',
                    url:"/shopcart/editAddress",
                    dataType:'json',
                    data:
                        {
                            nickname:$nickname.val(),
                            phone:$phone.val(),
                            province:$('#province').val(),
                            city:$('#city').val(),
                            area:$('#area').val(),
                            detailed:$Detailed.val(),
                            label:$Label.val(),
                            genggai:$('#genggai').val()
                        },
                    success: function(res){
                        $.tooltip(res.msg,1000,true);
                        setInterval(function () {
                            window.location = "/user/receiving_address";
                        }, 1000);
                    }
                });
            }
        });

    });
</script>
<!-- self_info -->

<footer class="mt20 center">
    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>
</body>
</html>