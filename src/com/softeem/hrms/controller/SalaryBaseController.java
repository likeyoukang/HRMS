package com.softeem.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.SalaryBase;
import com.softeem.hrms.service.SalaryBaseService;

@Controller
@RequestMapping("/salaryBase")
public class SalaryBaseController {
	
	@Autowired
	private SalaryBaseService salaryBaseService;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView createSalaryBase(SalaryBase salaryBase) {
		boolean result = salaryBaseService.add(salaryBase);
		return new ModelAndView("redirect:list","result",result);
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView findAllSalaryBase(@RequestParam(required=false)Integer pageSize,Integer currentPage) {
		pageSize = pageSize ==null ? 15 : pageSize;
		currentPage = currentPage ==null ? 1 : currentPage;
		PageModel pm = new PageModel();
		pm.setPageSize(pageSize);
		pm.setCurrentPage(currentPage);
		pm = salaryBaseService.queryByPage(pm);
		return new ModelAndView("salary_base","page",pm);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public ModelAndView modifySalaryBase(SalaryBase salaryBase) {
		boolean result = salaryBaseService.update(salaryBase);
		return new ModelAndView("salary_base", "result",result);
	}
	
	@RequestMapping(value="/del",method=RequestMethod.GET)
	public String delSalaryBase(Model model,Integer id,Integer cp) {
		boolean result = salaryBaseService.deleteById(id);
		model.addAttribute("result", result);
		return "redirect:/salaryBase/list?currentPage="+cp;
	}
	
	@RequestMapping(value="/delbatch",method=RequestMethod.GET)
	public String delSalaryBase(Model model,Integer[] aid,Integer cp) {
		for (Integer id : aid) {
			salaryBaseService.deleteById(id);
		}
		return "redirect:/salaryBase/list?currentPage="+cp;
	}
}
