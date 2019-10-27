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
	 * ��̨������ҳ
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView("index");
	}
	
	/**
	 * ����Ա��¼
	 * @param admin
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView login(Admin admin,HttpSession session){
		Admin ad = adminService.login(admin);
		if(ad != null){
			if(ad.getStatus() == 1) {				
				//�������Ա��Ϣ
				session.setAttribute("user", ad);
				return new ModelAndView("index");
			}
			return new ModelAndView("login","msg","�˻�δ����");
		}
		return new ModelAndView("login","msg","�����˺�������˻�");
	}
	
	
	/**
	 * ��ӹ���Ա
	 * @param admin
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView add(Admin admin){
		boolean result = adminService.add(admin);
		return new ModelAndView("index","result",result);
	}
	
	
	/**
	 * �޸�����
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
				new ModelAndView("forward :logout","msg","�޸����,Ϊȷ���˻���ȫ,�����µ�½");
			}else {
				return new ModelAndView("redirect:list","msg","ԭʼ�����������");
			}
		}
		return new ModelAndView("login","msg","���½������");
	}
	
	/**
	 * �޸��˻�״̬
	 * @param admin
	 * @return
	 */
	@RequestMapping(value="/updateStatus",method=RequestMethod.GET)
	public ModelAndView updateStatus(Admin admin){
		boolean result = adminService.updateStatus(admin);
		return new ModelAndView("redirect:list","result",result);
	}
	
	/**
	 * ����Ա�б�
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView adminList(){
		List<Admin> list = adminService.findAll();
		return new ModelAndView("system","list",list);
	}
	
	/**
	 * ע��
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session){
		session.invalidate();
		return new ModelAndView("login");
	}

	
}
