<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1">
    <title>CMS后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="/css/admin/bootstrap-3/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/css/admin/assets/css/amazeui.css" />
    <link rel="stylesheet" type="text/css" href="/css/admin/amazeui-switch/amazeui.switch.css" />
    <link rel="stylesheet" type="text/css" href="/css/admin/amazeui-chosen/amazeui.chosen.css" />
    <link rel="stylesheet" type="text/css" href="/css/admin/Common.css" />
    <link rel="stylesheet" type="text/css" href="/css/admin/Default/Css/Common.css" />
    <link rel="stylesheet" type="text/css" href="/css/admin/Default/Css/Student.css" />
<body>

<!-- right content start  -->
<div class="content-right">
    <div class="content">
        <!-- form start -->
        <form class="am-form view-save" id="f1" action="" method="POST"  enctype="multipart/form-data" request-type="ajax-url">
            <legend>
				<span class="fs-16">
					商品添加									</span>
                <a href="/commodity/index/1" class="fr fs-14 m-t-5 am-icon-mail-reply"> 返回</a>
            </legend>
            <div class="am-form-group">
                <label>分类</label>
                <select name="cid" class="am-radius c-p" required>
                    <option value="">可选择...</option>
                    <c:forEach items="${classifyList}" var="cs">
                    <option value="${cs.id}" >${cs.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="am-form-group">
                <label>商品名称 </label>
                <input type="text" name="name" placeholder="商品名称" minlength="2" maxlength="16" data-validation-message="姓名格式 2~16 个字符" class="am-radius"  required />
            </div>
            <div class="am-form-group">
                <label>商品简介</label>
                <textarea name="description" required></textarea>
            </div>
            <div class="am-form-group">
                <label>商品图片</label>
                <input type="file" name="cover" required>
            </div>
            <div class="am-form-group">
                <button type="button" id="save" class="am-btn am-btn-primary am-radius btn-loading-example am-btn-sm w100" data-am-loading="{loadingText:'处理中...'}">保存</button>
            </div>
        </form>
        <!-- form end -->
    </div>
</div>
<!-- right content end  -->

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
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/layer/layer.js"></script>
<script type="text/javascript" src="/css/admin/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="/js/admin/echarts/echarts.min.js"></script>

<script>
    $("#save").click(function () {
        var formData = new FormData($("#f1")[0]);
        $.ajax({
            url:'/commodity/add',
            type:'post',
            data:formData,
            cache: false, //上传文件不需要缓存
            processData: false, // 告诉jQuery不要去处理发送的数据
            contentType: false, // 告诉jQuery不要去设置Content-Type请求头
            success:function(data){
                console.log(data);
                // 设置图片预览功能
                if(data.code==1){
                    layer.msg(data.msg);
                    setTimeout(function(){
                        window.location.href='/commodity/index/1';
                    },2000);
                }else{
                    layer.msg(data.msg);
                    setTimeout(function(){
                        window.location.href='/commodity/save_info';
                    },2000);
                }
            }
        })
    });
</script>

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
<script type="text/javascript" src="/js/admin/Default/Js/Student.js"></script><!-- footer end -->