package com.login.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.login.entity.employee;

import jakarta.servlet.http.HttpSession;
@Repository
public class daoimp implements daoint {

	@Autowired
	SessionFactory sf;
	@Override
	public employee loginpage(employee emp) {
		// TODO Auto-generated method stub
		employee emp1=null;
		Session Session=sf.openSession();
		Transaction tx=Session.beginTransaction();
		try {
			Query Qurey=Session.createQuery("from employee where email=:email and password=:password");
			Qurey.setParameter("email", emp.getEmail());	
			Qurey.setParameter("password", emp.getPassword());
			List<employee> list=Qurey.list();
			if(!list.isEmpty())
			{
			    emp1=list.get(0);
				emp1.setStatus("Active");
				Session.update(emp1);
				tx.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			Session.close();
		}
		return emp1;
	}
	
	@Override
	public employee saveEmployee(employee emp) {
		
		employee employee =null;
		Session ses=sf.openSession();
		Transaction tx=ses.beginTransaction();
		try {
			ses.save(emp);
			tx.commit();
			employee=emp;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			ses.close();
		}
		return employee;

	}
	
	@Override
	public List<employee> empList() {
		List <employee> emp=null;
		Session ses=sf.openSession();
	
		try {
			Query query=ses.createQuery("from employee");
			List<employee>list=query.list();
			emp=list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			ses.close();
		}
		return emp;
	}

	@Override
	public employee getempbyId(int employeeid) {
		// TODO Auto-generated method stub
//		System.out.println("in dao");
		employee emp=null;
		Session ses=sf.openSession();
		employee emp1=ses.get(employee.class,employeeid);
		try {
			ses.save(emp1);
			emp=emp1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			ses.close();
		}
		return emp;
	}
	
	@Override
	public boolean deleteEmp(int employeeid) {
		// TODO Auto-generated method stub
		boolean msg=false;
		Session Ses=sf.openSession();
		Transaction tx=Ses.beginTransaction();
		employee emp=Ses.get(employee.class,employeeid);
		try {
			Ses.delete(emp);
			tx.commit();
			msg=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			Ses.close();
		}
		return msg;
	}

	@Override
	public employee updateEmp(employee emp) {
		System.out.println("in dao");
			employee emp1=null;
			 Session Ses=sf.openSession();
			 Transaction tx=Ses.beginTransaction();
			
			try {
			
				Ses.update(emp);
				tx.commit();
				emp1=emp;
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				Ses.close();
			}
			return emp1;
			
		
	}

	@Override
	public void logout(HttpSession session, int id) {
		// TODO Auto-generated method stub
		
		employee emp=getempbyId(id);
		emp.setStatus("Inactive");
		updateEmp(emp);
	
		 
	}
	
}
