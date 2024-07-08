package com.login.entity;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class employee {
	@Id
	@GeneratedValue (strategy = GenerationType.SEQUENCE)
	int employeeid;
	String employeename;
	String employeeaddress;
	long mobileno;
	String email;
	double salary;
	String password;
	String Gender;
	Date dob;
	Date doj;
	String role;
	String Department;
	String Photo;
	String status ="Inactive";
	public employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public employee(int employeeid, String employeename, String employeeaddress, long mobileno, String email,
			double salary, String password, String gender, Date dob, Date doj, String role, String department,
			String photo, String status) {
		super();
		this.employeeid = employeeid;
		this.employeename = employeename;
		this.employeeaddress = employeeaddress;
		this.mobileno = mobileno;
		this.email = email;
		this.salary = salary;
		this.password = password;
		Gender = gender;
		this.dob = dob;
		this.doj = doj;
		this.role = role;
		Department = department;
		Photo = photo;
		this.status = status;
	}
	public int getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(int employeeid) {
		this.employeeid = employeeid;
	}
	public String getEmployeename() {
		return employeename;
	}
	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}
	public String getEmployeeaddress() {
		return employeeaddress;
	}
	public void setEmployeeaddress(String employeeaddress) {
		this.employeeaddress = employeeaddress;
	}
	public long getMobileno() {
		return mobileno;
	}
	public void setMobileno(long mobileno) {
		this.mobileno = mobileno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Date getDoj() {
		return doj;
	}
	public void setDoj(Date doj) {
		this.doj = doj;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "employee [employeeid=" + employeeid + ", employeename=" + employeename + ", employeeaddress="
				+ employeeaddress + ", mobileno=" + mobileno + ", email=" + email + ", salary=" + salary + ", password="
				+ password + ", Gender=" + Gender + ", dob=" + dob + ", doj=" + doj + ", role=" + role + ", Department="
				+ Department + ", Photo=" + Photo + ", status=" + status + "]";
	}
	
}
