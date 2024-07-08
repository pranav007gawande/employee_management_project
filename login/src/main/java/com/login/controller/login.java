package com.login.controller;

import java.io.IOException;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.login.entity.employee;
import com.login.service.service;

import jakarta.servlet.http.HttpSession;

@RestController
public class login {

	@Autowired
	service service;
	
	@GetMapping("/")
	public ModelAndView login()
	{
		return new ModelAndView ("login");
		
	}
	
	@PostMapping(value="/loginpage")
	public ModelAndView loginpage(@ModelAttribute employee emp, HttpSession session)
	{
	 employee employeeData = service.loginpage(emp);
		
		employee emp1=service.loginpage(emp);
		if(emp1!=null)
		{
			
			session.setAttribute("name",employeeData.getEmployeename());
			session.setAttribute("id",employeeData.getEmployeeid());
			session.setAttribute("role",employeeData.getRole());
			session.setAttribute("status",employeeData.getStatus());
			
			return new ModelAndView("home"); 
		}
		else
		{
			return new ModelAndView("login","msg","invalid Email or password");
		}
		
		
	}
	
	@GetMapping(value="/home")
	public ModelAndView home(HttpSession ses, Model model)
	{
		String status=(String)ses.getAttribute("status");
		if(status!=null)
		{
			
			return new ModelAndView ("home");
		}
		else
		{
			model.addAttribute("msg","Please Login First");
			return new ModelAndView ("login");
		}
		
	}
	@PostMapping(value="/saveEmployee")
	public ModelAndView saveEmployee(@ModelAttribute employee emp,  @RequestParam("Pic") MultipartFile file)
	{
		
        System.out.println("hhhh"+file.getOriginalFilename());
		
		if(file!=null&&!file.isEmpty())
		{
			
			String photoName=genrateUniqeFileName(file.getOriginalFilename());
			System.out.println(photoName);
			emp.setPhoto(photoName);
			try {
				Files.copy(file.getInputStream(),Paths.get("src/main/WebApp/resources/uploads").resolve(photoName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		
		System.out.println(emp);
		employee employee=service.saveEmployee(emp);
		if(employee!=null)
		{
			return new ModelAndView("redirect:/emplist");
		}
		else {
			return new ModelAndView("redirect:/emplist");
		}
	}
	
	public String genrateUniqeFileName(String fileName )
	{
		String baseName=FilenameUtils.getBaseName(fileName);
		String getExtenssion=FilenameUtils.getExtension(fileName);
		String timeStamp=String.valueOf(System.currentTimeMillis());
		return baseName+"_"+timeStamp+"."+getExtenssion;
		
	}

	@GetMapping(value="/emplist")
	public ModelAndView emplist(HttpSession session, Model model)
	{
		String status=(String)session.getAttribute("status");	
	   List<employee> employees= service.empList();
//		System.out.println(employees);
		
//		for(employee emp:employees)
//		{
//			System.out.println(emp);
//		}
	   if(status!=null)
		{
			
		   return new ModelAndView("employeeList","list",employees);
		}
		else
		{
			model.addAttribute("msg","Please Login First");
			return new ModelAndView ("login");
		}
	   
		
	}
	
	@GetMapping(value="/getEmpById/{employeeid}")
	public employee getempByid(@PathVariable int employeeid)
	{
	   employee st=service.getempbyId(employeeid);
//	  System.out.println("in controller");
	  return st;
	   
	}
	
	@RequestMapping(value="/deleteEmpbyid/{employeeid}")
	public ModelAndView deleteEmp(@ PathVariable int employeeid)
	{
		boolean msg=service.deleteEmp(employeeid);
		if(msg==true)
		{
			return new ModelAndView("redirect:/emplist");
		}
		else {
			return new ModelAndView("redirect:/emplist");
		}
	}
	
	@RequestMapping(value="/updateEmp")
	public ModelAndView updateEmp(@ModelAttribute employee emp, @RequestParam("Pic") MultipartFile file)
	{
		if(file!=null&&!file.isEmpty())
		{
			
			String photoName=genrateUniqeFileName(file.getOriginalFilename());
			System.out.println(photoName);
			emp.setPhoto(photoName);
			try {
				Files.copy(file.getInputStream(),Paths.get("src/main/WebApp/resources/uploads").resolve(photoName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		System.out.println("after"+emp);
		System.out.println("in controller");
		employee employee=service.updateEmp(emp);
		System.out.println("before"+emp);

		if(employee!=null)
		{
			return new ModelAndView("redirect:/emplist");
		}
		else {
			return new ModelAndView("redirect:/emplist");
		}
		
	}
	
	@GetMapping(value="/getEmployeeById/{employeeid}")
	public ModelAndView  getEmployeeById(@PathVariable int employeeid,HttpSession session,Model model)
	{
	   employee emp=service.getempbyId(employeeid);
	   
	   String status=(String)session.getAttribute("status");	
//	  System.out.println("in controller");
	   if(status!=null)
		{
			
		   return new ModelAndView ("profile","emp",emp);
		}
		else
		{
			model.addAttribute("msg","Please Login First");
			return new ModelAndView ("login");
		}
	    
	 
	   
	}
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session,@RequestParam int eid)
	{
		service.logout(session, eid);
		return new ModelAndView("login");
	}
}
