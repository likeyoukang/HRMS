package com.softeem.hrms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.softeem.hrms.dao.AdminMapper;
import com.softeem.hrms.entity.Admin;
import com.softeem.hrms.service.AdminService;

/**
 * @author MR.ÖÜ
 *
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminMapper;
	

	@Override
	public Admin login(Admin admin) {
		Admin ad = adminMapper.selectByAdmin(admin);
		return ad;
	}

	@Override
	public boolean add(Admin admin) {
		admin.setStatus(0);
		int i = adminMapper.insert(admin);
		if(i>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updatePwd(Admin admin) {
		admin.setStatus(1);
		int i = adminMapper.updateByPrimaryKey(admin);
		if(i>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateStatus(Admin admin) {
		Admin ad = adminMapper.selectByPrimaryKey(admin.getId());
		ad.setStatus(admin.getStatus());
		int i = adminMapper.updateByPrimaryKey(ad);
		if(i>0){
			return true;
		}
		return false;
	}

	@Override
	public List<Admin> findAll() {
		return adminMapper.selectAll();
	}

}
