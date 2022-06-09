<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1">
  <title>SchoolCMS后台管理系统</title>
  <link rel="stylesheet" type="text/css" href="/css/admin/bootstrap-3/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/assets/css/amazeui.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/amazeui-switch/amazeui.switch.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/amazeui-chosen/amazeui.chosen.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/Common.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/Default/Css/Common.css" />
  <link rel="stylesheet" type="text/css" href="/css/admin/Default/Css/Student.css" />
</head>
<body>

<!-- right content start  -->
<div class="content-right">
  <div class="content">
    <!-- form start -->
    <form class="am-form view-list" action="{:url('index')}" method="POST">
      <div class="am-g">
        {if empty($keyword)}
        <input type="text" class="am-radius form-keyword" placeholder="商品名" name="keyword"  />
        {else /}
        <input type="text" value="{$keyword}" class="am-radius form-keyword" placeholder="商品名" name="keyword"  />
        {/if}
        <button type="submit" class="am-btn am-btn-secondary am-btn-sm am-radius form-submit">查询</button>
        <label class="fs-12 m-l-5 c-p fw-100 more-submit">
          更多筛选
          <input type="checkbox" name="is_more" value="" id="is_more"  />
          <i class="am-icon-angle-down"></i>
        </label>

        <div class="more-where none">
          <select  class="am-radius c-p m-t-10 m-l-5 param-where" name="region_id">
            <option value="">地区</option>
            <option value="谯家镇" >谯家镇</option><option value="印山村" >印山村</option><option value="康家坨" >康家坨</option><option value="水进湾" >水进湾</option><option value="小垫矮" >小垫矮</option><option value="14" >麻池</option><option value="并蛋鸭" >并蛋鸭</option><option value="试试水" >试试水</option><option value="时代复分" >时代复分</option><option value="的方法发" >的方法发</option><option value="sdfsd" >sdfsd</option><option value="鲁竹坝" >鲁竹坝</option><option value="熊家岩" >熊家岩</option><option value="洞下槽" >洞下槽</option><option value="蓼叶村" >蓼叶村</option><option value="张家槽" >张家槽</option>
          </select>

        </div>
      </div>
    </form>
    <!-- form end -->

    <!-- operation start -->
    <div class="am-g m-t-15">
      <a href="{:url('SaveInfo')}" class="am-btn am-btn-secondary am-radius am-btn-xs am-icon-plus"> 新增</a>
      <a href="/admin.php?m=Admin&c=Student&a=ExcelExport" class="am-btn am-btn-success am-btn-xs m-l-10 am-icon-file-excel-o am-radius"> 导出Excel</a>
      <a href="javascript:;" class="am-btn am-btn-primary am-btn-xs m-l-10 am-icon-cloud-upload am-radius" data-am-modal="{target: '#excel-import-win'}"> 导入Excel</a>
      <!-- excel win html start -->
      <div class="am-popup am-radius" id="excel-import-win">
        <div class="am-popup-inner">
          <div class="am-popup-hd">
            <h4 class="am-popup-title">导入Excel</h4>
            <span data-am-modal-close class="am-close">&times;</span>
          </div>
          <div class="am-popup-bd">
            <!-- win form start -->
            <form class="am-form form-validation excel-form" action="/admin.php?m=Admin&c=Student&a=ExcelImport" method="POST" request-type="ajax-fun" request-value="ExcelImportCallback" enctype="multipart/form-data">
              <input type="hidden" name="max_file_size" value="51200000" />
              <div class="am-alert am-radius am-alert-tips m-t-0" data-am-alert>
                <p class="m-b-0"><a href="/admin.php?m=Admin&c=Student&a=ExcelExport&type=format_download" class="cr-blue">Excel格式下载</a><span class="m-r-5"></p>					<p class="m-t-10">1、学生编号由系统自动生成，已存在以往学期中的学生将使用原来的编号。<br />2、报名时间选填项，留空则使用当前导入时间。<br />3、班级二级归类使用[ - ]字符分割。<br />4、所有数据字段以文本格式上传，如[ 身份证号码|电话|报名时间 ]</p>					<p class="cr-red">PS：导入数据建议一次不要超过10万条。</p>
              </div>
              <div class="am-form-group am-form-file">
                <button type="button" class="am-btn am-btn-default am-btn-sm am-radius"><i class="am-icon-cloud-upload"></i> 选择文件</button>
                <input type="file" name="excel" multiple data-validation-message="请选择需要上传的文件" accept="application/vnd.ms-excel" required />
              </div>
              <div class="am-form-group">
                <button type="submit" class="am-btn am-btn-primary am-radius btn-loading-example am-btn-sm w100" data-am-loading="{loadingText:'处理中...'}">确认</button>
              </div>
            </form>
            <!-- win form end -->

            <!-- import tips start -->
            <div class="am-alert am-alert-success am-radius excel-import-success none">导入成功 <strong>0</strong> 条</div>
            <div class="am-panel am-panel-danger am-radius excel-import-error none">
              <div class="am-panel-hd p-l-10">导入失败 <strong>0</strong>  条</div>
              <table class="am-table"><tbody></tbody></table>
            </div>
            <!-- import tips end -->
          </div>
        </div>
      </div>
      <!-- excel win html end -->        </div>
    <!-- operation end -->

    <!-- list start -->
    <table class="am-table am-table-striped am-table-hover am-text-middle m-t-10 m-l-5">
      <thead>
      <tr>
        <th>商品名称</th>
        <th class="am-hide-sm-only"></th>
        <th>图片</th>
        <th class="am-hide-sm-only"></th>
        <th class="am-hide-sm-only"></th>
        <th>更多</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      {foreach $details as $ds}
      <tr id="data-list-57-522228199102111999">
        <td>{$ds.name}</td>
        <td class="am-hide-sm-only"></td>
        <td><img style="width: 30px;height: 30px;" src="__PUBLIC__/image/{$ds.image}">{$ds.image}</td>
        <td class="am-hide-sm-only"></td>
        <td class="am-hide-sm-only"></td>
        <td>
          <span class="am-icon-caret-down c-p" data-am-modal="{target: '#my-popup57'}"> 查看更多</span>
          <div class="am-popup am-radius" id="my-popup57">
            <div class="am-popup-inner">
              <div class="am-popup-hd">
                <h4 class="am-popup-title">商品简介</h4>
                <span data-am-modal-close class="am-close">&times;</span>
              </div>
              <div class="am-popup-bd">
											<textarea rows="" cols="190px" disabled >
												{$ds.description}
											</textarea>
              </div>
            </div>
          </div>
        </td>
        <td class="view-operation">
          <!-- <a href="{:url('')}">
              <button class="am-btn am-btn-default am-btn-xs am-radius am-icon-line-chart" data-am-popover="{content: '录成绩', trigger: 'hover focus'}"></button>
          </a> -->
          <a href="{:url('Save',array('id'=>$ds.d_id))}">
            <button class="am-btn am-btn-default am-btn-xs am-radius am-icon-edit" data-am-popover="{content: '编辑', trigger: 'hover focus'}"></button>
          </a>
          <a href="{:url('delete',array('id'=>$ds.d_id))}">
            <button class="am-btn am-btn-default am-btn-xs am-radius am-icon-trash-o" onclick="if(confirm('确认删除？')==false)return false;" data-url="/admin.php?m=Admin&c=Student&a=Delete" data-am-popover="{content: '删除', trigger: 'hover focus'}" data-id=""></button>
          </a>
        </td>
      </tr>
      {/foreach}
      </tbody>
    </table>
    <!-- list end -->

    <!-- page start -->
    <ul class="am-pagination am-pagination-centered">
      <!-- <li class="am-disabled">
          <a href="/admin.php?m=Admin&c=Student&a=Index&page=0" class="am-radius">&laquo;</a>
      </li>
      <li class="am-active">
          <a class="am-radius">1</a>
      </li>
      <li>
          <a href="/admin.php?m=Admin&c=Student&a=Index&page=2" class="am-radius">2</a>
      </li>
      <li>
          <a href="/admin.php?m=Admin&c=Student&a=Index&page=2" class="am-radius">&raquo;</a>
      </li> -->
      {$details->render()}
    </ul>
    <!-- page end -->
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
<script type="text/javascript" src="/js/admin/Default/Js/Student.js"></script>

<!-- excel win js start -->
<script>
  /**
   * [ExcelImportCallback excel导入回调（公共表单方法校验需要放在这里，不能校验其它文件的方法）]
   * @author   Devil
   * @blog     http://gong.gg/
   * @version  0.0.1
   * @datetime 2017-02-11T21:46:50+0800
   * @param    {[object]}    data [回调数据]
   */
  function ExcelImportCallback(data)
  {
    if(data.code == 0)
    {
      // 成功
      if(data.data.success > 0)
      {
        $('.excel-import-success').removeClass('none');
        $('.excel-import-success').find('strong').text(data.data.success);
      } else {
        $('.excel-import-success').addClass('none');
      }

      // 失败
      if(data.data.error.length == 0)
      {
        $('.excel-import-error').addClass('none');
      } else {
        $('.excel-import-error').removeClass('none');
        $('.excel-import-error').find('strong').text(data.data.error.length);
        var html = '';
        for(var i in data.data.error)
        {
          html += '<tr><td>'+data.data.error[i]+'</td></tr>';
        }
        $('.excel-import-error').find('table tbody').html(html);
      }
    } else {
      Prompt(data.msg);
    }
    $.AMUI.progress.done();
    $('.form-validation').find('button[type="submit"]').button('reset');
  }
</script>
<!-- excel win js end -->