<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="zh-CN" xml:lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" >
    <meta charset="UTF-8" />
    <title>选择在线支付方式</title>
    <meta name="viewport" content="width=1226" />
    <link rel="icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <link rel="stylesheet" href="/css/payment/base.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/payment/pay-confirm.min.css" />
</head>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/layer/layer.js"></script>
<body>
<div class="site-header site-mini-header">
    <div class="container">
        <div class="header-logo">
            <a class="logo " href="//www.mi.com/index.html" title="小米官网"></a>
        </div>
        <div class="header-title" id="J_miniHeaderTitle"></div>
        <div class="topbar-info" id="J_userInfo">
            <c:choose>
                <c:when test="${username != null}">
                    <a class="link" href="/user/index">用户：${username}</a><span class="sep">|</span><a  class="link" href="/user/order_center">我的订单</a><span class="sep">|</span><a class="link" href="javascript:if(confirm('确认注销当前用户？')) window.location ='/user/cancellation';">注销</a>
                </c:when>
                <c:otherwise>
                    <a class="link" href="/user/login">登录</a><span class="sep">|</span><a class="link" href="/user/register">注册</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>


<div class="page-main">
    <div class="container confirm-box">
        <form target="_blank" action="#" id="J_payForm" method="post">
            <div class="section section-order">
                <div class="order-info clearfix">
                    <div class="fl">
                        <h2 class="title">订单提交成功！去付款咯～</h2>
                        <p class="order-time" id="J_deliverDesc"></p>
                        <p class="order-time">请在<span class="pay-time-tip">0小时14分</span>内完成支付, 超时后将取消订单</p>
                        <p class="post-info" id="J_postInfo">
                            收货信息：${order.name} ${order.tel} &nbsp;&nbsp;
                            ${order.address}                            </p>
                    </div>
                    <div class="fr">
                        <p class="total">
                            应付总额：<span class="money"><em id="money">${order.totalPrice}</em>元</span>
                        </p>
                        <a href="javascript:;" class="show-detail" id="J_showDetail">订单详情<i class="iconfont">&#xe61c;</i></a>
                        <script>
                            $(".show-detail").click(function () {
                                $(".order-detail").slideToggle("slow");
                            });
                        </script>

                    </div>
                </div>
                <i class="iconfont icon-right">&#x221a;</i>
                <div class="order-detail">
                    <ul>
                        <li class="clearfix">
                            <div class="label">订单号：</div>
                            <div class="content">
                                <span class="order-num">
                                    ${order.orderNumber}                                </span>
                            </div>
                        </li>
                        <li class="clearfix">
                            <div class="label">收货信息：</div>
                            <div class="content">
                                ${order.name} ${order.tel}&nbsp;&nbsp;
                                ${order.address}
                            </div>
                        </li>
                        <li class="clearfix">
                            <div class="label">商品名称：</div>
                            <div class="content">
                                <c:forEach items="${shopList}" var="splist">
                                ${splist.dname}
                                ${splist.ename}
                                ${splist.cname}
                                <br/>
                                </c:forEach>
                            </div>
                        </li>
                        <li class="clearfix hide">
                            <div class="label">配送时间：</div>
                            <div class="content">
                                不限送货时间                            </div>
                        </li>
                        <li class="clearfix">
                            <div class="label">发票信息：</div>
                            <div class="content">
                                电子发票 个人                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="section section-payment">
                <div class="cash-title" id="J_cashTitle">
                    选择以下支付方式付款
                </div>

                <div class="payment-box ">
                    <div class="payment-header clearfix">
                        <h3 class="title">支付平台</h3>
                        <span class="desc"></span>
                    </div>
                    <div class="payment-body">
                        <ul class="clearfix payment-list J_paymentList J_linksign-customize">
                            <li class="J_bank" onclick="layer.msg('暂未开放');"><input type="radio" name="payOnlineBank" id="alipay" value="alipay" /> <img src="/image/payOnline_zfb.png" alt="支付宝" style="margin-left: 0;"/></li>
                            <li id="J_weixin" onclick="layer.msg('暂未开放');"><img src="/image/weixinpay.png" alt="微信支付" style="margin-left: 0;"/></li>
                            <li class="J_bank" onclick="layer.msg('暂未开放');"><input type="radio" name="payOnlineBank" id="unionpay" value="unionpay" /> <img src="/image/unionpay.png" alt="银联" style="margin-left: 0;"/></li>
                            <li class="J_bank" id="micashpay"><input type="radio" name="payOnlineBank" id="micash" value="micash" /> <img src="/image/micash.png" alt="小米钱包" style="margin-left: 0;"/></li>
                        </ul>
                        <div class="event-desc">
                            <p>小米钱包：享最高立减99元</p>
                            <a href="//www.mi.com/c/payrule/" class="more" target="_blank">了解更多&gt;</a>
                        </div>
                    </div>
                </div>

                <script>
                    $("#micashpay").click(function () {
                        if(confirm('确认支付？')){
                            $.ajax({
                                type:'post',
                                url:"/order_details/pay",
                                dataType:'json',
                                data:{
                                    'id':${order.id},
                                    'money':parseFloat($('#money').html())
                                },
                                success: function(res){
                                    if (res.code == 1) {
                                        layer.msg(res.msg);
                                        setInterval(function () {
                                            window.location = "/order_details/index/${order.id}";
                                        }, 1000);
                                    } else {
                                        layer.msg(res.msg);
                                    }
                                }
                            });
                        } else {
                            return false;
                        }
                    });
                </script>

        </form>
    </div>
</div>

<!-- 支付提示框 -->
<div class="modal fade modal-hide modal-pay-tip" id="J_payTip" style="display:block;">
    <div class="modal-header">
        <h3>正在支付...</h3>
        <a class="close" data-dismiss="modal" href="javascript:;"><i class="iconfont">&#xe602;</i></a>
    </div>
    <div class="modal-body clearfix">
        <div class="success">
            <h4>支付成功了</h4>
            <p><a href="https://order.mi.com/user/orderView/5200106131704566">立即查看订单详情 &gt;</a></p>
        </div>
        <div class="fail">
            <h4>如果支付失败</h4>
            <p><a href="http://bbs.xiaomi.cn/thread/index/tid/11544653" target="_blank">查看支付常见问题 &gt;</a></p>
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
                <li><a rel="nofollow" href="http://www.mi.com/service/buy/Postal%20policy" target="_blank"><i class="iconfont">&#xe638;</i>满99元包邮（试运行）</a></li>
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

<%--<div id="J_modalWeixin" class="modal fade modal-hide modal-weixin" data-width="480" data-height="520">--%>
<%--    <div class="modal-hd">--%>
<%--        <a class="close" data-dismiss="modal"><i class="iconfont">&#xe602;</i></a>--%>
<%--        <span class="title">小米手机官方微信二维码</span>--%>
<%--    </div>--%>
<%--    <div class="modal-bd">--%>
<%--        <img alt="" src="//i1.mifile.cn/f/i/17/site/weixin.jpg" width="680" height="340" />--%>
<%--    </div>--%>
<%--</div>--%>
<!-- .modal-weixin END -->
<%--<div class="modal modal-hide modal-bigtap-queue" id="J_bigtapQueue">--%>
<%--    <div class="modal-body">--%>
<%--        <span class="close" data-dismiss="modal" aria-hidden="true">退出排队</span>--%>
<%--        <div class="con">--%>
<%--            <div class="title">正在排队，请稍候喔！</div>--%>
<%--            <div class="queue-tip-box">--%>
<%--                <p class="queue-tip">当前人数较多，请您耐心等待，排队期间请不要关闭页面。</p>--%>
<%--                <p class="queue-tip">时常来官网看看，最新产品和活动信息都会在这里发布。</p>--%>
<%--                <p class="queue-tip">下载小米商城 App 玩玩吧！产品开售信息抢先知道。</p>--%>
<%--                <p class="queue-tip">发现了让你眼前一亮的小米产品，别忘了分享给朋友！</p>--%>
<%--                <p class="queue-tip">产品开售前会有预售信息，关注官网首页就不会错过。</p>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="queue-posters">--%>
<%--            <div class="poster poster-3"></div>--%>
<%--            <div class="poster poster-2"></div>--%>
<%--            <div class="poster poster-1"></div>--%>
<%--            <div class="poster poster-4"></div>--%>
<%--            <div class="poster poster-5"></div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- .xm-dm-queue END -->
<%--<div id="J_bigtapError" class="modal modal-hide modal-bigtap-error">--%>
<%--    <span class="close" data-dismiss="modal" aria-hidden="true"><i class="iconfont">&#xe602;</i></span>--%>
<%--    <div class="modal-body">--%>
<%--        <h3>抱歉，网络拥堵无法连接服务器</h3>--%>
<%--        <p  class="error-tip">由于访问人数太多导致服务器压力山大，请您稍后再重试。</p>--%>
<%--        <p >--%>
<%--            <a class="btn btn-primary" id="J_bigtapRetry">重试</a>--%>
<%--        </p>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<div id="J_bigtapModeBox" class="modal fade modal-hide modal-bigtap-mode">--%>
<%--    <span class="close" data-dismiss="modal" ><i class="iconfont">&#xe602;</i></span>--%>
<%--    <div class="modal-body">--%>
<%--        <h3 class="title">为防黄牛，请您输入下面的验证码</h3>--%>
<%--        <p class="desc">在防黄牛的路上，我们一直在努力，也知道做的还不够。<br>--%>
<%--            所以，这次劳烦您多输一次验证码，我们一起防黄牛。</p>--%>
<%--        <div class="mode-loading" id="J_bigtapModeLoading">--%>
<%--            <img src="//i1.mifile.cn/f/i/2014/cn/loading.gif" alt="" width="32" height="32">--%>
<%--            <a  id="J_bigtapModeReload" class="reload  hide" href="javascript:;">网络错误，点击重新获取验证码！</a>--%>
<%--        </div>--%>
<%--        <div class="mode-action hide" id="J_bigtapModeAction">--%>
<%--            <div class="mode-con" id="J_bigtapModeContent"></div>--%>
<%--            <input type="text" name="bigtapmode" class="input-text" id="J_bigtapModeInput" placeholder="请输入正确的验证码">--%>
<%--            <p class="tip" id="J_bigtapModeTip"></p>--%>
<%--            <a class="btn  btn-gray" id="J_bigtapModeSubmit">确认</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- .xm-dm-error END -->--%>
<%--<div id="J_modal-globalSites" class="modal fade modal-hide modal-globalSites" data-width="640">--%>
<%--    <div class="modal-hd">--%>
<%--        <a class="close" data-dismiss="modal"><i class="iconfont">&#xe602;</i></a>--%>
<%--        <span class="title">Select Region</span>--%>
<%--    </div>--%>
<%--    <div class="modal-bd">--%>
<%--        <h3>Welcome to Mi.com</h3>--%>
<%--        <p class="modal-globalSites-tips">Please select your country or region</p>--%>
<%--        <p class="modal-globalSites-links clearfix">--%>

<%--            <a href="//www.mi.com/hk/">Hong Kong</a>--%>
<%--            <a href="//www.mi.com/tw/">Taiwan</a>--%>
<%--            <a href="//www.mi.com/sg/">Singapore</a>--%>
<%--            <a href="//www.mi.com/my/">Malaysia</a>--%>
<%--            <a href="//www.mi.com/ph/">Philippines</a>--%>
<%--            <a href="//www.mi.com/in/">India</a>--%>
<%--            <a href="//www.mi.com/id/">Indonesia</a>--%>
<%--            <a href="//www.mi.com/global/">Global Home</a>--%>
<%--            <a href="//www.mi.com/mena/">MENA</a>--%>
<%--            <a href="//www.mi.com/pl/">Poland</a>--%>
<%--            <a href="//www.mi.com/ua/">Ukraine</a>--%>
<%--            <a href="//www.mi.com/ru/">Russia</a>--%>
<%--            <a href="//www.mi.com/vn/">Vietnam</a>--%>
<%--            <a href="//www.mi.com/mx/">Mexico</a>--%>
<%--            <a href="//www.mi.com/kr/">Korea</a>--%>
<%--            <a href="//www.mi.com/eg/">Egypt</a>--%>
<%--            <a href="//www.mi.com/th/">Thailand</a>--%>
<%--            <a href="//www.mi.com/es/">Spain</a>--%>
<%--            <a href="//www.mi.com/us/">United States</a>--%>
<%--            <a href="//www.mi.com/it/">Italy</a>--%>
<%--            <a href="//www.mi.com/fr/index.html">France</a>--%>
<%--            <a href="//www.mi.com/bd/">Bangladesh</a>--%>
<%--            <a href="//www.mi.com/uk/">United Kingdom</a>--%>
<%--            <a href="//www.mi.com/cl/">Chile</a>--%>
<%--            <a href="//www.mi.com/np/">Nepal</a>--%>
<%--            <a href="//www.mi.com/lk/">Sri Lanka</a>--%>
<%--            <a href="//www.mi.com/tr/">Turkey</a>--%>
<%--            <a href="//www.mi.com/nl/">Netherlands</a>--%>
<%--            <a href="//www.mi.com/br/">Brazil</a>--%>
<%--        </p>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</html>