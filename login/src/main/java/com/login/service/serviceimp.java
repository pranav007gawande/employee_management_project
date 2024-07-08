package com.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.login.dao.daoint;
import com.login.entity.employee;

import jakarta.servlet.http.HttpSession;
@Service
public class serviceimp implements service {

	@Autowired
	daoint daoint;
	@Override
	public employee loginpage(employee emp) {
		// TODO Auto-generated method stub
		employee emp1=daoint.loginpage(emp);
		return emp1;
	}
	
	@Override
	public employee saveEmployee(employee emp) {
		
		employee employee=daoint.saveEmployee(emp);

		return employee;
	}
	
	@Override
	public List<employee> empList() {
		List<employee> employees=daoint.empList();
		return employees;
	}

	@Override
	public employee getempbyId(int employeeid) {
		// TODO Auto-generated method stub
//		System.out.println("in service");
		employee employee=daoint.getempbyId(employeeid);
		return employee;
	}

	@Override
	public boolean deleteEmp(int employeeid) {
		// TODO Auto-generated method stub
		boolean msg=daoint.deleteEmp(employeeid);
		return msg;
	}

	@Override
	public employee updateEmp(employee emp) {
		// TODO Auto-generated method stub
		System.out.println("in service");
		employee emp1=daoint.updateEmp(emp);
		return emp1;
	}

	@Override
	public void logout(HttpSession session, int id) {
		// TODO Auto-generated method stub
		daoint.logout(session, id);
		session.invalidate();
	}

    
	


}
