<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet"
	href="asserts/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<style>
* {
	border-radius: 0 !important;
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
				<li><a href="#">管理员&nbsp;&nbsp;${user.user_name}</a></li>
				<li><a href="javascript:logout()"><span
						class="glyphicon glyphicon-log-out">&nbsp;</span>安全退出</a></li>
			</ul>
		</div>
	</div>
	<!-- 	顶部导航条 end -->

	<!-- 	内容区域 -->
	<div class="container-fluid">
		<div class="col-xs-2">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<span class="glyphicon  glyphicon-home"></span>&nbsp;操作菜单
				</div>
				<div class="panel-body">
					<div class="list-group">
						<a href="admin/index" class="list-group-item"><span
							class="glyphicon  glyphicon-th-large"></span>&nbsp;控制台</a> <a
							href="candidate/list" class="list-group-item"><span
							class="glyphicon  glyphicon-briefcase"></span>&nbsp;招聘员工管理</a> <a
							href="employee/list" class="list-group-item"><span
							class="glyphicon  glyphicon-user"></span>&nbsp;员工管理</a> <a
							href="attendance/list" class="list-group-item"><span
							class="glyphicon  glyphicon-pencil"></span>&nbsp;考勤管理</a> <a
							href="salaryBase/list" class="list-group-item"><span
							class="glyphicon  glyphicon-usd"></span>&nbsp;薪资管理</a> <a
							href="salaryBonus/list" class="list-group-item"><span
							class="glyphicon  glyphicon-yen"></span>&nbsp;福利管理</a> <a
							href="system.jsp" class="list-group-item active"><span
							class="glyphicon  glyphicon-cog"></span>&nbsp;系统管理</a>
					</div>
				</div>
			</div>
		</div>

		<div class="right col-xs-10">
			<ol class="breadcrumb">
				<li><span class="glyphicon  glyphicon-cog"></span>&nbsp;系统管理</li>
			</ol>

			<div class="panel panel-info">
				<div class="panel-heading">修改当前账号密码</div>
				<div class="panel-body">
					<form action="admin/updatePwd" id="formPwd" class="form-horizontal" method="post">
						<div class="form-group">
							<label for="oldpwd" class="col-sm-1 control-label">原始密码</label>
							<div class="col-sm-3">
								<input type="password" class="form-control" name="oldpwd"
									id="oldpwd" placeholder="请输入原始密码" />
							</div>
						</div>
						<div class="form-group">
							<label for="newpwd" class="col-sm-1 control-label">新密码</label>
							<div class="col-sm-3">
								<input type="password" class="form-control" name="newpwd"
									id="newpwd" placeholder="请输入原始密码" />
							</div>
						</div>
						<div class="form-group">
							<label for="repwd" class="col-sm-1 control-label">重复密码</label>
							<div class="col-sm-3">
								<input type="password" class="form-control" name="repwd"
									id="repwd" placeholder="请输入原始密码" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3">
								<button class="btn btn-primary" type="button" id="upd">修改</button>
								<button class="btn btn-warning" type="reset">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>

			<input type="hidden" name="method" value="del" />
			<div class="panel panel-info">
				<div class="panel-heading">权限管理</div>
				<div class="panel-body">
					<table class="table table-striped table-hover ">
						<tr>
							<th>序号</th>
							<th>账号</th>
							<th>添加时间</th>
							<th>状态</th>
							<th>权限管理</th>
						</tr>
						<c:forEach var="u" items="${list }" varStatus="stat">
							<tr>
								<td>${stat.count }</td>
								<td>${ u.user_name}</td>
								<td><fmt:formatDate value="${u.record_time }"
										pattern="yyyy年MM月dd日 HH时mm分ss秒" /></td>
								<td><c:if test="${u.status == 0}">
							 		<span class="label label-danger">禁用</span>
							 	</c:if> <c:if test="${u.status == 1}">
							 		<span class="label label-success">启用</span>
							 	</c:if></td>
								<td><c:if test="${u.status == 0}">
										<a href="javascript:modify(1,${u.id })"> <span
											class="glyphicon glyphicon-pencil"></span> 点击启用
										</a>
									</c:if> <c:if test="${u.status == 1}">
										<a href="javascript:modify(0,${u.id })"> <span
											class="glyphicon glyphicon-pencil"></span> 点击禁用
										</a>
									</c:if></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 	内容区域  end-->

	<!-- 	引入js插件 -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="asserts/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="asserts/layer/layer.js"></script>
	<script src="js/comm.js"></script>
	<script>
	$(function(){
		
		if('${param.msg}'){		
			layer.msg('${param.msg}');
		}
		
		/*确认修改按钮*/
		$('#upd').on('click',function(){
			if($('#newpwd').val() != $('#repwd').val()){
				layer.msg('两次密码不一致!');
				return false;
			}
			$('#formPwd').attr('method','post');
			$('#formPwd').submit();
		})
	})
	
	function modify(stat,id){
		var msg = stat == 0?'禁用' : '启用';
		layer.confirm('是否'+msg+'账号',{
			btn:['确定','取消'],
			icon:3
		},function(){
			location.href='admin/updateStatus?status='+stat+"&id="+id;
		})
	}
	</script>
</body>
</html>