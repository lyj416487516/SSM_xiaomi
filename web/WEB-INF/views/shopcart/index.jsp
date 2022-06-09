<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <title>我的购物车-小米商城</title>
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>
<body>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/layer/layer.js"></script>
<!-- start header -->
<!--end header -->

<!-- start banner_x -->
<div class="banner_x center">
    <a href="/index/index" target="_blank"><div class="logo fl"></div></a>

    <div class="wdgwc fl ml40">我的购物车</div>
    <div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
    <div class="dlzc fr">
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
<div class="xiantiao"></div>
<div class="gwcxqbj" style="height: 100%;">
    <div class="gwcxd center">
        <div class="top2 center">
            <div class="sub_top fl">
                <input type="checkbox" id="all" value="quanxuan"<c:choose><c:when test="${count == num}">checked="checked"</c:when></c:choose> class="quanxuan" />全选
                <script>
                    $("#all").change(function(){
                        $('#zongji').html('0元');
                    });
                </script>
                <c:forEach items="${shopCartList}" var="list">
                <script>
                    $("#all").change(function(){
                        if(this.checked){
                            var zj = parseFloat($('#zongji').html());
                            var xj = parseFloat($('#xiaoji${list.id}').html());
                            var zh = zj+xj;
                            $('#zongji').html(zh+'元');
                            $('#xuanze').html(${count});
                            $("#list${list.id}").prop("checked", true);
                            <%--$("#sum${list.id}").prop("disabled", true);--%>
                        }else{
                            $('#xuanze').html(0);
                            $('#zongji').html('0元');
                            $("#list${list.id}").prop("checked", false);
                            <%--$("#sum${list.id}").prop("disabled", false);--%>
                        }
                    });
                </script>
                </c:forEach>
            </div>
            <div class="sub_top fl">商品名称</div>
            <div class="sub_top fl">单价</div>
            <div class="sub_top fl">数量</div>
            <div class="sub_top fl">小计</div>
            <div class="sub_top fr">操作</div>
            <div class="clear"></div>
        </div>
        <c:forEach items="${shopCartList}" var="list">
        <div class="content2 center">
            <div class="sub_content fl ">
                <input type="checkbox" name="commodity" id="list${list.id}" value="${list.id}" <c:choose><c:when test="${list.state == 1}">checked="checked"</c:when></c:choose> class="quanxuan" />
                <script>
                    $('#list${list.id}').change(function () {
                        if(this.checked){
                            var zongji = parseFloat($('#zongji').html());
                            var xiaoji = parseFloat($('#xiaoji${list.id}').html());
                            var sum = zongji+xiaoji;
                            $('#zongji').html(sum+'元');
                            var xz = $('#xuanze').html();
                            var num = parseFloat(xz)+1;
                            $('#xuanze').html(num);

                            var fxk=$("input[name=commodity]");
                            var n = 0;
                            for(var i=0; i<fxk.length; i++){
                                if (fxk[i].checked == true) {
                                    n++;
                                }
                            }
                            if (n == ${count}) {
                                $('#all').prop("checked", true);
                            }
                            <%--$("#sum${list.id}").prop("disabled", true);--%>
                        }else{
                            var zongji = parseFloat($('#zongji').html());
                            var xiaoji = parseFloat($('#xiaoji${list.id}').html());
                            var sum = zongji-xiaoji;
                            $('#zongji').html(sum+'元');
                            var xz = $('#xuanze').html();
                            var num = parseFloat(xz)-1;
                            $('#xuanze').html(num);
                            $('#all').prop("checked", false);
                            <%--$("#sum${list.id}").prop("disabled", false);--%>
                        }
                    });
                </script>
            </div>
            <div class="sub_content fl">
                <img style="width: 80px;height: 80px;" src="/image/${list.image}">
            </div>

            <div class="sub_content fl ft20">
                ${list.dname}
                ${list.ename}
                ${list.cname}
            </div>
            <div class="sub_content fl" style="width: 5%;font-size: 14px;" id="danjia${list.id}">${list.price}元</div>
            <div class="sub_content fl">
                <input class="shuliang" id="sum${list.id}" type="number" value="${list.number}" step="1" min="1" max="{$sk.stock}">
                <script>
                    $('#sum${list.id}').change(function () {
                        var num = $(this).val()*parseFloat($('#danjia${list.id}').html());
                        var after =  parseFloat($('#xiaoji${list.id}').html());
                        $('#xiaoji${list.id}').html(num+'元');

                        //再选中后增加减少商品数量总计相应变化
                        if ($('#list${list.id}').prop("checked")) {
                            let zj = parseFloat($('#zongji').html());
                            let dj = parseFloat($('#danjia${list.id}').html());
                            if (num > after) {
                                let incNum = zj+dj;
                                $('#zongji').html(incNum+'元');
                            } else {
                                let decNum = zj-dj;
                                $('#zongji').html(decNum+'元');
                            }
                        }
                    });
                </script>
            </div>
            <div class="sub_content fl" style="width: 5%;font-size: 14px;" id="xiaoji${list.id}">${list.totalPrice}元</div>
            <div class="sub_content fl"><a href="" id="delete${list.id}">×</a></div>
            <script>
                $('#delete${list.id}').click(function(){
                    if(confirm('确认删除？')){
                        $.ajax({
                            type:'post',
                            url:"/shopcart/delete",
                            dataType:'json',
                            data:{
                                'id':${list.id},
                            },
                            success: function(msg){
                                console.log(msg.code);
                            }
                        });
                    } else {
                        return false;
                    }
                });
            </script>
            <div class="clear"></div>
        </div>
        <script>
            $(document).ready(function(){
                $('#jiesuan').click(function(){
                    if ($('#list${list.id}').prop("checked")) {
                        $.ajax({
                            type:'post',
                            url:"/shopcart/Settlement",
                            dataType:'json',
                            data:{
                                'id':${list.id},
                                'num':$('#sum${list.id}').val(),
                                'total_price':parseFloat($('#xiaoji${list.id}').html()),
                                'taf':0
                            },
                            success: function(msg){
                                // if (msg.asd == 1) {

                                // }
                            }
                        });
                    } else {
                        $.ajax({
                            type:'post',
                            url:"/shopcart/Settlement",
                            dataType:'json',
                            data:{
                                'id':${list.id},
                                'taf':1
                            },
                            success: function(msg){


                            }
                        });
                    }

                });
            });
        </script>
        </c:forEach>
    </div>
    <div class="jiesuandan mt20 center">
        <div class="tishi fl ml20">
            <ul>
                <li><a href="{:url('index/index')}">继续购物</a></li>
                <li>|</li>
                <li>共<span><c:choose><c:when test="${count != 0}">${count}</c:when><c:otherwise>0</c:otherwise></c:choose></span>件商品，已选择<span id="xuanze"><c:choose><c:when test="${num != 0}">${num}</c:when><c:otherwise>0</c:otherwise></c:choose></span>件</li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="jiesuan fr">
            <div class="jiesuanjiage fl">合计（不含运费）：<span id="zongji">${total}元</span></div>
            <div class="jsanniu fr">
                <c:choose>
                <c:when test="${!empty shopCartList}">
                    <input class="jsan" id="jiesuan" type="submit" name="jiesuan"  value="去结算"/>
                    <script>
                        $('#jiesuan').click(function(){
                            if ($('#xuanze').html() == 0) {
                                alert('请至少选择一样商品');
                            } else {
                                window.location.href = "/shopcart/confirm";
                            }

                        });
                    </script>
                </c:when>
                <c:otherwise>
                    <input class="jsan" id="jiesuan" type="submit" name="jiesuan" value="马上去购物"/>
                    <script>
                        $('#jiesuan').click(function(){
                            window.location.href = "/index/index";
                        });
                    </script>
                </c:otherwise>
                </c:choose>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>

</div>




<!-- footer -->
<footer class="center">

    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>

</body>
</html>

