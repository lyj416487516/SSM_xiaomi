<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="author" content="order by dede58.com"/>
	<title>会员登录</title>
	<link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/image/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<script src="../../../js/jquery-3.6.0.min.js"></script>
<script src="../../../js/layer/layer.js"></script>
<script src="../../../js/md5.js"></script>
<script src="../../../js/DD_belatedPNG_0.0.8a-min.js"></script>
<body>
<!-- login -->
<div class="top center">
	<div class="logo center">
		<a href="/index.jsp" target="_blank"><img src="/image/mistore_logo.png" alt=""></a>
	</div>
</div>
<form method="post" action="javascript:;" class="form center">
	<div class="login">
		<div class="login_center">
			<div class="login_top">
				<div class="left fl">会员登录</div>
				<div class="right fr">您还不是我们的会员？<a href="/user/register" target="_self">立即注册</a></div>
				<div class="clear"></div>
				<div class="xian center"></div>
			</div>
			<div class="login_main center">
				<div class="username">用户名:&nbsp;<input class="shurukuang" id="username" type="text" name="userName" placeholder="请输入你的用户名"/></div>
				<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang" required id="password" type="password" name="userPassword" placeholder="请输入你的密码"/></div>
				<div class="username">
					<div class="left fl">验证码:&nbsp;<input class="yanzhengma" type="text" name="yanzhengma" placeholder="请输入验证码"/></div>
					<div class="right fl">
<%--						<img src="/image/yanzhengma.jpg">--%>
						<img id="img1" title="点击获取新验证码" src="<%=path%>/verifycode/getVerifyCodeImage" onclick="changeimg()" width="98" height="40" alt="" style="display:inline-block;">
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="login_submit">
				<input class="submit"  id="loginFrom" type="submit" name="submit" value="立即登录" >
			</div>

		</div>
	</div>
</form>
<footer>
	<div class="copyright">简体 | 繁体 | English | 常见问题</div>
	<div class="copyright">小米公司版权所有-京ICP备10046444-<img src="/image/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>

</footer>
<script language="javascript" type="text/javascript">
	function changeimg(){
		var img=document.getElementById("img1");
		//防止页面缓存
		img.src="<%=path%>/verifycode/getVerifyCodeImage?num"+Math.random();
	}
	DD_belatedPNG.fix('div, ul, img, li, input,p,ul,ol,h1,h2,h3,a,span,i');
</script>
<script>
	$('#loginFrom').click(function () {
		$.ajax({
			url:"/user/checkLogin",
			type:"post",
			dataType:"json",
			data:{
				"username":$("#username").val(),
				"password":hex_md5($("#password").val()),
				"yanzhengma":$(".yanzhengma").val()
			},
			success:function(data){
				if (data.code == 1) {
					layer.msg(data.msg);
					setTimeout(function(){
						window.location.href='/index/index';
					},2000);
				} else {
					layer.msg(data.msg);
				}
			},
			error:function(){
				console.log("请求error");
			}
		})
	});
</script>

</body>
</html>