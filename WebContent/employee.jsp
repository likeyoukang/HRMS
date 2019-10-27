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
						<a href="admin/index" class="list-group-item"><span class="glyphicon  glyphicon-th-large"></span>&nbsp;控制台</a>
						<a href="candidate/list" class="list-group-item"><span class="glyphicon  glyphicon-briefcase"></span>&nbsp;招聘员工管理</a>
						<a href="employee/list" class="list-group-item   active"><span class="glyphicon  glyphicon-user"></span>&nbsp;员工管理</a>
						<a href="attendance/list" class="list-group-item"><span class="glyphicon  glyphicon-pencil"></span>&nbsp;考勤管理</a>
						<a href="salaryBase/list" class="list-group-item"><span class="glyphicon  glyphicon-usd"></span>&nbsp;薪资管理</a>
						<a href="salaryBonus/list" class="list-group-item"><span class="glyphicon  glyphicon-yen"></span>&nbsp;福利管理</a>
						<a href="admin/list" class="list-group-item"><span class="glyphicon  glyphicon-cog"></span>&nbsp;系统管理</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="right col-xs-10">
			<ol class="breadcrumb">
			  <li><span class="glyphicon  glyphicon-user"></span>&nbsp;考勤管理</li>
			</ol>
			<form action="employee/delbatch" id="enos">
			<input type="hidden" name="cp" value="${page.currentPage}"/>
			<div class="panel panel-info">
				<div class="panel-heading">
					<button class="btn btn-info disabled" id="btnEmpAdd" type="button" data-toggle="modal" data-target="#empAdd">
						<span class="glyphicon glyphicon-cloud-upload"></span> 导入员工
					</button>
					<button class="btn btn-primary disabled" id="btnEmpAdd" type="button" data-toggle="modal" data-target="#empAdd">
						<span class="glyphicon glyphicon-plus"></span> 新增员工
					</button>
					<button class="btn btn-danger" type="button" id="volumnDel">
						<span class="glyphicon glyphicon-trash"></span> 批量删除
					</button>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover table-condensed">
						<tr>
							<th><input type="checkbox" name="" id="selectAll" /></th>
							<th>ID</th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>生日</th>
							<th>联系方式</th>
							<th>部门</th>
							<th>教研室</th>
							<th>岗位职务</th>
							<th>入职日期</th>
							<th>司龄</th>
							<th>籍贯</th>
							<th>民族</th>							
							<th>婚姻状况</th>
							<th>职称</th>
							<th>最高学历</th>
							<th>毕业院校</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${page.list}" var="a">
						<tr>
							<td><input type="checkbox" name="aid" value="${a.id}"/></td>
							<td>${a.id}</td>
							<td>${a.xm }</td>
							<td>${a.xb}</td>
							<td>
								${a.nl }&nbsp;年
							</td>
							<td>
								<fmt:formatDate value="${a.csrq }" pattern="yyyy年MM月dd日"/>	
							</td>
							<td>${a.brsj }</td>
							<td>${a.bm }</td>
							<td>${a.jys }</td>
							<td>${a.gwzw }</td>
							<td>
								<fmt:formatDate value="${a.rzrq }" pattern="yyyy年MM月dd日"/>	
							</td>
							<td>${a.sl }</td>
							<td>${a.jg }</td>
							<td>${a.mz}</td>
							<td>
								<c:if test="${a.hyzk == 0 }">
									未婚
								</c:if>
								<c:if test="${a.hyzk == 1 }">
									已婚
								</c:if>
							</td>
							<td>${a.zc }</td>
							<td>${a.zg_xl }</td>
							<td>${a.zg_byxx}</td>
							<td>
								<a href="" class="upd disabled" data-toggle="modal" data-target="#empUpd">
									<span class="glyphicon glyphicon-zoom-in"></span>
									详情
								</a>
								&nbsp;
								<a href="" class="upd disabled"  data-toggle="modal" data-target="#empUpd">
									<span class="glyphicon glyphicon-edit"></span>
									修改
								</a>
							</td>
						</tr>
						</c:forEach>
					</table>
					<nav class="text-right">
						<ul class="pagination">
						    <li>
						      <a href="employee/list?currentPage=${page.prev}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						   <c:forEach begin="1" end="${page.totalPage}" var="index">
						   		<c:choose>
						   			<c:when test="${page.currentPage eq index }">
									    <li class="active"><a href="#">${index }</a></li>
						   			</c:when>
						   			<c:otherwise>
									    <li><a href="employee/list?currentPage=${index }">${index }</a></li>
						   			</c:otherwise>
						   		</c:choose>				   
						   </c:forEach>
						   
						    <li>
						      <a href="employee/list?currentPage=${page.next}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>				
					</nav>
				</div>
			</div>
			</form>
		</div>
	</div><!-- 	内容区域  end-->
	
	<!-- 	引入js插件 -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="asserts/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="asserts/layer/layer.js"></script>
	<script src="js/comm.js"></script>
	<script>
	$(function(){
		
		if('${result}'){		
			layer.msg('添加成功');
		}
		
		
		//全选
		$('#selectAll').on('click',function(){
			$('input[name=aid]').prop('checked',$(this).prop('checked'));
		})
		
		//异步加载部门列表数据
// 		$.ajax({
// 			type:'get',
// 			url:'dept?method=deptList',
// 			success:function(data){
// 				$('.dlist').empty();
// 				data = JSON.parse(data);
// 				$.each(data,function(i,n){
// 					$('.dlist').append('<option value="'+n.id+'">'+n.dname+'</option>');
// 				})
// 			}
// 		});
		
		
		//批量删除
		$('#volumnDel').on('click',function(){
			var size = $('input[name=aid]:checked').length;
			if(size <= 0){
				layer.msg('请选择需要删除的考勤记录');
				return;
			}
			
			layer.confirm('确认删除选中的'+size+'条记录?',{
				btn:['确认','取消'],
				icon:3
			},function(){
				//提交表单
				$('#enos').submit();
			})
		})
		
})
	</script>
</body>
</html>