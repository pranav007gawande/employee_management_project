package com.login.service;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.login.entity.employee;

import jakarta.servlet.http.HttpSession;

public interface service {

	public employee loginpage(employee emp);
	
	public employee saveEmployee(employee emp);
	
	public List<employee> empList();
	
	public employee getempbyId( int employeeid);
	
	public boolean deleteEmp(int employeeid);
	
	public employee updateEmp(employee emp);
	
	public void logout(HttpSession session, int id);
}
