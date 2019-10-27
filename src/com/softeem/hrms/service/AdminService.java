package com.softeem.hrms.service;

import java.util.List;

import com.softeem.hrms.entity.Admin;

public interface AdminService {


	Admin login(Admin admin);
	

	boolean add(Admin admin);
	

	boolean updatePwd(Admin admin);
	

	boolean updateStatus(Admin admin);

	List<Admin> findAll();
	
}
