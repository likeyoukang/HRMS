package com.softeem.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Candidate;
import com.softeem.hrms.entity.Employee;
import com.softeem.hrms.service.CandidateService;
import com.softeem.hrms.service.EmployeeService;

@Controller
@RequestMapping("/candidate")
public class CandidateController {
	
	@Autowired
	private  CandidateService candidateService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView createCandidate(Candidate candidate) {
		boolean result = candidateService.add(candidate);
		return new ModelAndView("redirect:list","result",result);
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView findAllCandidate(@RequestParam(required=false)Integer pageSize,Integer currentPage) {
		pageSize = pageSize ==null ? 15 : pageSize;
		currentPage = currentPage ==null ? 1 : currentPage;
		PageModel pm = new PageModel();
		pm.setPageSize(pageSize);
		pm.setCurrentPage(currentPage);
		pm = candidateService.queryByPage(pm);
		return new ModelAndView("candidate","page",pm);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public ModelAndView modifyCandidate(Candidate candidate) {
		boolean result = candidateService.update(candidate);

		if(candidate.getSfdg()==1){
			Employee employee = new Employee();
			employee.setXm(candidate.getXm());
			employee.setRzrq(candidate.getDgsj());
			employee.setZg_xl(candidate.getXl());
			employeeService.add(employee);
		}
		return new ModelAndView("candidate", "result",result);
	}
	
	@RequestMapping(value="/del",method=RequestMethod.GET)
	public String delCandidate(Model model,Integer id,Integer cp) {
		boolean result = candidateService.deleteById(id);
		model.addAttribute("result", result);
		return "redirect:/candidate/list?currentPage="+cp;
	}
	
	@RequestMapping(value="/delbatch",method=RequestMethod.GET)
	public String delBatchCandidate(Model model,Integer[] aid,Integer cp) {
		for (Integer id : aid) {
			candidateService.deleteById(id);
		}
		return "redirect:/candidate/list?currentPage="+cp;
	}

}
