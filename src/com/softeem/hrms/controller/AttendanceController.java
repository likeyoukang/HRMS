package com.softeem.hrms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Attendance;
import com.softeem.hrms.service.AttendanceService;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
	
	/**
	 * ��ӿ�����Ϣ
	 * @param attendance
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView createAttendance(Attendance attendance) {
		boolean result = attendanceService.add(attendance);
		return new ModelAndView("redirect:list","result",result);
	}
	
	/**
	 * �б���ʾ������Ϣ
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView findAllAttendance(@RequestParam(required=false)Integer pageSize,Integer currentPage) {
		//��ʼÿҳ5������
		pageSize = pageSize ==null ? 15 : pageSize;
		//��ʼ��ʾ��һҳ
		currentPage = currentPage ==null ? 1 : currentPage;
		PageModel pm = new PageModel();
		pm.setPageSize(pageSize);
		pm.setCurrentPage(currentPage);
		pm = attendanceService.queryByPage(pm);
		return new ModelAndView("attendance","page",pm);
	}
	
	/**
	 * �޸Ŀ�����Ϣ
	 * @param attendance
	 * @return
	 */
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public ModelAndView modifyAttendance(Attendance attendance) {
		boolean result = attendanceService.update(attendance);
		return new ModelAndView("attendance", "result",result);
	}
	
	/**
	 * ɾ��������Ϣ
	 * @param attendance
	 * @return
	 */
	@RequestMapping(value="/del",method=RequestMethod.GET)
	public String delAttendance(Model model,Integer id,Integer cp) {
		boolean result = attendanceService.deleteById(id);
		model.addAttribute("result", result);
		return "redirect:list?currentPage="+cp;
	}
	
	/**
	 * ����ɾ��������Ϣ
	 * @param attendance
	 * @return
	 */
	@RequestMapping(value="/delbatch",method=RequestMethod.GET)
	public String delBatchAttendance(Model model,Integer[] aid,Integer cp) {
		for (Integer id : aid) {
			attendanceService.deleteById(id);
		}
		return "redirect:list?currentPage="+cp;
	}
}
