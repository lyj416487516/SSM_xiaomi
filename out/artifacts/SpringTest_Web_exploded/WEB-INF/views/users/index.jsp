<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <!-- <link rel="stylesheet" href="css/animate.min.css"/> -->
</head>
<body>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/md5.js"></script>
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
    <a href="/index/index"><div class="logo fl"></div></a>
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
                    <li><a href="/user/order_center" >我的订单</a></li>
                    <li><a href="">意外保</a></li>
                    <li><a href="">团购订单</a></li>
                    <li><a href="">评价晒单</a></li>
                </ul>
            </div>
            <div class="ddzx">个人中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="/user/index" style="color:#ff6700;font-weight:bold;">我的个人中心</a></li>
                    <li><a href="">消息通知</a></li>
                    <li><a href="">优惠券</a></li>
                    <li><a href="/user/receiving_address">收货地址</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr">
            <div class="grzlbt ml40">我的资料</div>
            <div class="subgrzl ml40"><span>昵称</span><span>${user.nickname}</span><span><a href="javascript:;" class="nicheng">编辑</a></span></div>
            <div class="subgrzl ml40"><span>手机号</span><span>${user.mobile}</span><span><a href="javascript:;" class="shouji">编辑</a></span></div>
            <div class="subgrzl ml40"><span>密码</span><span>************</span><span><a href="javascript:;" class="mima">修改</a></span></div>
            <div class="subgrzl ml40"><span>个性签名</span><span>${user.bio}</span><span><a href="javascript:;" class="qianming">编辑</a></span></div>
            <div class="subgrzl ml40"><span>性别</span><span>
                <c:choose>
                    <c:when test="${user.gender == 1}">
                        男
                    </c:when>
                    <c:when test="${user.gender == 2}">
                        女
                    </c:when>
                    <c:otherwise>
                        保密
                    </c:otherwise>
                </c:choose>

            </span><span><a href="javascript:;" class="aihao">编辑</a></span></div>
            <div class="subgrzl ml40"><span>生日</span><span><fmt:formatDate value="${user.birthday}" type="date" pattern="yyyy年MM月dd日"/></span><span><a href="javascript:;" class="shengri">编辑</a></span></div>
<%--            <div class="subgrzl ml40"><span>收货地址</span><span>{$ur.address}</span><span><a href="javascript:;" class="dizhi">编辑</a></span></div>--%>
        </div>
        <div id="NBox">
            <form id="form_name" onsubmit="return false;">
                <ul class="list">
                    <li>
                        <strong>昵 称  <span style="color: #ff0000; ">*</span></strong>
                        <div class="fl"><input type="text" name="nickname" class="ipt nickname" /></div>
                    </li>
                    <li><input type="submit" value="编辑" class="submitBtn" id="edit_name" /></li>
                </ul>
            </form>
        </div>
        <script>
            $(document).ready(function(){
                $('.nicheng').hDialog({box: '#NBox', effect: 'fadeOut', width: 300, height: 150,});
                $('#edit_name').click(function () {
                    var $nickname = $('.nickname');
                    if($nickname.val() == ''){
                        $.tooltip('昵称还没填呢...');  $nickname.focus();
                    } else {
                        $.ajax({
                            type:'post',
                            url:"/user/Verification",
                            dataType:'json',
                            data: {
                                nickname:$nickname.val(),
                                id:${user.id}
                            },
                            success: function(res){
                                if (res.code == 0) {
                                    $.tooltip(res.msg);  $nickname.focus();
                                } else {
                                    $.tooltip(res.msg,1000,true);
                                    setInterval(function () {
                                        window.location = "/user/index";
                                    }, 1000);
                                }
                            }
                        });
                    }
                });
            });
        </script>
        <div id="PBox">
            <form id="form_phone" onsubmit="return false;">
                <ul class="list">
                    <li>
                        <strong>手 机 <span style="color: #ff0000; ">*</span></strong>
                        <div class="fl"><input type="text" id="phone" name="phone" class="ipt phone" /></div>
                    </li>
                    <li><input type="submit" value="编辑" class="submitBtn" id="edit_phone" /></li>
                </ul>
            </form>
        </div>
        <script>
            $(document).ready(function(){
                $('.shouji').hDialog({box: '#PBox', effect: 'fadeOut',width:300,height:150});
                var $phone = $('.phone');
                var PhoneReg = /^0{0,1}(13[0-9]|15[0-9]|153|156|18[0-9])[0-9]{8}$/ ; //手机正则
                $('#edit_phone').click(function () {
                    if($phone.val() == ''){
                        $.tooltip('手机还没填呢...'); $phone.focus();
                    } else if(!PhoneReg.test($phone.val())){
                        $.tooltip('手机格式错咯...'); $phone.focus();
                    } else {
                        $.ajax({
                            type:'post',
                            url:"/user/Verification",
                            dataType:'json',
                            data:{
                                mobile:$('#phone').val(),
                                id:${user.id}
                            },
                            success: function(res){
                                if (res.code == 0) {
                                    $.tooltip(res.msg);  $phone.focus();
                                } else {
                                    $.tooltip(res.msg,1000,true);
                                    setInterval(function () {
                                        window.location = "/user/index";
                                    }, 1000);
                                }
                            }
                        });
                    }
                });


            });
        </script>
        <div id="MBox">
            <form id="form_password" onsubmit="return false;">
                <ul class="list">
                    <li>
                        <strong>原密码 <span style="color: #ff0000; ">*</span></strong>
                        <div class="fl"><input type="password" id="unpassword" name="unpassword" maxlength="16" class="ipt unpassword" /></div>
                    </li>
                    <li>
                        <strong>新密码 <span style="color: #ff0000; ">*</span></strong>
                        <div class="fl"><input type="password" id="password" name="password" maxlength="16" class="ipt password" /></div>
                    </li>
                    <li>
                        <strong>二次密码 <span style="color: #ff0000; ">*</span></strong>
                        <div class="fl"><input type="password" id="repassword" name="repassword" maxlength="16" class="ipt repassword" /></div>
                    </li>
                    <li><input type="submit" value="修改" class="submitBtn" id="edit_password" /></li>
                </ul>
            </form>
        </div>
        <script>
            $(document).ready(function(){
                $('.mima').hDialog({box: '#MBox', effect: 'fadeOut', width: 500, height: 250,});
                var $password = $('.password');
                var $unpassword = $('.unpassword');
                var $repassword = $('.repassword');
                $('#edit_password').click(function () {
                    if($password.val() == '' || $unpassword.val() == '' || $repassword.val() == ''){
                        $.tooltip('密码还没填呢...'); $phone.focus();
                    } else if ($password.val() != $repassword.val()) {
                        $.tooltip('两次密码不一致'); $phone.focus();
                    } else {
                        $.ajax({
                            type:'post',
                            url:"Verification",
                            dataType:'json',
                            data:{
                                unpassword:hex_md5($unpassword.val()),
                                password:hex_md5($password.val()),
                                id:${user.id}
                            },
                            success: function(res){
                                if (res.code == 0) {
                                    $.tooltip('原密码不一致');
                                } else {
                                    $.tooltip(res.msg,1000,true);
                                    setInterval(function () {
                                        window.location = "/user/index";
                                    }, 1000);
                                }
                            }
                        });
                    }
                });
            });
        </script>
        <div id="GBox">
            <form id="form_personality" onsubmit="return false;">
                <ul class="list">
                    <li>
                        <strong>个性签名 <span style="color: #ff0000; ">*</span></strong>
                        <div class="fl"><textarea type="text" id="personality" name="personality" maxlength="30" class="ipt personality"></textarea></div>
                    </li>
                    <li><input type="submit" value="编辑" class="submitBtn" id="edit_personality" /></li>
                </ul>
            </form>
        </div>
        <script>
            $(document).ready(function(){
                $('.qianming').hDialog({box: '#GBox', effect: 'fadeOut', width: 500, height: 200,});
                var $personality = $('.personality');
                $('#edit_personality').click(function () {
                    if($personality.val() == ''){
                        $.tooltip('个性签名还没填呢...');
                    } else {
                        $.ajax({
                            type:'post',
                            url:"Verification",
                            dataType:'json',
                            data:{
                                bio:$personality.val(),
                                id:${user.id}
                            },
                            success: function(res) {
                                if (res.code == 0) {
                                    $.tooltip(res.msg);
                                    $personality.focus();
                                } else {
                                    $.tooltip(res.msg, 1000, true);
                                    setInterval(function () {
                                        window.location = "/user/index";
                                    }, 1000);
                                }
                            }
                        });
                    }
                });
            });
        </script>
        <div id="ABox">
            <form id="form_hobby" onsubmit="return false;">
                <ul class="list">
                    <li>
                        <strong>性 别 <span style="color: #ff0000; ">&nbsp;*</span></strong>
                        <div class="fl">
                            <label class="mr10"><input type="radio" name="hobby" value="1" <c:choose><c:when test="${user.gender == 1}">checked</c:when></c:choose>/>男</label>
                            <label class="mr10"><input type="radio" name="hobby" value="2" <c:choose><c:when test="${user.gender == 2}">checked</c:when></c:choose>/>女</label>
                            <label class="mr10"><input type="radio" name="hobby" value="3" <c:choose><c:when test="${user.gender == 3}">checked</c:when></c:choose>/>保密</label>
                        </div>
                    </li>
                    <li><input type="submit" value="编辑" class="submitBtn" id="edit_hobby" /></li>
                </ul>
            </form>
        </div>
        <script>
            $(document).ready(function(){
                $('.aihao').hDialog({box: '#ABox', effect: 'fadeOut', width: 500, height: 180,});
                $('#edit_hobby').click(function () {
                    var fxk=$("input[name=hobby]");
                    var id_array=new Array();
                    $('input[name="hobby"]:checked').each(function(){
                        id_array.push($(this).val());//向数组中添加元素
                    });
                    var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串
                    $.ajax({
                        type:'post',
                        url:"/user/Verification",
                        dataType:'json',
                        data:{
                            gender:idstr,
                            id:${user.id}
                        },
                        success: function(res){
                            $.tooltip(res.msg,1000,true);
                            setInterval(function () {
                                window.location = "/user/index";
                            }, 1000);
                        }
                    });
                });
            });
        </script>
        <div id="DBox">
            <form id="form_address" onsubmit="return false;">
                <ul class="list">
                    <li>
                        <strong>生日 <span style="color: #ff0000; ">*</span></strong>
                        <div class="fl"><input type="date" id="birthday" name="birthday" class="ipt birthday" /></div>
                    </li>
                    <li><input type="submit" value="编辑" class="submitBtn" id="edit_address" /></li>
                </ul>
            </form>
        </div>
        <script>
            $(document).ready(function(){
                $('.shengri').hDialog({box: '#DBox', effect: 'fadeOut', width: 500, height: 150,});
                $('#edit_address').click(function () {
                    var $birthday = $('.birthday');
                    if ($(".birthday").val() == '') {
                        $.tooltip('生日还没有填...');
                    } else {
                        $.ajax({
                            type:'post',
                            url:"/user/Verification",
                            dataType:'json',
                            data:{
                                birthdays:$birthday.val(),
                                id:${user.id}
                            },
                            success: function(res){
                                $.tooltip(res.msg,1000,true);
                                setInterval(function () {
                                    window.location = "/user/index";
                                }, 1000);
                            }
                        });
                    }

                });
            });
        </script>
        <div class="clear"></div>
    </div>
</div>
<!-- <script src="__PUBLIC__/js/jquery.min.js"></script> -->
<script src="/js/jquery.hDialog.min.js"></script>
<!-- self_info -->
<!-- <div style="widows: 100%;height: 1712px;background-color: gray;">

</div> -->
<footer class="mt20 center">
    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>
</body>
</html>