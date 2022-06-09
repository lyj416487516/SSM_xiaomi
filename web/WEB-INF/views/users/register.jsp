<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf8");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="author" content="order by dede58.com"/>
	<title>用户注册</title>
	<link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/image/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="/css/login.css">

</head>
<script src="../../../js/jquery-3.6.0.min.js"></script>
<script src="../../../js/layer/layer.js"></script>
<script src="../../../js/md5.js"></script>
<script src="../../../js/DD_belatedPNG_0.0.8a-min.js"></script>
<body>
<form  method="post" action="javascript:;">
	<div class="regist">
		<div class="regist_center">
			<div class="regist_top">
				<div class="left fl">会员注册</div>
				<div class="right fr"><a href="/index/index" target="_self">小米商城</a></div>
				<div class="clear"></div>
				<div class="xian center"></div>
			</div>
			<div class="regist_main center">
				<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" id="username" type="text" name="userName" placeholder="请输入你的用户名"/><span>请不要输入汉字</span></div>
				<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" required id="password" type="password" name="userPassword" placeholder="请输入你的密码"/><span>请输入6位以上字符</span></div>

				<div class="username">确认密码:&nbsp;&nbsp;<input class="shurukuang" required id="repassword" type="password" name="repassword" placeholder="请确认你的密码"/><span>两次密码要输入一致哦</span></div>
				<div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" id="Phone" type="text" name="Phone" placeholder="请填写正确的手机号"/><span>填写下手机号吧，方便我们联系您！</span></div>
				<div class="username">
					<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="yanzhengma" placeholder="请输入验证码"/></div>
					<div class="right fl">
						<img id="img1" title="点击获取新验证码" src="<%=path%>/verifycode/getVerifyCodeImage" onclick="changeimg()" width="98" height="40" alt="" style="display:inline-block;">
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="regist_submit">
				<input class="submit" id="Register" type="submit" name="submit" value="立即注册" >
			</div>

		</div>
	</div>
</form>

<script language="javascript" type="text/javascript">
	function changeimg(){
		var img=document.getElementById("img1");
		//防止页面缓存
		img.src="<%=path%>/verifycode/getVerifyCodeImage?num"+Math.random();
	}
	DD_belatedPNG.fix('div, ul, img, li, input,p,ul,ol,h1,h2,h3,a,span,i');


	$('#Register').click(function () {
		if ($("#password").val() != '' || $("#repassword").val() != '') {
			$.ajax({
				url:"/user/add_user",
				type:"post",
				dataType:"json",
				data:{
					"username":$("#username").val(),
					"nickname":$("#username").val(),
					"password":hex_md5($("#password").val()),
					"repassword":hex_md5($("#repassword").val()),
					"mobile":$("#Phone").val(),
					"yanzhengma":$(".yanzhengma").val()
				},
				success:function(data){
					if (data.code == 1) {
						layer.msg(data.msg);
						setTimeout(function(){
							window.location.href='/user/login';
						},2000);
					} else {
						layer.msg(data.msg);
					}
				},
				error:function(){
					console.log("请求error");
				}
			})
		}
	});

</script>
</body>
</html>