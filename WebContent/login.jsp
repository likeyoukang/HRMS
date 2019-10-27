<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>武汉传媒学院人事管理系统-管理员登录</title>
<link rel="stylesheet" href="asserts/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<style>
body{
	background: url("img/p1_bg.jpg") no-repeat;
	background-size: 100% 100%; 
}
.login-box {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 500px;
	height: 300px;
	margin-left: -250px;
	margin-top: -150px;
	color:#fff;
	background:rgba(0,0,0,0.5);
	border: 1px solid #ccc;
}
</style>
</head>
<body>

	<div class="container">
		<div class="login-box">
			<div class="page-header">
				<h3 class="text-center">武汉传媒学院HRMS系统-管理员登录</h3>
			</div>
			<!--表单开始 -->
			<form action="admin/login" method="post" class="col-md-8 col-md-offset-2">
				<div class="form-group">
					<label for="" class="sr-only">账号:</label>
					<div class="input-group">
						<div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
						<input type="text" name="user_name" class="form-control" placeholder="请输入账号" />
					</div>
				</div>
				<div class="form-group">
					<label for="" class="sr-only">密码:</label>
					<div class="input-group">
						<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
						<input type="password" name="user_pwd" class="form-control" placeholder="请输入密码" />
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-primary btn-block">登录</button>
				</div>
				<p class="text-center">武汉传媒学院 &copy; 版权所有 </p>
			</form>
		</div>
	</div>
	<!-- 	引入js插件 -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="asserts/layer/layer.js"></script>
	<c:if test="${msg ne null}">
		<script>
			layer.alert("${msg}",{icon:2});
		</script>
	</c:if>
</body>
</html>