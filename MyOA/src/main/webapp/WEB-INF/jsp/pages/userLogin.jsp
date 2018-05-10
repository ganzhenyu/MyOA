<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<meta name="keywords"
	content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link href="${pageContext.request.contextPath}/static/css/style.css"
	rel='stylesheet' type='text/css' />
<!--webfonts-->
<link
	href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet'
	type='text/css'>
<!--//webfonts-->
<script
	src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body>
	<script>
		$(document).ready(function(c) {
			$('.close').on('click', function(c) {
				$('.login-form').fadeOut('slow', function(c) {
					$('.login-form').remove();
				});
			});
		});
	</script>
	<!--SIGN UP-->
	<h1>OA办公管理系统</h1>
	<div class="login-form">
		<div class="close"></div>
		<div class="head-info">
			<label class="lbl-1"> </label> <label class="lbl-2"> </label> <label
				class="lbl-3"> </label>
		</div>
		<div class="clear"></div>
		<div class="avtar">
			<img src="${pageContext.request.contextPath}/static/images/avtar.png" />
		</div>
		<form action="userLogin" method="post">
			<input type="text" name="nr" class="text" value="用户编号"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = '用户编号';}">
			<div class="key">
				<input type="password" name="password" value="" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '';}">
			</div>
			<div style="color: red; text-align: center">${error}</div>
		<div class="signin">
			<input type="submit" value="Login">
		</div>
		</form>
	</div>
	<div class="copy-rights">
		<p>
			Copyright &copy; 2015.Company name All rights reserved.More Templates
			<a href="#" target="_blank" title="甘镇瑜小组">甘镇瑜小组</a>
			- Collect from <a href="#" title="MyOA办公自动化系统"
				target="_blank">MyOA办公自动化系统</a>
		</p>
	</div>
</body>
</html>