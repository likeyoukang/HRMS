package com.softeem.hrms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.softeem.hrms.dao.AttendanceMapper;
import com.softeem.hrms.dto.PageModel;
import com.softeem.hrms.entity.Attendance;
import com.softeem.hrms.service.AttendanceService;
import com.softeem.hrms.utils.PageUtils;

/**
 * 
 * @author MR.²ñ
 *
 */
@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceMapper attendanceMapper;

	@Override
	public boolean add(Attendance attendance) {
		int row = attendanceMapper.insert(attendance);
		return row > 0;
	}

	@Override
	public boolean update(Attendance attendance) {
		int row = attendanceMapper.updateByPrimaryKeySelective(attendance);
		return row > 0;
	}

	@Override
	public Attendance queryById(int id) {
		return attendanceMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageModel queryByPage(PageModel pm) {
		List<Attendance> list = attendanceMapper.selectAll();
		//·ÖÒ³´¦Àí
		return PageUtils.handler(pm, list);
	}

	@Override
	public boolean deleteById(int id) {
		int row = attendanceMapper.deleteByPrimaryKey(id);
		return row > 0;
	}

}
