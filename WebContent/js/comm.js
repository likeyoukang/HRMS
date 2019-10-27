//安全退出
function logout(){
	layer.confirm('确认退出系统?',{
		btn:['确定','取消'],   
		icon:3				 
	},function(){
		location.replace('admin/logout');
	});
}