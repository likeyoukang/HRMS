package com.softeem.hrms.controller;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.hrms.entity.Admin;
import com.softeem.hrms.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	
	/**
	 * 后台管理首页
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView("index");
	}
	
	/**
	 * 管理员登录
	 * @param admin
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView login(Admin admin,HttpSession session){
		Admin ad = adminService.login(admin);
		if(ad != null){
			if(ad.getStatus() == 1) {				
				//缓存管理员信息
				session.setAttribute("user", ad);
				return new ModelAndView("index");
			}
			return new ModelAndView("login","msg","账户未启用");
		}
		return new ModelAndView("login","msg","请检查账号密码和账户");
	}
	
	
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView add(Admin admin){
		boolean result = adminService.add(admin);
		return new ModelAndView("index","result",result);
	}
	
	
	/**
	 * 修改密码
	 * @param admin
	 * @return
	 */
	@RequestMapping(value="/updatePwd",method=RequestMethod.POST)
	public ModelAndView updatePwd(@RequestParam("oldpwd")String oldpwd,@RequestParam("newpwd")String newpwd,HttpSession session){
		Object obj = session.getAttribute("user");
		if(obj != null) {
			Admin ad = (Admin)obj;
			if(Objects.equals(ad.getUser_pwd(), oldpwd)) {
				ad.setUser_pwd(newpwd);
				boolean result = adminService.updatePwd(ad);
				new ModelAndView("forward :logout","msg","修改完成,为确保账户安全,请重新登陆");
			}else {
				return new ModelAndView("redirect:list","msg","原始密码输入错误");
			}
		}
		return new ModelAndView("login","msg","请登陆后再试");
	}
	
	/**
	 * 修改账户状态
	 * @param admin
	 * @return
	 */
	@RequestMapping(value="/updateStatus",method=RequestMethod.GET)
	public ModelAndView updateStatus(Admin admin){
		boolean result = adminService.updateStatus(admin);
		return new ModelAndView("redirect:list","result",result);
	}
	
	/**
	 * 管理员列表
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView adminList(){
		List<Admin> list = adminService.findAll();
		return new ModelAndView("system","list",list);
	}
	
	/**
	 * 注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session){
		session.invalidate();
		return new ModelAndView("login");
	}

	
}
