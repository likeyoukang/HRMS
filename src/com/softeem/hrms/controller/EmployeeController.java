package com.softeem.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Employee;
import com.softeem.hrms.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView createEmployee(Employee employee) {
		boolean result = employeeService.add(employee);
		return new ModelAndView("employee","result",result);
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView findAllEmployee(@RequestParam(required=false)Integer pageSize,Integer currentPage) {
		pageSize = pageSize ==null ? 15 : pageSize;
		currentPage = currentPage ==null ? 1 : currentPage;
		PageModel pm = new PageModel();
		pm.setPageSize(pageSize);
		pm.setCurrentPage(currentPage);
		pm = employeeService.queryByPage(pm);
		return new ModelAndView("employee","page",pm);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public ModelAndView modifyEmployee(Employee employee) {
		boolean result = employeeService.update(employee);
		return new ModelAndView("employee", "result",result);
	}
	
	@RequestMapping(value="/del",method=RequestMethod.GET)
	public String delEmployee(Model model,Integer id,Integer cp) {
		boolean result = employeeService.deleteById(id);
		model.addAttribute("result", result);
		return "redirect:/employee/list?currentPage="+cp;
	}
	
	@RequestMapping(value="/delbatch",method=RequestMethod.GET)
	public String delBatchEmployee(Model model,Integer[] aid,Integer cp) {
		for (Integer id : aid) {
			employeeService.deleteById(id);
		}
		return "redirect:/employee/list?currentPage="+cp;
	}
}
