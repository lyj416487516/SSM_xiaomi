<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html lang="zh-CN" xml:lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" >
    <meta charset="UTF-8" />
    <title>填写订单信息</title>
    <meta name="viewport" content="width=1226" />
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/image/favicon.ico" type="image/x-icon">
    <link href="/css/checkout.46d2c235.css" rel="preload" as="style">
    <link href="/js/confirm/checkout.bdb4a655.js.下载" rel="preload" as="script">
    <link href="/js/confirm/chunk-vendors.98b31f16.js.下载" rel="preload" as="script">
    <link href="/css/checkout.46d2c235.css" rel="stylesheet"></head>
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/confirm.css"/>
</head>
<script src="/js/jquery-3.6.0.min.js"></script>
<style>
    .yanse{
        color:red;
        border-color:red;
    }
</style>
<body>
<div class="site-header site-mini-header">
    <div class="container">
        <div class="header-logo">
            <a class="logo " href="//www.mi.com/index.html" title="小米官网"></a>
        </div>
        <div class="header-title" id="J_miniHeaderTitle"><h2>确认订单</h2></div>
        <div class="topbar-info" id="J_userInfo">
            <c:choose>
                <c:when test="${username == null}">
                    <a class="link" href="/user/login">登录</a><span class="sep">|</span><a class="link" href="/user/register">注册</a>
                </c:when>
                <c:otherwise>
                    <a href="/user/index" class="link">用户：${username}</a><span class="sep">|</span><a class="link" href="javascript:if(confirm('确认注销当前用户？')) window.location ='/user/cancellation';">注销</a><span class="sep">
<%--                    |</span><a  class="link" href="{:url('personal_center/index')}">个人中心</a>--%>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<!-- .site-mini-header END -->
<div class="page-main">
    <!-- 春节发货公告 -->
    <!-- 春节发货公告 END-->
    <div class="container">
        <div class="checkout-box">
            <div class="section section-address">
                <div class="section-header">
                    <h3 class="title">收货地址</h3>

                    <div class="more"></div>

                    <div class="mitv-tips hide" style="margin-left: 0;border: none;" id="J_bigproPostTip"></div>


                </div>
                <div class="section-body" id="J_addressList">
                    <!-- addresslist begin -->

                    <c:forEach items="${receivingList}" var="relist">
                    <div id="address${relist.id}" class="address-item J_addressItem ">
                        <div class="address-info">
                            <div class="name">
                                    ${relist.nickname}
                                <span style="color: rgb(176, 176, 176);">${relist.label}</span>
                            </div>
                            <div class="del">
                                    ${relist.phone}
                            </div>
                            <div class="address-con">
                                <span>${relist.province}</span>
                                <span>${relist.city}</span>
                                <span>${relist.area}</span>
                                <span>${relist.detailed}</span>
                            </div>
                        </div>
                        <div class="address-action">
                            <span><a href="javascript:;" id="modify${relist.id}" style="color: #ff6700;" class="modify">修改</a></span>
                            <span><a href="javascript:;" id="delete${relist.id}" style="color: #666;" class="delete">删除</a></span>
                        </div>
<%--                        <div class="actions" style="margin-right: 50px;">--%>
<%--                            <a href="javascript:;" id="modify{$as.id}" style="display: block;" class="modify">修改</a>--%>
<%--                        </div>--%>
<%--                        <div class="actions">--%>
<%--                            <a href="javascript:;" id="delete{$as.id}" style="display: block;" class="delete">删除</a>--%>
<%--                        </div>--%>
                    </div>
                    <script>
                        $(document).ready(function(){
                            $('.J_addressItem').click(function(){
                                $(this).addClass("yanse").siblings().removeClass("yanse");
                            });
                            $('#address${relist.id}').click(function(){
                                $('#mc').text('${relist.nickname}');
                                $('#tel').text('${relist.phone}');
                                $('#sheng').text('${relist.province}');
                                $('#shi').text('${relist.city}');
                                $('#xian').text('${relist.area}');
                                $('#detailed').text('${relist.detailed}');
                            });
                            $('#modify${relist.id}').hDialog({box: '#NBox', effect: 'fadeOut', width: 700, height: 320,});
                            $('#modify${relist.id}').click(function(){
                                $('#genggai').val('${relist.id}');
                                $('#edit_address').val("编辑");
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
                            $('#delete${relist.id}').click(function(){
                                if (confirm('确定删除该地址吗？')) {
                                    $.ajax({
                                        type:'post',
                                        url:"/shopcart/delete_address",
                                        dataType:'json',
                                        data:{id:${relist.id}},
                                        success: function(res){
                                            $.tooltip(res.msg,1000,true);
                                            setInterval(function () {
                                                window.location = "/shopcart/confirm";
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

                    <!-- addresslist end -->
                    <div class="address-item address-item-new" id="J_newAddress">
                        <div class="add-desc">
                            <i class="iconfont">&#xe609;</i>
                            添加新地址
                        </div>
                    </div>
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
                                            success: function(msg){
                                                $("#city").append("<option value=''>请选择城市 </option>");
                                                $("#area").append("<option value=''>请选择区/县 </option>");
                                                $.each(msg.data, function (index, itemobj) {
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
                                            success: function(msg){
                                                $("#area").append("<option value=''>请选择区/县 </option>");
                                                $.each(msg.data, function (index, itemobj) {
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
                            <div class="fl"><textarea id="Detaileds" class="ipt Detailed" placeholder="详细地址，路名或街道名称，门牌号" cols="47px"></textarea></div>
                        </li>
                        <li>
                            <strong>地 址 标 签  <span style="color: #ff0000; ">*</span></strong>
                            <div class="fl"><input type="text" placeholder="如'家'、'公司'。限5字内" maxlength="5" id="Label" class="ipt Label" /></div>
                        </li>
                        <input type="hidden" value="0" id="genggai">
                        <li><input type="submit" value="添加" class="submitBtn" id="edit_address" /></li>
                    </ul>
                </form>
            </div>
            <script src="/js/jquery.hDialog.min.js"></script>
            <script>
                $(document).ready(function(){
                    $("#J_newAddress").click(function () {
                        $('#genggai').val('0');
                        $('#edit_address').val("添加");
                    });
                    $('#J_newAddress').hDialog({box: '#NBox', effect: 'fadeOut', width: 700, height: 350,});
                    var PhoneReg = /^0{0,1}(13[0-9]|15[0-9]|153|156|18[0-9])[0-9]{8}$/ ; //手机正则
                    var $nickname = $('.nickname');
                    var $phone = $('.phone');
                    var $Detailed = $('.Detailed');
                    var $Label = $('.Label');
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
                                        window.location = "/shopcart/confirm";
                                    }, 1000);
                                }
                            });
                        }
                    });

                });
            </script>



            <div class="section section-goods">
                <div class="section-header clearfix">
                    <h3 class="title" style="margin: 0;">商品</h3>
                </div>
                <div class="section-body">
                    <ul class="goods-list" id="J_goodsList">
                        <c:forEach items="${shopCartList}" var="sclist">
                        <li class="clearfix">
                            <div class="col col-img">
                                <img src="/image/${sclist.image}" width="30" height="30">
                            </div>
                            <div class="col col-name">

                                <a href="/shop/details/${sclist.id}" target="_blank">
                                    ${sclist.dname}
                                    ${sclist.ename}
                                    ${sclist.cname}
                                </a>

                            </div>

                            <div class="col col-price">
                                ${sclist.price}元 x ${sclist.number}
                            </div>
                            <div class="col col-status">&nbsp;</div>
                            <div class="col col-total">
                                ${sclist.totalPrice}元
                            </div>

                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>


            <div class="section section-count clearfix">
                <div class="money-box" id="J_moneyBox">
                    <ul>
                        <li class="clearfix">
                            <label>商品件数：</label>
                            <span class="val">${count}件</span>
                        </li>
                        <li class="clearfix">
                            <label>商品总价：</label>
                            <span class="val">${total}元</span>
                        </li>
                        <!-- <li class="clearfix">
                            <label>活动优惠：</label>
                            <span class="val">-0元</span>
                        </li>
                        <li class="clearfix">
                            <label>优惠券抵扣：</label>
                            <span class="val"><i id="J_couponVal">-0</i>元</span>
                        </li>
                                                                        <li class="clearfix">
                            <label>运费：</label>
                            <span class="val"><i data-id="J_postageVal">0</i>元</span>
                        </li> -->
                        <li class="clearfix total-price">
                            <label>应付总额：</label>
                            <span id="sum" class="val"><em data-id="J_totalPrice" style="font-size: 30px;">${total}</em>元</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="section-bar clearfix">
                <div class="fl">
                    <div class="seleced-address" id="J_confirmAddress">
                        <span id="mc"></span> <span id="tel"></span>
                        <br>
                        <span id="sheng"></span> <span id="shi"></span> <span id="xian"></span> <span id="detailed"></span>
                    </div>
                    <div class="big-pro-tip hide J_confirmBigProTip"></div>
                </div>
                <div class="fr">
                    <div class="handle-action">
                        <a id="Choose" href="javascript:;" class="btn btn-primary" id="J_checkoutToPay" data-log_code="bid=3515489.8&bpm=25.83.3513216.1&next=26.82">去结算</a>
                        <a class="btn btn-return">返回购物车</a>
                    </div>
                    <script>
                        $(document).ready(function(){
                            $('#Choose').click(function(){
                                if ($('#mc').text() == '') {
                                    $.tooltip('请选择地址！');
                                } else {
                                    $.ajax({
                                        type:'post',
                                        url:"/shopcart/place_an_order",
                                        dataType:'json',
                                        data:{
                                            'sid':"${s_id}",
                                            'totalPrice':parseFloat($('#sum').text()),
                                            'state':0,
                                            'name':$('#mc').text(),
                                            'tel':$('#tel').text(),
                                            'address':$('#sheng').text()+" "+$('#shi').text()+" "+$('#xian').text()+" "+$('#detailed').text(),
                                            'createTime': Date.parse(new Date())/1000
                                        },
                                        success: function(res){
                                            alert(res.msg);
                                            // window.location.href = "http://127.0.0.1/2019.10.9xiaomi/public/index.php/index/order_details/payment/number/"+msg.qwe;
                                        }
                                    });
                                }
                            });
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="site-footer">
    <div class="container">
        <div class="footer-service">
            <ul class="list-service clearfix">
                <li><a rel="nofollow" href="//www.mi.com/static/fast/" target="_blank"><i class="iconfont">&#xe634;</i>预约维修服务</a></li>
                <li><a rel="nofollow" href="//www.mi.com/service/exchange#back" target="_blank"><i class="iconfont">&#xe635;</i>7天无理由退货</a></li>
                <li><a rel="nofollow" href="//www.mi.com/service/exchange#back" target="_blank"><i class="iconfont">&#xe636;</i>15天免费换货</a></li>
                <li><a rel="nofollow" href="//www.mi.com/service/buy/postage/" target="_blank"><i class="iconfont">&#xe638;</i>满150元包邮</a></li>
                <li><a rel="nofollow" href="//www.mi.com/static/maintainlocation/" target="_blank"><i class="iconfont">&#xe637;</i>520余家售后网点</a></li>
            </ul>
        </div>
        <div class="footer-links clearfix">

            <dl class="col-links col-links-first">
                <dt>帮助中心</dt>

                <dd><a rel="nofollow" href="//www.mi.com/service/account/Account%20registration/"   target="_blank">账户管理</a></dd>

                <dd><a rel="nofollow" href="//www.mi.com/service/buy/SalesTime/"   target="_blank">购物指南</a></dd>

                <dd><a rel="nofollow" href="//www.mi.com/service/order/sendprogress/"   target="_blank">订单操作</a></dd>

            </dl>

            <dl class="col-links ">
                <dt>服务支持</dt>

                <dd><a rel="nofollow" href="//www.mi.com/service/exchange"   target="_blank">售后政策</a></dd>

                <dd><a rel="nofollow" href="//www.mi.com/service/"   target="_blank">自助服务</a></dd>

                <dd><a rel="nofollow" href="//www.mi.com/c/service/download/"   target="_blank">相关下载</a></dd>

            </dl>

            <dl class="col-links ">
                <dt>线下门店</dt>

                <dd><a rel="nofollow" href="//www.mi.com/c/xiaomizhijia/"   target="_blank">小米之家</a></dd>

                <dd><a rel="nofollow" href="//www.mi.com/static/maintainlocation/"   target="_blank">服务网点</a></dd>

                <dd><a rel="nofollow" href="//www.mi.com/static/familyLocation/"   target="_blank">授权体验店</a></dd>

            </dl>

            <dl class="col-links ">
                <dt>关于小米</dt>

                <dd><a rel="nofollow" href="//www.mi.com/about/"   target="_blank">了解小米</a></dd>

                <dd><a rel="nofollow" href="http://hr.xiaomi.com/"   target="_blank">加入小米</a></dd>

                <dd><a rel="nofollow" href="//company.mi.com/zh-cn/ir/indexContent/index.html"   target="_blank">投资者关系</a></dd>

            </dl>

            <dl class="col-links ">
                <dt>关注我们</dt>

                <dd><a rel="nofollow" href="https://weibo.com/xiaomishangcheng"   target="_blank">新浪微博</a></dd>

                <dd><a rel="nofollow" href="#J_modalWeixin" data-toggle="modal" >官方微信</a></dd>

                <dd><a rel="nofollow" href="//www.mi.com/about/contact/"   target="_blank">联系我们</a></dd>

            </dl>

            <dl class="col-links ">
                <dt>特色服务</dt>

                <dd><a rel="nofollow" href="//www.mi.com/order/fcode"   target="_blank">F 码通道</a></dd>

                <dd><a rel="nofollow" href="//www.mi.com/order/giftcode"   target="_blank">礼物码</a></dd>

                <dd><a rel="nofollow" href="//order.mi.com/service/imei"   target="_blank">防伪查询</a></dd>

            </dl>

            <div class="col-contact">
                <p class="phone">400-100-5678</p>
                <p>
                    周一至周日 8:00-18:00<br>（仅收市话费）
                </p>
                <a rel="nofollow" class="btn btn-line-primary btn-small" href="//support.kefu.mi.com/" target="_blank"><i class="iconfont">&#xe600;</i> 人工客服</a>            </div>
        </div>
    </div>
</div>
<div class="site-info">
    <div class="container">
        <span class="logo ir">小米官网</span>
        <div class="info-text">
            <p>小米旗下网站：<a href="//www.mi.com/index.html"  target="_blank">小米商城</a><span class="sep">|</span><a href="https://www.miui.com/"  target="_blank">MIUI</a><span class="sep">|</span><a href="https://home.mi.com/index.html"  target="_blank">米家</a><span class="sep">|</span><a href="http://www.miliao.com/"  target="_blank">米聊</a><span class="sep">|</span><a href="https://www.duokan.com/"  target="_blank">多看</a><span class="sep">|</span><a href="http://game.xiaomi.com/"  target="_blank">游戏</a><span class="sep">|</span><a href="http://www.miwifi.com/"  target="_blank">路由器</a><span class="sep">|</span><a href="//www.mi.com/micard/"  target="_blank">米粉卡</a><span class="sep">|</span><a href="https://b.mi.com/?client_id=180100031058&masid=17409.0358"  target="_blank">政企服务</a><span class="sep">|</span><a href="https://xiaomi.tmall.com/"  target="_blank">小米天猫店</a><span class="sep">|</span><a href="//privacy.mi.com/all/zh_CN/"  target="_blank">小米集团隐私政策</a><span class="sep">|</span><a href="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/ded8d0e4a77d.html"  target="_blank">小米商城隐私政策</a><span class="sep">|</span><a href="//www.mi.com/about/user-agreement/"  target="_blank">小米商城用户协议</a><span class="sep">|</span><a href="https://static.mi.com/feedback/"  target="_blank">问题反馈</a><span class="sep">|</span><a href="//www.mi.com/jiancha/"  target="_blank">廉正举报</a><span class="sep">|</span><a href="https://integrity.mi.com/"  target="_blank">诚信合规</a>            </p>
            <p>&copy;
                <a href=" " target="_blank" title="mi.com">mi.com</a> 京ICP证110507号
                <a href="http://beian.miit.gov.cn/" target="_blank" rel="nofollow">京ICP备10046444号</a>
                <a rel="nofollow" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010802020134" target="_blank">京公网安备11010802020134号 </a>
                <a href="//www.mi.com/culture-license/" target="_blank">京网文[2017]1530-131号</a> <br>
                <a href="//www.mi.com/medical/record/" target="_blank">（京）网械平台备字（2018）第00005号
                </a>
                <a href="//www.mi.com/medical/qualification/" target="_blank">互联网药品信息服务资格证 (京) -非经营性-2014-0090
                </a>
                <a href="//www.mi.com/business-license/" target="_blank">营业执照</a>
                <a href="//www.mi.com/medical/list/" target="_blank">医疗器械公告</a>
                <br>
                <a href="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/af5b8ef38e7d57c5ee7fa4289ccf4df8.png" target="_blank">增值电信业务许可证</a>&nbsp;
                网络食品经营备案（京）【2018】WLSPJYBAHF-12  &nbsp;
                <a href="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/fe7383e11127caea371f17156f429a1e.png" target="_blank">食品经营许可证</a>
                <br>违法和不良信息举报电话：171-5104-4404 <a href= 'https://www.mi.com/static/intellectual/index.html' target="_blank">知识产权侵权投诉</a> 本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</p>
        </div>
        <div class="info-links">
            <a href="//privacy.truste.com/privacy-seal/validation?rid=4fc28a8c-6822-4980-9c4b-9fdc69b94eb8&lang=zh-cn" target="_blank"><img src="//i1.mifile.cn/f/i/17/site/truste.png" alt="TRUSTe Privacy Certification" /></a>
            <a href="//search.szfw.org/cert/l/CX20120926001783002010" target="_blank"><img src="//s01.mifile.cn/i/v-logo-2.png" alt="诚信网站" /></a>
            <a href="https://ss.knet.cn/verifyseal.dll?sn=e12033011010015771301369&ct=df&pa=461082" target="_blank"><img src="//s01.mifile.cn/i/v-logo-1.png" alt="可信网站" /></a>
            <a href="http://www.315online.com.cn/member/315140007.html" target="_blank"><img src="//s01.mifile.cn/i/v-logo-3.png" alt="网上交易保障中心" /></a>
            <a href="https://www.mi.com/service/buy/commitment/" target="_blank"><img src="//i8.mifile.cn/b2c-mimall-media/ba10428a4f9495ac310fd0b5e0cf8370.png" alt="诚信经营 放心消费" /></a>

        </div>
    </div>
    <div class="slogan ir">探索黑科技，小米为发烧而生</div>
</div>


</body>
</html>
