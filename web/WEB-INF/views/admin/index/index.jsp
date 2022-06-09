<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1">
  <title>小米商城后台</title>
  <link rel="stylesheet" type="text/css" href="/css/admin/assets/css/amazeui.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/amazeui-switch/amazeui.switch.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/amazeui-chosen/amazeui.chosen.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/Common.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/Default/Css/Common.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/Default/Css/Index.css" />
</head>
<body>
<!-- nav start -->
<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <a href="/admin.php?m=Admin&c=Index&a=Index">
      <h2>xiaomiAdmin<span class="admin-site-vice-name m-l-5">小米商城后台</span></h2>
    </a>
  </div>
  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only am-radius header-nav-submit" data-am-collapse="{target: '#topbar-collapse'}">
    <span class="am-sr-only">导航切换</span>
    <i class="am-icon-bars"></i>
  </button>
  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
      <li class="am-dropdown">
        <a href="http://www.xiaowu.com/" target="_blank" class="tpl-header-list-link">
          <i class="am-icon-home"></i>
          <span>查看首页</span>
        </a>
      </li>

      <li class="am-dropdown am-hide-sm-only">
        <a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link">
          <i class="am-icon-arrows-alt"></i>
          <span class="admin-fulltext" fulltext-open="开启全屏" fulltext-exit="退出全屏">开启全屏</span>
        </a>
      </li>			<li class="am-dropdown common-nav-top" data-am-dropdown data-am-dropdown-toggle>
      <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
        <i class="am-icon-user"></i>
        <span class="tpl-header-list-user-nick">admin</span>
      </a>
      <ul class="am-dropdown-content">
        <li>
          <a href="{:url('User/zhuxiao')}">
            <i class="am-icon-power-off"></i>
            注销
          </a>
        </li>
      </ul>
    </li>
    </ul>
  </div>
</header>
<!-- nav end -->

<!-- content start -->
<div class="admin">
  <!-- left menu start -->
  <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list common-left-menu">
        <!-- <li>
            <a href="javascript:;" data-type="menu" data-url="" class="common-left-menu-active"><span class="am-icon-home"></span> </a>
        </li> -->
        <li class="admin-parent">
          <a data-type="menu" class="am-cf" data-am-collapse="{target: '#power-menu-1'}">
            <span class=""></span> 分类管理
            <i class="am-icon-angle-down am-fr am-margin-right left-menu-more-ico-rotate"></i>
          </a>
        </li>
        <ul class="am-list am-collapse admin-sidebar-sub" id="power-menu-1">
          <li>
            <a href="javascript:;" data-type="menu" data-url="{:url('classify/index')}">商品分类</a>
          </li>
        </ul>
        <li class="admin-parent">
          <a data-type="menu" class="am-cf" data-am-collapse="{target: '#power-menu-2'}">
            <span class=""></span> 商品管理
            <i class="am-icon-angle-down am-fr am-margin-right left-menu-more-ico-rotate"></i>
          </a>
        </li>
        <ul class="am-list am-collapse admin-sidebar-sub" id="power-menu-2">
          <li>
            <a href="javascript:;" data-type="menu" data-url="/commodity/index">商品列表</a>
          </li>
          <li>
            <a href="javascript:;" data-type="menu" data-url="{:url('description/index')}">规格列表</a>
          </li>
          <li>
            <a href="javascript:;" data-type="menu" data-url="{:url('format/index')}">库存列表</a>
          </li>
        </ul>
        <li class="admin-parent">
          <a data-type="menu" class="am-cf" data-am-collapse="{target: '#power-menu-5'}">
            <span class=""></span> 订单管理
            <i class="am-icon-angle-down am-fr am-margin-right left-menu-more-ico-rotate"></i>
          </a>
        </li>
        <ul class="am-list am-collapse admin-sidebar-sub" id="power-menu-5">
          <li>
            <a href="javascript:;" data-type="menu" data-url="{:url('order/index')}">订单列表</a>
          </li>
        </ul>
      </ul>
    </div>
  </div>
  <!-- left menu end -->

  <!-- right content start  -->
  <iframe id="ifcontent" src="{:url('home')}"></iframe>
  <!-- right content end  -->
</div>
<!-- content end -->

<!-- navbar start -->
<a href="javascript:;" class="am-icon-btn am-icon-th-list am-show-sm-only common-nav-bar" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
<!-- navbar end -->

<!-- footer start -->
<!-- commom html start -->
<!-- delete html start -->
<div class="am-modal am-modal-confirm" tabindex="-1" id="common-confirm-delete">
  <div class="am-modal-dialog am-radius">
    <div class="am-modal-bd">你，确定要删除这条记录吗？</div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确认</span>
    </div>
  </div>
</div>
<!-- delete html end -->
<!-- commom html end -->
</body>
</html>

<!-- 类库 -->
<script type="text/javascript" src="/js/admin/jquery/jquery-2.1.0.js"></script>
<script type="text/javascript" src="/css/admin/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="/js/admin/echarts/echarts.min.js"></script>

<!-- ueditor 编辑器 -->
<script type="text/javascript" src="/js/admin/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/js/admin/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="/js/admin/ueditor/lang/zh-cn/zh-cn.js"></script>

<!-- 颜色选择器 -->
<script type="text/javascript" src="/js/admin/colorpicker/jquery.colorpicker.js"></script>

<!-- 元素拖拽排序插件 -->
<script type="text/javascript" src="/js/admin/dragsort/jquery.dragsort-0.5.2.min.js"></script>

<!-- amazeui插件 -->
<script type="text/javascript" src="/css/admin/amazeui-switch/amazeui.switch.min.js"></script>
<script type="text/javascript" src="/css/admin/amazeui-chosen/amazeui.chosen.min.js"></script>

<!-- 项目公共 -->
<script type="text/javascript" src="/js/admin/Common.js"></script>

<!-- 控制器 -->
<script type="text/javascript" src="/js/admin/Default/Js/Index.js"></script>
<!-- footer end -->