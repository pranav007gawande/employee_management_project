package com.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@RestController
public class page {
	
	
	@GetMapping(value="/addEmployee")
	public ModelAndView addemployee(HttpSession ses, Model model)
	{
		String status=(String)ses.getAttribute("status");
		if(status!=null)
		{
			
			return new ModelAndView("addemployee") ;
		}
		else
		{
			model.addAttribute("msg","Please Login First");
			return new ModelAndView("login") ;
		}
		
	
	
	}
	
	@GetMapping(value="/Profile")
	public ModelAndView profile()
	{
		return new ModelAndView ("profile");
	
	}
	
	
}
