package com.gss.service;

import java.util.List;

import com.gss.model.Employee;
import com.gss.model.EmployeeCategory;

public interface EmployeeService {
	

	public boolean create(Employee emp);
	
	public List<Employee> getAllEmployees();
	
	public Employee getEmployeeByUserPass(String username, String password);
	
	public Employee getEmployeeByName();
	
	public boolean updateEmployee(Employee emp);
	
	public List<EmployeeCategory> getAllCategory();
	

}
