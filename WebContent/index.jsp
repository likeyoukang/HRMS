<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>武汉传媒学院人事管理系统-【员工管理】</title>
<link rel="stylesheet" href="asserts/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<style>
	*{
		border-radius:0 !important;
	}
	.count{
		text-align: center;
		display:flex;
	}
	.count-item{
		flex:1;
		margin: 0 20px 20px 0;
		height:100px;
		line-height:100px;
		font-size:1.2em;
		color:#fff;
		border:1px solid #fff;
		background: #5cb85c;
		cursor: pointer;
	}
	.count-item:hover{
		background: #4cae4c;
	}
</style>
</head>
<body>
<!-- 	顶部导航条 -->
	<div class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="" class="navbar-brand">武汉传媒学院人事管理系统</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="#">管理员&nbsp;&nbsp;${user.user_name}</a>	
				</li>
				<li>
					<a href="javascript:logout()"><span class="glyphicon glyphicon-log-out">&nbsp;</span>安全退出</a>
				</li>
			</ul>
		</div>
	</div><!-- 	顶部导航条 end -->
	
<!-- 	内容区域 -->
	<div class="container-fluid">
		<div class="col-xs-2">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<span class="glyphicon  glyphicon-home"></span>&nbsp;操作菜单
				</div>
				<div class="panel-body">			
					<div class="list-group">
						<a href="#" class="list-group-item  active"><span class="glyphicon  glyphicon-th-large"></span>&nbsp;控制台</a>
						<a href="candidate/list" class="list-group-item"><span class="glyphicon  glyphicon-briefcase"></span>&nbsp;招聘员工管理</a>
						<a href="employee.jsp" class="list-group-item"><span class="glyphicon  glyphicon-user"></span>&nbsp;员工管理</a>
						<a href="attendance/list" class="list-group-item"><span class="glyphicon  glyphicon-pencil"></span>&nbsp;考勤管理</a>
						<a href="salaryBase/list" class="list-group-item"><span class="glyphicon  glyphicon-usd"></span>&nbsp;薪资管理</a>
						<a href="salaryBonus/list" class="list-group-item"><span class="glyphicon  glyphicon-yen"></span>&nbsp;福利管理</a>
						<a href="admin/list" class="list-group-item"><span class="glyphicon  glyphicon-cog"></span>&nbsp;系统管理</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="right col-xs-10">
			<ol class="breadcrumb" style="margin-top:0">
			  <li><span class="glyphicon  glyphicon-th-large"></span>&nbsp;控制台</li>
			</ol>
			
			<div class="count">
				<a class="count-item" href="candidate/list">
					<span class="glyphicon  glyphicon-briefcase"></span>&nbsp;招聘员工管理
				</a>
				<a class="count-item" href="employee/list">
					<span class="glyphicon  glyphicon-user"></span>&nbsp;员工管理
				</a>
				<a class="count-item" href="attendance/list">
					<span class="glyphicon  glyphicon-pencil"></span>&nbsp;考勤管理
				</a>
				<a class="count-item" href="salaryBase/list">
					<span class="glyphicon  glyphicon-usd"></span>&nbsp;薪资管理
				</a>
				<a class="count-item" href="salaryBonus/list">
					<span class="glyphicon  glyphicon-yen"></span>&nbsp;福利管理
				</a>
				<a class="count-item" href="admin/list">
					<span class="glyphicon  glyphicon-cog"></span>&nbsp;系统管理
				</a>
			</div>
		</div>
	</div><!-- 	内容区域  end-->
	
	<!-- 	引入js插件 -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="asserts/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="asserts/layer/layer.js"></script>
	<script src="js/comm.js"></script>
	
</body>
</html>