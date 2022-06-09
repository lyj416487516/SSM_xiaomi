<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="zh-CN" xml:lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta charset="UTF-8" />
    <title>订单详情</title>
    <meta name="viewport" content="width=1226" />
    <meta name="description" content="" />
    <meta name="keywords" content="小米商城" />
    <link rel="icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <link rel="stylesheet" href="/css/order_details/base.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/order_details/order-view.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/order_details/main.min.css" />
</head>
<script src="/js/jquery-3.6.0.min.js"></script>
<body>
<div class="site-topbar">
    <div class="container">
        <div class="topbar-nav">
            <a href="//www.mi.com/index.html" >小米商城</a><span class="sep">|</span><a href="https://www.miui.com/" target="_blank">MIUI</a><span class="sep">|</span><a href="https://iot.mi.com/index.html" >IoT</a><span class="sep">|</span><a href="https://i.mi.com/" target="_blank">云服务</a><span class="sep">|</span><a href="https://jr.mi.com?from=micom" target="_blank">金融</a><span class="sep">|</span><a href="https://youpin.mi.com/" target="_blank">有品</a><span class="sep">|</span><a href="https://xiaoai.mi.com/" target="_blank">小爱开放平台</a><span class="sep">|</span><a href="https://qiye.mi.com/" target="_blank">企业团购</a><span class="sep">|</span><a href="https://www.mi.com/aptitude/list/?id=41" target="_blank">资质证照</a><span class="sep">|</span><a href="https://www.mi.com/aptitude/list/" target="_blank">协议规则</a><span class="sep">|</span><a href="//www.mi.com/appdownload/" target="_blank" id="J_downloadapp">下载app</a>
        </div>
        <div class="topbar-cart" id="J_miniCartTrigger">
            <a class="cart-mini" id="J_miniCartBtn" href="//static.mi.com/cart/"><i class="iconfont">&#xe60c;</i>购物车<span class="cart-mini-num J_cartNum"></span></a>
            <div class="cart-menu" id="J_miniCartMenu">
                <div class="loading"><div class="loader"></div></div>
            </div>
        </div>
        <div class="topbar-info" id="J_userInfo">
            <a href="/user/index"
               class="link">用户：${username}</a><span class="sep">|</span><a class="link" href="javascript:if(confirm('确认注销当前用户？')) window.location ='/user/cancellation';">注销</a></a>
        </div>
    </div>
</div>

<div class="site-header">
    <div class="container">
        <div class="header-logo">
            <a class="logo ir" href="//www.mi.com/index.html" title="小米官网">小米官网</a>
        </div>
        <div class="header-nav">
            <ul class="nav-list J_navMainList clearfix">
                <li id="J_navCategory" class="nav-category">
                    <a class="link-category" href="//list.mi.com"><span class="text">全部商品分类</span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript:;"><span class="text">小米手机</span><span class="arrow"></span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript:;"><span class="text">Redmi 红米</span><span class="arrow"></span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript:;"><span class="text">电视</span><span class="arrow"></span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript:;"><span class="text">笔记本</span><span class="arrow"></span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript:;"><span class="text">家电</span><span class="arrow"></span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript:;"><span class="text">路由器</span><span class="arrow"></span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="javascript:;"><span class="text">智能硬件</span><span class="arrow"></span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="https://www.mi.com/service/" ><span class="text">服务</span></a>
                </li>
                <li class="nav-item">
                    <a class="link" href="http://www.xiaomi.cn/" ><span class="text">社区</span></a>
                </li>
            </ul>
        </div>
        <div class="header-search">
            <form id="J_searchForm" class="search-form clearfix" action="//search.mi.com/search" method="get">
                <label for="search" class="hide">站内搜索</label>
                <input class="search-text" type="search" id="search" name="keyword" autocomplete="off" data-search-config="{'defaultWords':[]}" />
                <input type="submit" class="search-btn iconfont" value="&#xe616;" />
                <div class="search-hot-words">

                </div>
            </form>
        </div>
    </div>
</div>


<div class="breadcrumbs">
    <div class="container">
        <a href='//www.mi.com/index.html'>首页</a><span class="sep">&gt;</span><span>订单详情</span>    </div>
</div>

<div class="page-main user-main">
    <div class="container">
        <div class="row">
            <div class="span4">
                <div class="uc-box uc-sub-box">
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">订单中心</h3>
                        </div>
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="/user/order_center">我的订单</a></li>

                                <li><a href="">意外保</a></li>

                                <li><a href="">团购订单</a></li>
                                <li><a href="" data-count="comment" data-count-style="bracket">评价晒单</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">个人中心</h3>
                        </div>
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="/user/index">我的个人中心</a></li>
                                <li><a href="">消息通知<i class="J_miMessageTotal"></i></a></li>
                                <li><a href="">优惠券</a></li>
                                <li><a href="/user/receiving_address">收货地址</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">售后服务</h3>
                        </div>
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="">服务记录</a></li>
                                <li><a href="">申请服务</a></li>
                                <li><a href="">领取快递报销</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="uc-nav-box">
                        <div class="box-hd">
                            <h3 class="title">账户管理</h3>
                        </div>
                        <div class="box-bd">
                            <ul class="uc-nav-list">
                                <li><a href="" target="_blank">个人信息</a></li>
                                <li><a href="" target="_blank">修改密码</a></li>
                                <!-- <li><a href="http://uvip.xiaomi.cn" target="_blank">社区VIP认证</a></li> -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


            <input type="hidden" name="prevCancel" value="false">
            <input type="hidden" name="prevVolun" value="false">
            <div class="span16">

                <div class="uc-box uc-main-box">
                    <div class="uc-content-box order-view-box">
                        <div class="box-hd">
                            <h1 class="title">订单详情</h1>
                            <div class="more clearfix">
                                <h2 class="subtitle">订单号：${order.orderNumber}                        <span class="tag tag-subsidy"></span>
                                </h2>
                                <div class="actions">
                                    <a id="J_cancelOrder" class="btn btn-small btn-line-gray" title="取消订单"  href="javascript:;">取消订单</a><a id="J_payOrder" class="btn btn-small btn-primary" title="立即付款" href="/order_details/payment/${order.orderNumber}" target="_blank">立即付款</a>
                                </div>
                            </div>
                        </div>
                        <div class="box-bd">
                            <div class="uc-order-item uc-order-item-pay">
                                <div class="order-detail">
                                    <div class="order-summary">
                                        <!-- <div class="order-status">
                                                等待付款
                                        </div>
                                        <div class="order-desc">47小时20分后订单将被关闭</div> -->
                                        <div class="order-progress">
                                            <ol class="progress-list clearfix progress-list-5">
                                                <li class="step step-first step-active">
                                                    <div class="progress"><span class="text">下单</span></div>
                                                    <div class="info">01月03日 15:13</div>
                                                </li>
                                                <li class="step">
                                                    <div class="progress"><span class="text">付款</span></div>
                                                    <div class="info"></div>
                                                </li>
                                                <li class="step">
                                                    <div class="progress"><span class="text">配货</span></div>
                                                    <div class="info"></div>
                                                </li>
                                                <li class="step">
                                                    <div class="progress"><span class="text">出库</span></div>
                                                    <div class="info"></div>
                                                </li>
                                                <li class="step step-last">
                                                    <div class="progress"><span class="text">交易成功</span></div>
                                                    <div class="info"></div>
                                                </li>
                                            </ol>
                                        </div>
                                    </div>

                                    <table class="order-items-table">
                                        <c:forEach items="${shopList}" var="splist">
                                        <tr>
                                            <td class="col col-thumb">
                                                <div class="figure figure-thumb">
                                                    <a href="">
                                                        <img src="/image/${splist.image}" width="80" height="80" alt="" />
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="col col-name">
                                                <p class="name">
                                                    <a target="_blank" href="">

                                                        ${splist.dname}
                                                        ${splist.ename}
                                                        ${splist.cname}

                                                    </a>
                                                </p>
                                            </td>
                                            <td class="col col-price">

                                                <p class="price" style="text-align: right;">${splist.price}元 &times; ${splist.number}</p>

                                            </td>
                                            <td class="col col-actions">

                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>


                                <!-- 订金盲约订单 -->


                                <div id="editAddr" class="order-detail-info">

                                    <h3>收货信息</h3>
                                    <table class="info-table">
                                        <tr>
                                            <th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</th>
                                            <td>${order.name}</td>
                                        </tr>
                                        <tr>
                                            <th>联系电话：</th>
                                            <td>${order.tel}</td>
                                        </tr>
                                        <tr>
                                            <th>收货地址：</th>
                                            <td>${order.address}</td>
                                        </tr>
                                    </table>
                                    <div class="actions">
                                        <a class="btn btn-small btn-line-gray J_editAddr" href="#editAddr"
                                           data-get="https://order.mi.com/order/updaterender/orderId/5200103959301501/type/address"
                                           data-update="https://order.mi.com/order/updatehandler/orderId/5200103959301501/type/address">修改</a>
                                    </div>

                                </div>

                                <div id="editTime" class="order-detail-info">
                                    <h3>支付方式</h3>
                                    <table class="info-table">
                                        <tr>
                                            <th>支付方式：</th>
                                            <td>在线支付</td>
                                        </tr>

                                    </table>
                                    <div class="actions">
                                    </div>
                                </div>
                                <div class="order-detail-info">
                                    <h3>发票信息 <span class="invoice-notice hide" id="J_invoicNotice" style="font-size: 14px;margin-left: 14px;color: #e53935;">因发票系统升级，部分订单将延期至8月28日开票，给您带来的不便深感歉意。</span></h3>
                                    <table class="info-table">
                                        <tr>
                                            <th>发票类型：</th>
                                            <td>电子发票</td>
                                        </tr>
                                        <tr>
                                            <th>发票内容：</th>
                                            <td>购买商品明细</td>
                                        </tr>
                                        <tr>
                                            <th>发票抬头：</th>
                                            <td>个人</td>
                                        </tr>
                                    </table>
                                    <div class="actions">
                                        <a class="btn btn-small btn-line-gray hide" href="javascript:void(0);" id="J_resetInvoice">发票换开</a>
                                        <a class="btn btn-small btn-line-gray hide" href="javascript:;" id="J_invoiceExpress">发票物流</a>
                                    </div>

                                    <div class="order-delivery order-delivery-detail" id="J_invoiceExpressDetail">
                                        <p class="delivery-num hide" id="J_invoiceExpressInfo">
                                            物流公司：<a href="{{express_web_site}}" target="_blank">{{express_name}} <i class="iconfont">&#xe615;</i></a>
                                            物流单号：{{express_sn}}
                                        </p>
                                        <p class="delivery-num hide" id="J_invoiceExpressInfoEmpty">
                                            纸质发票物流信息
                                        </p>
                                        <div class="delivery-list-wrapper">
                                            <ul class="delivery-list" id="J_invoiceExpressList">
                                                <li class="loading"><div class="loader"></div></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>


                                <div class="order-detail-total">
                                    <table class="total-table">

                                        <!-- 预售 开始支付定金 -->
                                        <tr>
                                            <th>商品总价：</th>
                                            <td><span class="num">${order.totalPrice}</span>元</td>
                                        </tr>
                                        <tr>
                                            <th>运费：</th>
                                            <td><span class="num">0</span>元</td>
                                        </tr>
                                        <tr>
                                            <th class="total">应付金额：</th>
                                            <td class="total"><span class="num">${order.totalPrice}</span>元</td>
                                        </tr>

                                    </table>
                                </div>


                            </div>
                        </div>
                    </div>
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
        <div class="logo ir">小米官网</div>
        <div class="info-text">
            <p class="sites"><a href="//www.mi.com/index.html"  target="_blank">小米商城</a><span class="sep">|</span><a href="https://www.miui.com/"  target="_blank">MIUI</a><span class="sep">|</span><a href="https://home.mi.com/index.html"  target="_blank">米家</a><span class="sep">|</span><a href="http://www.miliao.com/"  target="_blank">米聊</a><span class="sep">|</span><a href="https://www.duokan.com/"  target="_blank">多看</a><span class="sep">|</span><a href="http://game.xiaomi.com/"  target="_blank">游戏</a><span class="sep">|</span><a href="http://www.miwifi.com/"  target="_blank">路由器</a><span class="sep">|</span><a href="//www.mi.com/micard/"  target="_blank">米粉卡</a><span class="sep">|</span><a href="https://b.mi.com/?client_id=180100031058&masid=17409.0358"  target="_blank">政企服务</a><span class="sep">|</span><a href="https://xiaomi.tmall.com/"  target="_blank">小米天猫店</a><span class="sep">|</span><a href="//privacy.mi.com/all/zh_CN/"  target="_blank">小米集团隐私政策</a><span class="sep">|</span><a href="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/ded8d0e4a77d.html"  target="_blank">小米商城隐私政策</a><span class="sep">|</span><a href="//www.mi.com/about/user-agreement/"  target="_blank">小米商城用户协议</a><span class="sep">|</span><a href="https://static.mi.com/feedback/"  target="_blank">问题反馈</a><span class="sep">|</span><a href="//www.mi.com/jiancha/"  target="_blank">廉正举报</a><span class="sep">|</span><a href="https://integrity.mi.com/"  target="_blank">诚信合规</a>            </p>
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
</div>



</body>
</html>
