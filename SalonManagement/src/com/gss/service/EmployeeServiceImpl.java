package com.gss.service;

import java.util.List;

import com.gss.dao.EmployeeJDBCRepository;
import com.gss.dao.EmployeeRepository;
import com.gss.model.Employee;
import com.gss.model.EmployeeCategory;

public class EmployeeServiceImpl implements EmployeeService{
	
	public boolean create(Employee emp){
		
		EmployeeRepository repo = new EmployeeJDBCRepository();
		boolean isRecorded = repo.createEmployee(emp);
		
		return isRecorded;
	}
	
	public List<Employee> getAllEmployees(){
		
		EmployeeRepository repo = new EmployeeJDBCRepository();
		
		return repo.getAllEmployee();
	}
	
	public Employee getEmployeeByUserPass(String username, String password){
		
		EmployeeRepository repo = new EmployeeJDBCRepository();
		System.out.println();
		return repo.getEmployeeByUserPass(username, password);
	}
	
	public Employee getEmployeeByName(){
		
		EmployeeRepository repo = new EmployeeJDBCRepository();
		
		return repo.getEmployeeByName();
	}
	
	public boolean updateEmployee(Employee emp){
		
		EmployeeRepository repo = new EmployeeJDBCRepository();
		
		return repo.updateEmployee(emp);
	}
	
	public List<EmployeeCategory> getAllCategory(){
		
		EmployeeRepository repo = new EmployeeJDBCRepository();
				
		return repo.getAllCategory();

	}
}
