<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="author" content="order by dede58.com"/>
  <title>小米6立即购买-小米商城</title>
  <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon">
  <link rel="icon" href="/image/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>
<style>
  .div{
    display: -webkit-flex;
    display: flex;
    -webkit-flex-direction: column;
    flex-direction: column;
    display: flex;
    width: 46%;
    height:100%;
    background: rgb(248,248,248);
    float: right;
  }
  .div1{
    width: 97%;
    height:50%;
    margin:10px;
    display: -webkit-flex;
    display: flex;
    -webkit-flex-wrap: wrap;
    flex-wrap: wrap;
  }
  .div2{
    width: 100%;
    height:50%;
    margin:10px;
  }
  .div3{
    width: 100%;
    margin:10px;
    display: -webkit-flex;
    display: flex;
    -webkit-flex-wrap: wrap;
    flex-wrap: wrap;
  }
  .div4{
    width: 39%;
    border: 1px solid;
    text-align: center;
    padding:10px;
    margin:17px;
  }
  .div5{
    width: 43%;
    text-align: center;
    padding:10px;
    margin:10px;
  }
  .fontsize{
    font-size: 20px;
  }
  .yuandian {
    display: inline-block;
    height: 15px;
    width: 15px;
    border-radius: 50%;
  }
  .div4:hover{
    color:red;
    border-color:red;
    cursor: pointer;
  }
  .inp{
    border:0px;
    width: 30%;
    height: 50px;
    background:#ff6700;
  }
  .inp:hover{
    border:0px;
    width: 29%;
    height: 48px;
    background:#ff6700;
  }
  .fontweight{
    font-weight:bold;
    color:white;
  }
  span{
    font-size: 14px;
  }
  .yanse{
    color:red;
    border-color:red;
  }
  .jinyong{
    pointer-events:none;
    color:gray;
    border-color:gray;
  }

</style>
<body>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/layer/layer.js"></script>
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
      <div class="gouwuche fr"><a href="{:url('shopping_cart/index')}">购物车</a></div>
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
  <a href="/static/index.html" target="_blank"><div class="logo fl"></div></a>
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


<!-- xiangqing -->
<form action="post" method="">
  <div class="xiangqing">
    <div class="neirong w">
      <div class="xiaomi6 fl">${shop.name}</div>
      <nav class="fr">
        <li><a href="">概述</a></li>
        <li>|</li>
        <li><a href="">变焦双摄</a></li>
        <li>|</li>
        <li><a href="">设计</a></li>
        <li>|</li>
        <li><a href="">参数</a></li>
        <li>|</li>
        <li><a href="">F码通道</a></li>
        <li>|</li>
        <li><a href="">用户评价</a></li>
        <div class="clear"></div>
      </nav>
      <div class="clear"></div>
    </div>
  </div>
  <script>
    function replacepos(text,start,stop,replacetext){
      mystr = text.substring(0,stop-1)+replacetext+text.substring(stop+1);
      return mystr;
    }
  </script>
  <div class="jieshao mt20 w" style="height: 100%">
    <div class="left fl"><img style="width: 560px;height: 560px;" src="/image/${shop.image}"></div>
    <div class="div">
      <div class="div1">
        <div class="div2"><h3>${shop.name}</h3></div>
        <div class="div2">${shop.description}</div>
        <div class="div2" style="color:#ff6700;">${shop.money}元起</div>

        <div class="div2 fontsize">选择版本</div>
        <div class="div3">
          <c:choose>
            <c:when test="${edition != null}"><!-- 如果 -->

              <c:forEach items="${edition}" var="ed">
                <c:choose>
                  <c:when test="${ed.name == initShop.ename}">
                    <div class="div4 yanse" id="edition${ed.id}">
                  </c:when>
                  <c:otherwise>
                    <div class="div4" id="edition${ed.id}">
                  </c:otherwise>
                </c:choose>
                  <span >${ed.name}</span>
<%--                  <span style="margin-left:5px;">${ed.price}元</span>--%>
                </div>
                <script>
                  $('#edition${ed.id}').click(function(){
                    $('#bb').html('${ed.name}');
                    $("#ed").val(${ed.id});
                    let ed = $("#ed").val();
                    let cr = $("#cr").val();
                    let edcr = ed+","+cr;
                    $.ajax({
                      type:'post',
                      url:"/shop/edition",
                      dataType:'json',
                      data:{
                        'id':${shop.id},
                        'eid':edcr
                      },
                      success: function(res){
                        $('#jg').html(res.data.sum+'元');
                        $('#zj').html(res.data.sum);
                        if (res.data.stock != 0) {
                          $("#gwc").show();
                          $("#kcbz").hide();
                        } else {
                          $("#gwc").hide();
                          $("#kcbz").show();
                        }
                      }
                    });
                  });
                </script>
              </c:forEach>
            </c:when>
          </c:choose>



        </div>

        <div class="div2 fontsize">选择颜色</div>
        <div class="div3">
          <c:choose>
            <c:when test="${color != null}"><!-- 如果 -->

              <c:forEach items="${color}" var="cr">
                <c:choose>
                  <c:when test="${cr.name == initShop.cname}">
                    <div class="div4 yanse" id="color${cr.id}">
                  </c:when>
                  <c:otherwise>
                    <div class="div4" id="color${cr.id}">
                  </c:otherwise>
                </c:choose>
                <span >${cr.name}</span>
<%--                  <span style="margin-left:5px;">${cr.price}元</span>--%>
                </div>
                <script>
                  $('#color${cr.id}').click(function(){
                    $('#ys').html('${cr.name}');
                    $("#cr").val(${cr.id});
                    let ed = $("#ed").val();
                    let cr = $("#cr").val();
                    let edcr = ed+","+cr;
                    $.ajax({
                      type:'post',
                      url:"/shop/edition",
                      dataType:'json',
                      data:{
                        'id':${shop.id},
                        'eid':edcr
                      },
                      success: function(res){
                        $('#jg').html(res.data.sum+'元');
                        $('#zj').html(res.data.sum);
                        if (res.data.stock != 0) {
                          $("#gwc").show();
                          $("#kcbz").hide();
                        } else {
                          $("#gwc").hide();
                          $("#kcbz").show();
                        }
                      }
                    });
                  });
                </script>
              </c:forEach>
            </c:when>
          </c:choose>
        </div>
        <div class="div1" style="background: white;">
          <div class="div2">${initShop.dname} <span id="bb">${initShop.ename}</span> <span id="ys">${initShop.cname}</span><span style="float: right" id="jg">${initShop.price}元</span></div>
          <div class="div2">
            <span class="fontsize" style="color:#ff6700;">总计：<span class="fontsize" id="zj">${initShop.price}</span>元</span>
          </div>
        </div>

          <input class="div5 inp fontsize fontweight" type="button" id="gwc" name="jrgwc"<c:choose><c:when test="${initShop.stock != 0}"> style="display: block" </c:when><c:otherwise> style="display: none" </c:otherwise>  </c:choose> value="加入购物车" />
            <input class="div5 inp fontsize fontweight" type="button" id="kcbz" <c:choose><c:when test="${initShop.stock == 0}"> style="display: block" </c:when><c:otherwise> style="display: none" </c:otherwise></c:choose> name="jrgwc" value="库存不足" />


            <input hidden value="${initShop.eid}" type="text" id="ed">
            <input hidden value="${initShop.cid}" type="text" id="cr">
        <c:choose>
          <c:when test="${username == null}">
            <script>
              $('#gwc').click(function(){
                alert('请先登录');
              });
            </script>
          </c:when>
          <c:otherwise>
            <script>
              $('#gwc').click(function(){
                $.ajax({
                  type:'post',
                  url:"/shop/shoppingcart",
                  dataType:'json',
                  data:{
                    'id':${shop.id},
                    'eid':$("#ed").val(),
                    'cid':$("#cr").val()
                  },
                  success: function(res){
                    if (res.code == 1) {
                      layer.msg(res.msg);
                      setTimeout(function(){
                        window.location.href='/shopcart/index';
                      },2000);
                    } else {
                      layer.msg(res.msg);
                    }
                  }
                });
              });
            </script>
          </c:otherwise>
        </c:choose>

        <script>

            $(".div4").click(function(){
              $(this).addClass("yanse").siblings().removeClass("yanse");
            });

        </script>
      </div>
    </div>
    <div class="clear"></div>
  </div>

</form>
<!-- footer -->
<footer class="mt20 center">

  <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
  <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
  <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

</footer>

</body>
</html>