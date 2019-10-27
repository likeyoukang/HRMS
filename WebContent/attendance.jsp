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
<title>武汉传媒学院人事管理系统-【考勤管理】</title>
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
						<a href="employee/list" class="list-group-item"><span class="glyphicon  glyphicon-user"></span>&nbsp;员工管理</a>
						<a href="attendance/list" class="list-group-item  active"><span class="glyphicon  glyphicon-pencil"></span>&nbsp;考勤管理</a>
						<a href="salaryBase/list" class="list-group-item"><span class="glyphicon  glyphicon-usd"></span>&nbsp;薪资管理</a>
						<a href="salaryBonus/list" class="list-group-item"><span class="glyphicon  glyphicon-yen"></span>&nbsp;福利管理</a>
						<a href="admin/list" class="list-group-item"><span class="glyphicon  glyphicon-cog"></span>&nbsp;系统管理</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="right col-xs-10">
			<ol class="breadcrumb">
			  <li><span class="glyphicon  glyphicon-pencil"></span>&nbsp;考勤管理</li>
			</ol>
			<form action="attendance/delbatch" id="enos">
			<input type="hidden" name="cp" value="${page.currentPage}"/>
			<div class="panel panel-info">
				<div class="panel-heading">
					<button class="btn btn-primary" id="btnEmpAdd" type="button" data-toggle="modal" data-target="#empAdd">
						<span class="glyphicon glyphicon-plus"></span> 新增考勤
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
							<th>院部(部门)</th>
							<th>公出时间</th>
							<th>忘打卡次数</th>
							<th>迟到次数</th>
							<th>早退次数</th>
							<th>旷工天数</th>
							<th>事假天数</th>
							<th>病假天数</th>
							<th>产假/护理假天数</th>
							<th>婚假天数</th>
							<th>丧假天数</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${page.list}" var="a">
						<tr>
							<td><input type="checkbox" name="aid" value="${a.id}"/></td>
							<td>${a.id}</td>
							<td>${a.xm }</td>
							<td>${a.bm }</td>
							<td>
								<fmt:formatDate value="${a.gcsj }" pattern="yyyy年MM月dd日"/>
							</td>
							<td>${a.wdkcs }</td>
							<td>${a.cdcs }</td>
							<td>${a.ztcs }</td>
							<td>${a.kgts }</td>
							<td>${a.sjts }</td>
							<td>${a.bjts }</td>
							<td>${a.cj_hljts }</td>
							<td>${a.hjts }</td>
							<td>${a.sjts1}</td>
							<td>
								<a href="" class="upd" data-toggle="modal" data-target="#empUpd">
									<span class="glyphicon glyphicon-edit"></span>
									修改
								</a>
								&nbsp;
								<a href="javascript:del(${a.id})">
									<span class="glyphicon glyphicon-trash"></span>
									删除
								</a>
							</td>
						</tr>
						</c:forEach>
					</table>
					<nav class="text-right">
						<ul class="pagination">
						    <li>
						      <a href="attendance/list?currentPage=${page.prev}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						   <c:forEach begin="1" end="${page.totalPage}" var="index">
						   		<c:choose>
						   			<c:when test="${page.currentPage eq index }">
									    <li class="active"><a href="#">${index }</a></li>
						   			</c:when>
						   			<c:otherwise>
									    <li><a href="attendance/list?currentPage=${index }">${index }</a></li>
						   			</c:otherwise>
						   		</c:choose>				   
						   </c:forEach>
						   
						    <li>
						      <a href="attendance/list?currentPage=${page.next}" aria-label="Next">
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
	
	<!--考勤添加模态框 -->
	<div class="modal fade" id="empAdd">
		<div class="modal-dialog">
			<form action="attendance/add" class="form-horizontal" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<h4>新增考勤</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-9">
							<input type="text" name="xm" class="form-control" placeholder="请输入员工姓名"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">院部(部门)</label>
						<div class="col-sm-9">
							<select name="bm" class="form-control">
								<option value="新闻传播学院">新闻传播学院</option>
								<option value="播音主持艺术学院">播音主持艺术学院</option>
								<option value="电影与电视学院">电影与电视学院</option>
								<option value="设计学院">设计学院</option>
								<option value="人文与艺术学院">人文与艺术学院</option>
								<option value="传媒技术学院">传媒技术学院</option>
								<option value="文化管理学院">文化管理学院</option>
								<option value="继续教育学院">继续教育学院</option>
								<option value="思政课部">思政课部</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">公出时间</label>
						<div class="col-sm-9">
							<input type="date" name="gcsj" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">忘打卡(次)</label>
						<div class="col-sm-9">
							<input type="number" name="wdkcs" class="form-control" placeholder="请输入忘打卡次数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">迟到(次)</label>
						<div class="col-sm-9">
							<input type="number" name="cdcs" class="form-control" placeholder="请输入迟到次数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">早退(次)</label>
						<div class="col-sm-9">
							<input type="number" name="ztcs" class="form-control" placeholder="请输入早退次数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">旷工(天)</label>
						<div class="col-sm-9">
							<input type="number" name="kgts" class="form-control" placeholder="请输入旷工天数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">事假(天)</label>
						<div class="col-sm-9">
							<input type="number" name="sjts" class="form-control" placeholder="请输入事假天数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">病假(天)</label>
						<div class="col-sm-9">
							<input type="number" name="bjts" class="form-control" placeholder="请输入病假天数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">产护理假(天)</label>
						<div class="col-sm-9">
							<input type="number" name="cj_hljts" class="form-control" placeholder="请输入产假/护理假天数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">婚假(天)</label>
						<div class="col-sm-9">
							<input type="number" name="hjts" class="form-control" placeholder="请输入婚假天数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">丧假(天)</label>
						<div class="col-sm-9">
							<input type="number" name="sjts1" class="form-control" placeholder="请输入丧假天数"/>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="submit">添加</button>
					<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	
	<!--修改模态框 -->
	<div class="modal fade" id="empUpd">
		<div class="modal-dialog">
			<form action="attendance/modify" class="form-horizontal" method="post">
			<input type="hidden" name="id" id="aid" value=""/>
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<h4>考勤信息修改</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-9">
							<p class="form-control-static aid"></p>
						</div>
					</div>
						<div class="form-group">
						<label for="" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-9">
							<input type="text" name="xm" id="xm" class="form-control" placeholder="请输入员工姓名"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">院部(部门)</label>
						<div class="col-sm-9">
							<select name="bm" id="bm" class="form-control">
								<option value="新闻传播学院">新闻传播学院</option>
								<option value="播音主持艺术学院">播音主持艺术学院</option>
								<option value="电影与电视学院">电影与电视学院</option>
								<option value="设计学院">设计学院</option>
								<option value="人文与艺术学院">人文与艺术学院</option>
								<option value="传媒技术学院">传媒技术学院</option>
								<option value="文化管理学院">文化管理学院</option>
								<option value="继续教育学院">继续教育学院</option>
								<option value="思政课部">思政课部</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">公出时间</label>
						<div class="col-sm-9">
							<input type="date" name="gcsj" id="gcsj" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">忘打卡(次)</label>
						<div class="col-sm-9">
							<input type="number" name="wdkcs" id="wdkcs" class="form-control" placeholder="请输入忘打卡次数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">迟到(次)</label>
						<div class="col-sm-9">
							<input type="number" name="cdcs" id="cdcs" class="form-control" placeholder="请输入迟到次数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">早退(次)</label>
						<div class="col-sm-9">
							<input type="number" name="ztcs" id="ztcs" class="form-control" placeholder="请输入早退次数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">旷工(天)</label>
						<div class="col-sm-9">
							<input type="number" name="kgts" id="kgts" class="form-control" placeholder="请输入旷工天数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">事假(天)</label>
						<div class="col-sm-9">
							<input type="number" name="sjts" id="sjts" class="form-control" placeholder="请输入事假天数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">病假(天)</label>
						<div class="col-sm-9">
							<input type="number" name="bjts" id="bjts" class="form-control" placeholder="请输入病假天数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">产护理假(天)</label>
						<div class="col-sm-9">
							<input type="number" name="cj_hljts" id="cj_hljts" class="form-control" placeholder="请输入产假/护理假天数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">婚假(天)</label>
						<div class="col-sm-9">
							<input type="number" name="hjts" id="hjts" class="form-control" placeholder="请输入婚假天数"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">丧假(天)</label>
						<div class="col-sm-9">
							<input type="number" name="sjts1" id="sjts1" class="form-control" placeholder="请输入丧假天数"/>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="submit">修改</button>
					<button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
				</div>
			</div>
			</form>
		</div>
	</div>	
	
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
		
		//修改
		$('.upd').on('click',function(){
			var tr = $(this).parents('tr');
			//将id存入隐藏域
			$('#aid').val($(tr).find('td:eq(1)').text());
			$('.aid').text($(tr).find('td:eq(1)').text())
			$('#xm').val($(tr).find('td:eq(2)').text());
			$('#bm').val($(tr).find('td:eq(3)').text());
			$('#gcsj').val($(tr).find('td:eq(4)').text());
			$('#wdkcs').val($(tr).find('td:eq(5)').text());
			$('#cdcs').val($(tr).find('td:eq(6)').text());
			$('#ztcs').val($(tr).find('td:eq(7)').text())
			$('#kgts').val($(tr).find('td:eq(8)').text())
			$('#sjts').val($(tr).find('td:eq(9)').text())
			$('#bjts').val($(tr).find('td:eq(10)').text())
			$('#cj_hljts').val($(tr).find('td:eq(11)').text())
			$('#hjts').val($(tr).find('td:eq(12)').text())
			$('#sjts1').val($(tr).find('td:eq(13)').text())
		})
	})
	
	//选中删除
	function del(id){
		layer.confirm('确认删除该考勤记录?',{
			btn:['确认','取消'],
			icon:3
		},function(){
			location.href='attendance/del?cp=${page.currentPage}&id='+id;
		})
	}
	</script>
</body>
</html>