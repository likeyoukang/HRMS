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
<title>武汉传媒学院人事管理系统-【薪资管理】</title>
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
						<a href="attendance/list" class="list-group-item"><span class="glyphicon  glyphicon-pencil"></span>&nbsp;考勤管理</a>
						<a href="salaryBase/list" class="list-group-item active"><span class="glyphicon  glyphicon-usd"></span>&nbsp;薪资管理</a>
						<a href="salaryBonus/list" class="list-group-item"><span class="glyphicon  glyphicon-yen"></span>&nbsp;福利管理</a>
						<a href="admin/list" class="list-group-item"><span class="glyphicon  glyphicon-cog"></span>&nbsp;系统管理</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="right col-xs-10">
			<ol class="breadcrumb">
			  <li><span class="glyphicon  glyphicon-usd"></span>&nbsp;薪资管理</li>
			</ol>
			<form action="salaryBase/delbatch" id="enos">
			<input type="hidden" name="cp" value="${page.currentPage}"/>
			<div class="panel panel-info">
				<div class="panel-heading">
					<button class="btn btn-primary" id="btnEmpAdd" type="button" data-toggle="modal" data-target="#empAdd">
						<span class="glyphicon glyphicon-plus"></span> 新增薪资
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
							<th>系部</th>
							<th>薪资小计</th>
							<th>学历补贴</th>
							<th>校龄津贴</th>
							<th>交通补贴</th>
							<th>通讯补贴</th>
							<th>加班补贴</th>
							<th>论文</th>
							<th>迟到扣款</th>
							<th>事假扣款</th>
							<th>旷工扣款</th>
							<th>应发工资</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${page.list}" var="a">
						<tr>
							<td><input type="checkbox" name="aid" value="${a.id}"/></td>
							<td>${a.id}</td>
							<td>${a.xm }</td>
							<td>${a.xb }</td>
							<td>${a.xjxj }</td> 
							<td>${a.xlbt }</td>
							<td>${a.xljt }</td>
							<td>${a.jtbt }</td>
							<td>${a.txbt }</td>
							<td>${a.jbbt }</td>
							<td>${a.lw }</td>
							<td>${a.cdkk }</td>
							<td>${a.sjkk }</td>
							<td>${a.kgkk}</td>
							<td>${a.yfgz}</td>
							<td>
								<a href="" class="upd" data-toggle="modal" data-target="#empUpd">
									<span class="glyphicon glyphicon-zoom-in"></span>
									详情
								</a>
								&nbsp;
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
						      <a href="salaryBase/list?currentPage=${page.prev}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						   <c:forEach begin="1" end="${page.totalPage}" var="index">
						   		<c:choose>
						   			<c:when test="${page.currentPage eq index }">
									    <li class="active"><a href="#">${index }</a></li>
						   			</c:when>
						   			<c:otherwise>
									    <li><a href="salaryBase/list?currentPage=${index }">${index }</a></li>
						   			</c:otherwise>
						   		</c:choose>				   
						   </c:forEach>
						   
						    <li>
						      <a href="salaryBase/list?currentPage=${page.next}" aria-label="Next">
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
	
	<!--薪资添加模态框 -->
	<div class="modal fade" id="empAdd">
		<div class="modal-dialog">
			<form action="salaryBase/add" class="form-horizontal" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<h4>新增薪资</h4>
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
							<select name="xb" class="form-control">
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
						<label for="" class="col-sm-2 control-label">薪资小计</label>
						<div class="col-sm-9">
							<input type="number" name="xjxj" class="form-control" placeholder="请输入薪资小计"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">学历补贴</label>
						<div class="col-sm-9">
							<input type="number" name="xlbt" class="form-control" placeholder="请输入学历补贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">校龄津贴</label>
						<div class="col-sm-9">
							<input type="number" name="xljt" class="form-control" placeholder="请输入校龄津贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">交通补贴</label>
						<div class="col-sm-9">
							<input type="number" name="jtbt" class="form-control" placeholder="请输入交通补贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">通讯补贴</label>
						<div class="col-sm-9">
							<input type="number" name="txbt" class="form-control" placeholder="请输入通讯补贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">加班补贴</label>
						<div class="col-sm-9">
							<input type="number" name="jbbt" class="form-control" placeholder="请输入加班补贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">论文</label>
						<div class="col-sm-9">
							<input type="number" name="lw" class="form-control" placeholder="请输入论文补贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">迟到扣款</label>
						<div class="col-sm-9">
							<input type="number" name="cdkk" class="form-control" placeholder="请输入迟到扣款"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">事假扣款</label>
						<div class="col-sm-9">
							<input type="number" name="sjkk" class="form-control" placeholder="请输入事假扣款"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">旷工扣款</label>
						<div class="col-sm-9">
							<input type="number" name="kgkk" class="form-control" placeholder="请输入旷工扣款"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">应发工资</label>
						<div class="col-sm-9">
							<input type="number" name="yfgz" class="form-control" placeholder="请输入应发工资"/>
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
			<form action="salaryBase/modify" class="form-horizontal" method="post">
			<input type="hidden" name="id" id="aid" value=""/>
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<h4>薪资修改</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-9">
							<input type="text" name="xm" id="xm" class="form-control" placeholder="请输入员工姓名"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">院部(部门)</label>
						<div class="col-sm-9">
							<select name="xb" id="xb" class="form-control">
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
						<label for="" class="col-sm-2 control-label">薪资小计</label>
						<div class="col-sm-9">
							<input type="number" name="xjxj" id="xjxj" class="form-control" placeholder="请输入薪资小计"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">学历补贴</label>
						<div class="col-sm-9">
							<input type="number" name="xlbt" id="xlbt" class="form-control" placeholder="请输入学历补贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">校龄津贴</label>
						<div class="col-sm-9">
							<input type="number" name="xljt" id="xljt" class="form-control" placeholder="请输入校龄津贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">交通补贴</label>
						<div class="col-sm-9">
							<input type="number" name="jtbt" id="jtbt" class="form-control" placeholder="请输入交通补贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">通讯补贴</label>
						<div class="col-sm-9">
							<input type="number" name="txbt" id="txbt" class="form-control" placeholder="请输入通讯补贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">加班补贴</label>
						<div class="col-sm-9">
							<input type="number" name="jbbt" id="jbbt" class="form-control" placeholder="请输入加班补贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">论文</label>
						<div class="col-sm-9">
							<input type="number" name="lw" id="lw" class="form-control" placeholder="请输入论文补贴"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">迟到扣款</label>
						<div class="col-sm-9">
							<input type="number" name="cdkk" id="cdkk" class="form-control" placeholder="请输入迟到扣款"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">事假扣款</label>
						<div class="col-sm-9">
							<input type="number" name="sjkk" id="sjkk" class="form-control" placeholder="请输入事假扣款"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">旷工扣款</label>
						<div class="col-sm-9">
							<input type="number" name="kgkk" id="kgkk" class="form-control" placeholder="请输入旷工扣款"/>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">应发工资</label>
						<div class="col-sm-9">
							<input type="number" name="yfgz" id="yfgz" class="form-control" placeholder="请输入应发工资"/>
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
			$('#xb').val($(tr).find('td:eq(3)').text());
			$('#xjxj').val($(tr).find('td:eq(4)').text());
			$('#xlbt').val($(tr).find('td:eq(5)').text());
			$('#xljt').val($(tr).find('td:eq(6)').text());
			$('#jtbt').val($(tr).find('td:eq(7)').text())
			$('#txbt').val($(tr).find('td:eq(8)').text())
			$('#jbbt').val($(tr).find('td:eq(9)').text())
			$('#lw').val($(tr).find('td:eq(10)').text())
			$('#cdkk').val($(tr).find('td:eq(11)').text())
			$('#sjkk').val($(tr).find('td:eq(12)').text())
			$('#kgkk').val($(tr).find('td:eq(13)').text())
			$('#yfgz').val($(tr).find('td:eq(14)').text())
		})
	})
	
	//选中删除
	function del(id){
		layer.confirm('确认删除该考勤记录?',{
			btn:['确认','取消'],
			icon:3
		},function(){
			location.href='salaryBase/del?cp=${page.currentPage}&id='+id;
		})
	}
	</script>
</body>
</html>