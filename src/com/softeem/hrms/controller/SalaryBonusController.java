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
import com.softeem.hrms.entity.SalaryBonus;
import com.softeem.hrms.service.SalaryBonusService;

@Controller
@RequestMapping("/salaryBonus")
public class SalaryBonusController {

	@Autowired
	private SalaryBonusService salaryBonusService;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView createSalaryBase(SalaryBonus salaryBonus) {
		boolean result = salaryBonusService.add(salaryBonus);
		return new ModelAndView("redirect:list","result",result);
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView findAllSalaryBonus(@RequestParam(required=false)Integer pageSize,Integer currentPage) {
		pageSize = pageSize ==null ? 15 : pageSize;
		currentPage = currentPage ==null ? 1 : currentPage;
		PageModel pm = new PageModel();
		pm.setPageSize(pageSize);
		pm.setCurrentPage(currentPage);
		pm = salaryBonusService.queryByPage(pm);
		return new ModelAndView("salary_bonus","page",pm);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public ModelAndView modifySalaryBase(SalaryBonus salaryBonus) {
		boolean result = salaryBonusService.update(salaryBonus);
		return new ModelAndView("salary_bonus", "result",result);
	}
	
	@RequestMapping(value="/del",method=RequestMethod.GET)
	public String delSalaryBase(Model model,Integer id,Integer cp) {
		boolean result = salaryBonusService.deleteById(id);
		model.addAttribute("result", result);
		return "redirect:/salaryBonus/list?currentPage="+cp;
	}
	
	@RequestMapping(value="/delbatch",method=RequestMethod.GET)
	public String delBatchSalaryBase(Model model,Integer[] aid,Integer cp) {
		for (Integer id : aid) {
			salaryBonusService.deleteById(id);
		}
		return "redirect:/salaryBonus/list?currentPage="+cp;
	}
}
